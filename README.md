# Clarifier
Clarifier is a french word for 'Clarify' and seemed relevant as a name for the gem.

This gem aims to be a Clarifai APIv2 wrapper that is complete, tested and covered.

## Install

```sh
gem install clarifier
```

## Requirements
* Ruby 2.0.0 or higher
* HTTParty
* Virtus

## Examples

...

## Contributing
* Fork the project
* Run `bundle install --path .bundle`
* Run `bundle exec rake spec`
* Add tests for your feature (the TDD way!)
* Implement your feature
* Run tests again
* Commit (excluding the `Rakefile` or the `Version.rb` if you want to be merged)
* Send a pull request

## How can I help?

The Roadmap for V1 is to provide a completely usable API wrapper to do common tasks on Clarifai.

Here's an extract from the TODO:

# V1.0
[ ] Authentication
  [ ] API Key Management
  [ ] Authorization
[ ] Status Management
  [ ] Modelization: Response
  [ ] Modelization: Status
  [ ] Modelization: Output
  [ ] General Errors
  [ ] Specific Errors
  [ ] Response Parsing
[ ] Predict
  [ ] Modelization: Input
  [ ] Modelization: Data
  [ ] Modelization: Concept
  [ ] Modelization: Model
  [ ] Support URL Requests for Images
  [ ] Response Parsing
  [ ] Support base 64 Requests for Images
  [ ] Support of multiple inputs (max 128)
  [ ] Modelization: Frame
  [ ] Video support
[ ] Search
  [ ] Add Images to search index
  [ ] Search by concept
  [ ] Search by image
[ ] Train
  [ ] Add image with concepts
  [ ] Model Creation
  [ ] Model Training

