require "rails_helper"
RSpec.describe Partner, type: :model do
    describe "Validation test" do
        it "is valid to create partner with name, email, address, phone, password, and password confirmation" do
            partner = Partner.new(
                email: "partner@example.com",
                password: "password"
            )
            expect(partner).to be_valid
        end

        it "is invalid to create partner without email" do
            partner = Partner.new(
                
                email: " ",
                password: "password"
            )
            expect(partner).not_to be_valid
        end

        it "is invalid to create partner without password" do
            partner = Partner.new(
                email: "",
                password: ""
            )
            expect(partner).not_to be_valid
        end
        
    end
end