---
layout:  post
title:  First Post With Updated Script
date:  2013-10-01 21:18:33
categories:
---

I started playing with Jekyll yesterday and I love it.  What a great, simplistic tool to build a blog with.  I had originally planned to build a blog engine in Sinatra before I stumbled across Jekyll.  The two big pluses for me are the fact that I don't have to setup/maintain a database and I can run it easily on-top of Apache. Win win!

So after I read a bit about how Jekyll works, installed it, and generated my new blog, I immediately wanted a way to create posts easily.  The result is the hack job you see [HERE](https://github.com/reppard/jekyll-blog/blob/master/new_post.rb).  You can specify your editor of choice by changing the `EDITOR` constant.  While `vi` is my editor of preferred editor, I wanted to give a GTK option a try.  Eventually I will make this the env variable `$EDITOR` unless otherwise specified.  I may even try and clean this up and make a gem out of it.  Feel free to try it and/or give me some input or suggestions.

Well thats it for now.  After I save this document and close the editor, it should automatically create the post in `_posts` and rebuild on the fly!  Here goes nothing!

Reppard


