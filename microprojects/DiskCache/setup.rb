#!ruby

basedir = File.dirname(__FILE__)
$:.push(basedir)

require 'external/package'
require 'rbconfig'
begin
	require 'rubygems'
rescue LoadError
end

Dir.chdir(basedir)
Package.setup("1.0") {
	name "Iowa::LinkedList"

	translate(:lib, 'src/' => '')
	lib *Dir["src/iowa/**/*.rb"]
	ri *Dir["src/iowa/**/*.rb"]

	unit_test ["test/TC_DiskCache.rb"]
}
