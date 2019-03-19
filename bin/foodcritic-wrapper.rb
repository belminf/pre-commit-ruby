#!/usr/bin/env ruby
# frozen_string_literal: true

require 'fileutils'

# Exit early if there are no paths to lint
exit(true) if ARGV.empty?

# Install foodcritic and drop args that are paths
system('bundle install >/dev/null') || exit(false)

# Remove duplicates and run rspec in alphabetical order against directories
system("bundle exec foodcritic #{ARGV.join(' ')}") || exit(false)
