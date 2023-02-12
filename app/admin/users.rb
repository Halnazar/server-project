ActiveAdmin.register User do
  permit_params :email, :name, :password, :password_confirmation
  actions :index, :show

  index do
    selectable_column
    id_column
    column :email
    column :name
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :name
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :name
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  show title: proc { "Работник" } do
    h3 "#{resource.name}"

    attributes_table do
      row "Имя" do
        user.name
      end

      row "Email" do
        user.email
      end
    end

    panel 'Рассматриваемые кандидаты' do
      user.candidates.map do |candidate|
          attributes_table_for candidate do
            row "Email" do
              auto_link candidate
            end

            row "Имя" do
              candidate.first_name
            end

            row "Фамилия" do
              candidate.second_name
            end

            row "Моб. номер" do
              candidate.number
            end

            row "Опыт" do
              candidate.expirience_years
            end

            row "Описание" do
              candidate.biography
            end

            row "Статус" do
              candidate.status_name
            end

            hr

          end
      end
    end
    active_admin_comments
  end
end
