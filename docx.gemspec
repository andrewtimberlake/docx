Gem::Specification.new do |s|
  s.name            = 'docx'
  s.version         = '0.0.1'
  s.date            = '2013-12-27'
  s.summary         = "A gem for reading MS Word .docx files"
  s.description     = "Reads text and basic styles for MS Word .docx files"
  s.authors         = ["Andrew Timberlake"]
  s.email           = 'andrew@andrewtimberlake.com'
  s.files           = Dir.glob("{spec,lib}/**/*")
  s.require_path    = 'lib'
  # s.homepage      = 'http://rubygems.org/gems/...'
  s.license         = 'MIT'
  s.add_runtime_dependency "nokogiri", ["~> 1.6.0"]
  s.add_runtime_dependency "rubyzip", ["~> 1.0.0"]
  s.add_development_dependency "rspec", ["~> 2.14.0"]
end