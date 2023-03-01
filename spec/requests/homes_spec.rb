RSpec.describe HomeController, type: :controller do
  describe "GET #statistics" do
    it "assigns chart data to instance variables" do
      user1 = create(:user, name: "User 1")
      user2 = create(:user, name: "User 2")

      create_list(:candidate, 3, user: user1)
      create_list(:candidate, 5, user: user2)

      get :statistics

      expect(assigns(:chart_sign_in_count_data)).to eq([
                                                         ["User 1", user1.sign_in_count],
                                                         ["User 2", user2.sign_in_count]
                                                       ])

      expect(assigns(:chart_orders_count_data)).to eq([
                                                        ["User 1", 3],
                                                        ["User 2", 5]
                                                      ])
    end

    it "renders the statistics view" do
      get :statistics

      expect(response).to render_template(:statistics)
    end
  end
end
