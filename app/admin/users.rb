ActiveAdmin.register User do

  menu label: 'User List', parent: 'Users', priority: 1

  actions :index, :show, :destroy

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :user_type
    column :status
    column :last_sign_in_at
    actions
    # actions do |user|
    #   item 'Edit', eval("edit_admin_#{user.user_type}_path(#{user.id})"), class: 'member_link'
    #   (item 'Disable', confirm_status_change_admin_user_path(user, status_change_action: 'disable'), class: 'fancybox member_link', data: { 'fancybox-type' => 'ajax' }) if user.active?
    #   (item 'Enable', confirm_status_change_admin_user_path(user, status_change_action: 'enable'), class: 'fancybox member_link', data: { 'fancybox-type' => 'ajax' }) if user.banned?
    #   (item 'Approve', confirm_status_change_admin_user_path(user, status_change_action: 'approve'), class: 'fancybox member_link', data: { 'fancybox-type' => 'ajax' }) unless user.approved
    #   (item 'Reject', confirm_status_change_admin_user_path(user, status_change_action: 'reject'), class: 'fancybox member_link', data: { 'fancybox-type' => 'ajax' }) if user.approved
    #   (item 'Promote', promote_to_project_manager_admin_land_manager_path(user), method: :put, class: 'member_link') if user.land_manager?
    #   item 'Events', "#{admin_user_events_path}?q[item_id_eq]=#{user.id}"
    # end
  end

  show do
    attributes_table do
      row :email
      row :first_name
      row :last_name
      row :user_type
      row :status
      row :sign_in_count
      row :last_sign_in_at
      row :current_sign_in_at
      row :created_at
      row :updated_at
    end
  end

  csv do
    column :id
    column :first_name
    column :last_name
    column :email
    column :user_type
    column :status
    column :sign_in_count
    column :last_sign_in_at
    column :current_sign_in_at
    column :created_at
    column :updated_at
  end

  filter :first_name
  filter :last_name
  filter :email
  filter :user_type, as: :select, collection: -> { User.user_types }
  filter :last_sign_in_at
  filter :status, as: :select, collection: -> { User.statuses }
end
