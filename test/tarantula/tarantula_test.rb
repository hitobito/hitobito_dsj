# encoding: utf-8

#  Copyright (c) 2012-2016, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

require 'test_helper'
require 'relevance/tarantula'
require 'tarantula/tarantula_config'

class TarantulaTest < ActionDispatch::IntegrationTest
  # Load enough test data to ensure that there's a link to every page in your
  # application. Doing so allows Tarantula to follow those links and crawl
  # every page.  For many applications, you can load a decent data set by
  # loading all fixtures.

  reset_fixture_path File.expand_path('../../../spec/fixtures', __FILE__)

  include TarantulaConfig

  def test_tarantula_as_mitarbeiter_gs
    crawl_as(people(:admin))
  end

  def test_tarantula_as_adressverwaltung
    crawl_as(people(:leader))
  end

  def test_tarantula_as_jupa_mitglied
    crawl_as(people(:member))
  end

  private

  def configure_urls_with_hitobito_dsj(t, person)
    configure_urls_without_hitobito_dsj(t, person)

    # Wagon specific urls configuration here
  end
  alias_method_chain :configure_urls, :hitobito_dsj

end
