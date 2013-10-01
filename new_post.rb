#!/bin/env ruby
require 'optparse'
require 'ostruct'


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
  def self.build(options)
    header = build_header(options)
    if File.exist?(options.content)
      content = File.read(options.content)
    else
      puts "File not found: #{options.content}"
      exit
    end
    header+content
  end

  def self.build_header(options)
    "---\nlayout:  post\ntitle:  #{options.title}\ndate:  #{options.time}\ncategories:\n---\n\n"
  end

end


options = ParseOptions.parse(ARGV)

if options.content == nil
  p "File name required."
  exit
end

filename = "#{options.date}-#{options.title.gsub(' ','-')}-#{options.stamp}.markdown"
post = Post.build(options)
file = File.new("_posts/#{filename}","w")
file.write(post)
file.close
system("./deploy")
puts "All done!"

