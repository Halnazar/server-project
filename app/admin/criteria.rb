ActiveAdmin.register Criterium do

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

  show title: proc { "Критерии" } do

    h3 "Критерий - #{resource.name}"

    panel "Позиции" do
      ps = resource.position_criterium_scores

      table_for ps do
        column("Позиция") { |p| auto_link p.position }
        column "Величина критерия",   :score
      end
    end

    panel "Кандидаты" do
      cs = resource.candidate_criterium_scores

      table_for cs do
        column("Кандидат") { |c| auto_link c.candidate  }
        column("Полное имя") { |c| "#{c.candidate.first_name} #{c.candidate.second_name}" }
        column "Величина критерия",   :score
      end
    end
    active_admin_comments

  end

end
