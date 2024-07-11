#  Copyright (c) 2012-2016, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

namespace :app do
  namespace :license do
    task :config do
      @licenser = Licenser.new("hitobito_dsj",
        "Dachverband Schweizer Jugendparlamente",
        "https://github.com/hitobito/hitobito_dsj")
    end
  end
end
