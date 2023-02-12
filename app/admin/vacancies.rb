ActiveAdmin.register Vacancy do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :status, :opening_date, :closing_date, :position_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:status, :opening_date, :closing_date, :position_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  #
  #

  show title: proc { "Вакансия" } do
    attributes_table do
      row "Статус вакансии" do
        vacancy.status_name
      end

      row "Дата открытия" do
        vacancy.opening_date
      end

      if vacancy.status # if closed
        row "Дата закрытия" do
          vacancy.closing_date
        end
      end

        panel 'Позиция' do
           p = vacancy.position

            attributes_table_for p do
              row "Позиция" do
                auto_link p
              end
           end
         end
    end
    active_admin_comments
    end
  end
