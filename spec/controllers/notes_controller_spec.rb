# frozen_string_literal: true

#  Copyright (c) 2022, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

require 'spec_helper'

describe NotesController do
  render_views

  let(:note) { Note.create!(author: people(:leader), subject: people(:leader), text: 'Inactive') }
  let(:nesting) { { group_id: note.author.primary_group_id, person_id: note.author.id, id: note.id } }

  describe 'GET #edit' do
    before { sign_in(people(:leader)) }

    it 'renders' do
      get :edit, params: nesting

      expect(response).to be_ok
    end
  end
end

