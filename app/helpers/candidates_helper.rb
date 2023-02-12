module CandidatesHelper
  def humanize_status(candidate)
      case candidate.status
      when 0
         "Отклонён"
      when 1
        "Рассматривается"
      when 2
         "Принят"
      else
       "Error case in candidate helper"
      end
  end

  def random_image(male)
    if male=="male"
      ["man_1.jpg","man_2.png","man_3.jpg" ].sample
      else
      ["waman_1.jpg","woman.png" ].sample
    end
  end

  def russian_gender(candidate)
    if candidate.gender=="male"
      "Мужской"
    else
      "Женский"
    end
  end
end
