require_relative "lib/admin_panel/version"

Gem::Specification.new do |spec|
  spec.name        = "admin_panel"
  spec.version     = AdminPanel::VERSION
  spec.authors     = [ "" ]
  spec.email       = [ "" ]
  spec.homepage    = ""
  spec.summary     = "eigenes Admin Panel für Rails"
  spec.description = "eigenes Admin Panel für Rails"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = ""
  spec.metadata["changelog_uri"] = ""

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 8.1.3"
  spec.add_dependency "pagy", "~> 43.5"
end
