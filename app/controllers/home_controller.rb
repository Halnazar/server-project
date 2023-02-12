class HomeController < ApplicationController

  def statistics
        @chart_sign_in_count_data=[]
        @chart_orders_count_data=[]

        User.all.each do |u|
              @chart_orders_count_data << [u.name, Candidate.where(user_id: u.id).count ]
              @chart_sign_in_count_data << [u.name, u.sign_in_count]
        end
  end

end
