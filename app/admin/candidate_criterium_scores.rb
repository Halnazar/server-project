ActiveAdmin.register CandidateCriteriumScore do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :score, :criterium_id, :candidate_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:score, :criterium_id, :candidate_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  #
  #

  show title: proc { "Метрики кандидатов" } do
    attributes_table do
      row "Критерий" do
        "#{resource.criterium.name}"
      end

      row "Кандидат" do
        auto_link resource.candidate
      end

      row "Полное имя" do
        "#{resource.candidate.first_name} #{resource.candidate.second_name}"
      end

      row "Балл" do
        resource.score
      end

    end
    active_admin_comments
  end

end
