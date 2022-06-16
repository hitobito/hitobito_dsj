# frozen_string_literal: true

#  Copyright (c) 2022, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

module Dsj
  module NotesController
    extend ActiveSupport::Concern

    included do
      helper_method :subject_path, :update_path

      prepend_before_action :group, only: [:edit]
    end

    def update
      authorize!(:update, note)
      @note.assign_attributes(permitted_params.merge(author_id: current_user.id))
      @note.save

      respond_to do |format|
        format.html { redirect_to subject_path }
      end
    end

    def edit
      authorize!(:update, note)

      respond_to do |format|
        format.html
      end
    end

    private

    def update_path
      if @note.subject_type == Group.name
        group_note_path(group_id: group.id, id: @note.id)
      else
        group_person_note_path(group_id: group.id, person_id: subject.id, id: @note.id)
      end
    end

  end
end
