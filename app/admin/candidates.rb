ActiveAdmin.register Candidate do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :first_name, :second_name, :email, :number, :expirience_years, :biography, :vacancy_id, :status, :user_id, :gender

  permit_params do
    permitted = [:first_name, :second_name, :email, :number, :expirience_years, :biography, :vacancy_id, :status, :user_id]
    permitted << params[:gender] == '0' ? {gender: false} : {gender: true}
    permitted
  end



  # or
  #
  # permit_params do
  #   permitted = [:first_name, :second_name, :email, :number, :expirience_years, :biography, :vacancy_id, :status, :user_id, :gender]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  #
  #
    show title: proc { "Кандидат" } do
      attributes_table do
        row "Email" do
          candidate.email
        end

        row "Полное имя" do
          "#{candidate.first_name} #{candidate.second_name}"
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

        row "Пол" do
          candidate.gender
        end

        row "Статус" do
          candidate.status_name
        end
      end

      panel "О кандидате" do
        attributes_table_for resource.user  do

        row "Рекрутер" do
          auto_link resource.user
        end

        row "Вакансия" do
          auto_link resource.vacancy
        end

         end
      end
      active_admin_comments
      end
end
