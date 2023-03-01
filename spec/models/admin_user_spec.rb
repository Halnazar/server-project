RSpec.describe AdminUser, type: :model do
  describe "devise modules" do
    it "should include database_authenticatable" do
      expect(AdminUser.devise_modules).to include(:database_authenticatable)
    end

    it "should include recoverable" do
      expect(AdminUser.devise_modules).to include(:recoverable)
    end

    it "should include rememberable" do
      expect(AdminUser.devise_modules).to include(:rememberable)
    end

    it "should include validatable" do
      expect(AdminUser.devise_modules).to include(:validatable)
    end
  end
end
