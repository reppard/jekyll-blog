#!/usr/bin/env ruby
require 'optparse'
require 'ostruct'
require 'yaml'

EDITOR = "vim --cmd ':set spell spelllang=en_us'"

class ParseOptions
  def self.parse(args)
    options = OpenStruct.new
    options.title = "Untitled"
    time = Time.new
    options.time = time.strftime("%Y-%m-%d %H:%M:%S")
    options.stamp = time.strftime("%H%M%S")
    options.date = time.strftime("%Y-%m-%d")
    opts = OptionParser.new do |opts|
      opts.banner = "Usage: new_post.rb [options]"
      opts.separator ""
      opts.separator "Options:"

      opts.on("-t", "--title TITLE", "Supply Post Title") do |t|
        options.title = t
      end

      opts.on("-c", "--content <file>", "Supply Post Content") do |c|
        options.content = c
      end
    end

    opts.on_tail("-h", "--help", "Show this message") do
      puts opts
      exit
    end

    opts.parse!(args)
    options

  end
end

class Post
  def self.build(options,filename)
    header = build_header(options)
     if options.content && File.exist?(options.content)
       content = File.read(options.content)
       file = File.new("_posts/#{filename}", "w")
       file.write(header+content)
       file.close
     else
       build_content(header,filename)
     end
  end

  def self.build_header(options)
    "---\nlayout:  post\ntitle:  #{options.title}\ndate:  #{options.time}\ncategories:\n---\n\n"
  end

  def self.build_content(header,filename)
    tmpfile = "/tmp/tmp-#{filename}"
    system("echo '#{header}' > #{tmpfile}")
    system("#{EDITOR} #{tmpfile}")
    if filename =~ /Untitled/
      getYaml = YAML.load_file("#{tmpfile}")
      new_filename = filename.gsub("Untitled","#{getYaml["title"].gsub(' ','-')}")
      system("cp #{tmpfile} _posts/#{new_filename} && rm #{tmpfile}")
    else
      system("cp #{tmpfile} _posts/#{filename} && rm #{tmpfile}")
    end
  end

end

options = ParseOptions.parse(ARGV)
filename = "#{options.date}-#{options.title.gsub(' ','-')}-#{options.stamp}.markdown"
post = Post.build(options,filename)

system("./deploy")
puts "All done!"

