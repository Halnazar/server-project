ActiveAdmin.register Position do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name
  #
  # or
  #
  # permit_params do
  #   permitted = [:name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  #

  show title: proc { "Позиция" } do
    attributes_table do
      row "Название позиции" do
        resource.name
      end

      row "Дата создания позции" do
        resource.created_at
      end


      panel 'Вакансии' do
        vs = resource.vacancies

        vs.map do |v|

          attributes_table_for v do
            row "Вакансия" do
              auto_link v
            end

            row "Статус вакансии" do
              v.status_name
            end

            row "Дата открытия" do
              v.opening_date
            end

            if v.status # if closed
              row "Дата закрытия" do
                v.closing_date
              end
            end
          end

          hr
        end

      end
    end
    active_admin_comments
  end

end
