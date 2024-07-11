#  Copyright (c) 2017, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

module Dsj::NoteAbility
  extend ActiveSupport::Concern

  included do
    on(Note) do
      permission(:layer_full)
        .may(:update)
        .in_same_layer

      permission(:layer_and_below_full)
        .may(:update)
        .in_same_layer_or_below

      permission(:group_full)
        .may(:create, :show, :update, :destroy)
        .in_same_group

      permission(:group_and_below_full)
        .may(:create, :show, :update, :destroy)
        .in_same_group_or_below
    end
  end

  def in_same_group
    case subj
    when Group then permission_in_group?(subj.id)
    when Person then permission_in_groups?(subj.group_ids)
    else raise(ArgumentError, "Unknown note subject #{subj.class}")
    end
  end

  def in_same_group_or_below
    case subj
    when Group then permission_in_groups?(subj.self_and_descendants.map(&:id))
    when Person then permission_in_groups?(subj.groups_hierarchy_ids)
    else raise(ArgumentError, "Unknown note subject #{subj.class}")
    end
  end

  private

  def subj
    subject.subject
  end
end
