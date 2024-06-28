#!/usr/bin/env rake
# encoding: utf-8

#  Copyright (c) 2012-2016, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

ENGINE_PATH = File.expand_path('..', __FILE__)
load File.expand_path('../app_root.rb', __FILE__)

load 'wagons/wagon_tasks.rake'

load 'rspec/rails/tasks/rspec.rake'

require 'ci/reporter/rake/rspec' unless Rails.env.production?

HitobitoDsj::Wagon.load_tasks