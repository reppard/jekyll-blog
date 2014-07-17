#!/bin/bash ruby

require 'os'

deploy_path = OS.linux? ? "/var/www/html" : "/Library/WebServer/Documents"

system("jekyll build --destination #{deploy_path}")
