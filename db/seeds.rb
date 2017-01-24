# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

files = [
  "categories",

  "papers",
  "people",

  "authors",
  "reviews"
]
$LOAD_PATH << File.join('db', 'seeds')


files.each { |file|
  puts "Loading #{file}..."
  require "#{file}"
}
