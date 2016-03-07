$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your wagon's version:
require 'hitobito_dsj/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  # rubocop:disable SingleSpaceBeforeFirstArg
  s.name        = 'hitobito_dsj'
  s.version     = HitobitoDsj::VERSION
  s.authors     = ['Mathis Hofer']
  s.email       = ['hofer@puzzle.ch']
  # s.homepage    = 'TODO'
  s.summary     = 'DSJ'
  s.description = 'Dachverband Schweizer Jugendparlamente'

  s.files = Dir['{app,config,db,lib}/**/*'] + ['Rakefile']
  s.test_files = Dir['test/**/*']
  # rubocop:enable SingleSpaceBeforeFirstArg
end
