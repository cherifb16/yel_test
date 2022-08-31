require "rails_helper"
RSpec.describe User, type: :model do
    describe "Validation test" do
        it "is valid to create user with name, email, address, phone, password, and password confirmation" do
            user = User.new(
                email: "user@example.com",
                password: "password"
            )
            expect(user).to be_valid
        end

        it "is invalid to create user without email" do
            user = User.new(
                
                email: " ",
                password: "password"
            )
            expect(user).not_to be_valid
        end

        it "is invalid to create user without password" do
            user = User.new(
                email: "",
                password: ""
            )
            expect(user).not_to be_valid
        end
        
    end
end