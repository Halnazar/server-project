ActiveAdmin.register PositionCriteriumScore do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :score, :criterium_id, :position_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:score, :criterium_id, :position_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  #
  #

  show title: proc { "Метрики позиции" } do
    attributes_table do
      row "Критерий" do
        "#{resource.criterium.name}"
      end

      row "Позиция" do
        auto_link resource.position
      end

      row "Балл" do
        resource.score
      end

    end
    active_admin_comments
  end

end
