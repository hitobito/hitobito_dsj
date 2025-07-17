module Dsj::GroupAbility
  extend ActiveSupport::Concern

  included do
    on(Group) do
      permission(:any).may(:"index_event/fundraisings").all
    end
  end
end
