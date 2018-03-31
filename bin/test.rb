#!/usr/bin/env ruby
# frozen_string_literal: true

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'eclaircir'
require 'byebug'

c = Eclaircir::Client.new(Eclaircir.configuration.api_key)

input = Eclaircir::Input.from_url('https://samples.clarifai.com/metro-north.jpg')
model = Eclaircir::Model.new(id: 'aaa03c23b3724a16a56b629203edc62c')
# response = model.predict_outputs(url: 'https://samples.clarifai.com/metro-north.jpg')
response = model.predict_outputs(input: input)

# response = c.predict_outputs(model, input)
puts response.inspect