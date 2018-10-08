ActiveAdmin.register User do

  menu label: 'User List', parent: 'Users', priority: 1
  permit_params do
    allowed = [:first_name, :last_name, :email, :user_type, :avatar]
    allowed.push :status if resource.id != current_user.id
    allowed.push :password if !params[:user][:password].blank?

    allowed
  end
  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :user_type
    column :status
    column :last_sign_in_at
    # actions
    actions do |user|
      item 'Disable', eval("disable_admin_user_path(#{user.id})"), class: 'member_link' if can? :disable, user# if (user.active? && user.id != current_user.id)
      item 'Activate', eval("activate_admin_user_path(#{user.id})"), class: 'member_link' if can? :activate, user# if (user.disabled? && user.id != current_user.id)
      # (item 'Disable', confirm_status_change_admin_user_path(user, status_change_action: 'disable'), class: 'fancybox member_link', data: { 'fancybox-type' => 'ajax' }) if user.active?
      # (item 'Enable', confirm_status_change_admin_user_path(user, status_change_action: 'enable'), class: 'fancybox member_link', data: { 'fancybox-type' => 'ajax' }) if user.disabled?
      # (item 'Approve', confirm_status_change_admin_user_path(user, status_change_action: 'approve'), class: 'fancybox member_link', data: { 'fancybox-type' => 'ajax' }) unless user.approved
      # (item 'Reject', confirm_status_change_admin_user_path(user, status_change_action: 'reject'), class: 'fancybox member_link', data: { 'fancybox-type' => 'ajax' }) if user.approved
      # (item 'Promote', promote_to_project_manager_admin_land_manager_path(user), method: :put, class: 'member_link') if user.land_manager?
      # item 'Events', "#{admin_user_events_path}?q[item_id_eq]=#{user.id}"
    end
  end
  member_action :activate do
    resource.update_attribute(:status, User.statuses[:active])
    redirect_to admin_users_path, notice: "User has been activated successfully!"
  end
  member_action :disable do
    resource.update_attribute(:status, User.statuses[:disabled])
    redirect_to admin_users_path, notice: "User has been disabled successfully!"
  end
  show do
    attributes_table do
      row "Avatar" do |user|
        image_tag user.avatar.variant(resize: "50x50")
      end
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
  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :password, input_html:{value: ""}
      f.input :status, as: :select, collection: User.statuses.keys, include_blank: false if f.object.id != current_user.id
      f.input :user_type, as: :select, collection: User.user_types.keys, include_blank: false
      f.input :avatar, as: :file
    end
    f.actions
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
