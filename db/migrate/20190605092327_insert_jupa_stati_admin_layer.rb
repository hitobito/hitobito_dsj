class InsertJupaStatiAdminLayer < ActiveRecord::Migration[4.2]
  def up
    root = Group.roots.first
    admin_layer = nil

    return unless root

    say_with_time 'Create new admin-group' do
      admin_layer = Group.create!(type: 'Group::JugendparlamentStatusVerwaltung', name: 'JuPa Stati Verwaltung', parent_id: root.id)
    end

    say_with_time 'Move current stati to new admin-group' do
      Group
        .where(type: 'Group::JugendparlamentStatus', parent_id: root.id)
        .update_all(parent_id: admin_layer.id, lft: nil, rgt: nil)
    end

    say_with_time 'Rebuilding nested set...' do
      Group.rebuild!(false)
    end
  end

  def down
    root = Group.roots.first
    admin_layer_ids = Group.where(type: 'Group::JugendparlamentStatusVerwaltung').pluck(:id)

    return unless root

    say_with_time 'Move current stati from admin-group to root' do
      Group
        .where(type: 'Group::JugendparlamentStatus', parent_id: admin_layer_ids)
        .update_all(parent_id: root.id, lft: nil, rgt: nil)
    end

    say_with_time 'remove all admin-groups' do
      Group.where(id: admin_layer_ids).destroy_all
    end

    say_with_time 'Rebuilding nested set...' do
      Group.rebuild!(false)
    end
  end
end
