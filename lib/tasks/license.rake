# encoding: utf-8

namespace :app do
  namespace :license do
    task :config do
      @licenser = Licenser.new('hitobito_dsj',
                               'Dachverband Schweizer Jugendparlamente',
                               'https://github.com/hitobito/hitobito_dsj')
    end
  end
end
