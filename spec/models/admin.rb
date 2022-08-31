require "rails_helper"
RSpec.describe Partner, type: :model do
    describe "Validation test" do
        it "is valid to create partener with name, email, address, phone, password, and password confirmation" do
            partener = Partner.new(
                email: "partener@example.com",
                password: "password"
            )
            expect(partener).to be_valid
        end

        it "is invalid to create partener without email" do
            partener = Partner.new(
                
                email: " ",
                password: "password"
            )
            expect(partener).not_to be_valid
        end

        it "is invalid to create partener without password" do
            partener = Partner.new(
                email: "",
                password: ""
            )
            expect(partener).not_to be_valid
        end
        
    end
end