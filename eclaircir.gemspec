# frozen_string_literal: true

require_relative 'lib/eclaircir/version'

Gem::Specification.new do |s|
  s.name = 'eclaircir'
  s.version = Eclaircir::VERSION
  s.summary = 'Clarifai APIv2 Client'
  s.description = 'Ruby Clarifai API wrapper that aims to be complete, tested and covered'
  s.authors = ['Karim Bogtob']
  s.email = 'kabogtob@gmail.com'
  s.homepage = 'https://github.com/kbogtob/eclaircir'
  s.license = 'MIT'

  s.files = `git ls-files`.split("\n")

  s.add_dependency 'httparty', ['~> 0.14.0']
end