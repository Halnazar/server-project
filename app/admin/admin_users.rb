ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  show title: proc { "Администратор" } do
    h3 "#{resource.name}"

    attributes_table do

      row "Email" do
        resource.email
      end

      row "Позиция: Имя" do
        resource.name
      end

      row "Создан" do
        resource.created_at
      end
    end

    active_admin_comments
  end

end
