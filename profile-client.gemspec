# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'profile-client'
  s.version = '0.0.0'
  s.summary = 'Profile Client'
  s.description = ' '

  s.authors = ['Aaron Dufall']
  s.email = 'aald212@gmail.com'
  s.homepage = 'https://github.com/aarondufall/profile-component'
  s.licenses = ['MIT']

  s.require_paths = ['lib']
  s.files = Dir.glob('{lib}/**/*')
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.4'

  files = Dir["lib/profile/**/*.rb"]

  files += Dir["lib/profile_component/{controls.rb,controls/**/*.rb}"]

  files << "lib/profile_component/load.rb"

  File.read("lib/profile_component/load.rb").each_line.map do |line|
    next if line == "\n"

    _, filename = line.split(/[[:blank:]]+/, 2)

    filename.gsub!(/['"]/, '')
    filename.strip!

    filename = File.join('lib', "#{filename}.rb")

    if File.exist?(filename)
      files << filename
    end
  end

  s.files = files

  s.add_runtime_dependency 'evt-messaging-postgres'
  s.add_runtime_dependency 'evt-configure'

  s.add_development_dependency 'test_bench'
end
