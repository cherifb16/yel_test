require 'rails_helper'
RSpec.describe Comment, type: :model do
  it "Validation does not pass if the name is empty" do
    comment = Comment.new(name: '', description: 'hello world' )
    expect( comment).not_to be_valid
  end
  it "Validation does not pass if description is empty" do
    comment = Comment.new(name: 'Failure test' , description: '')
    expect( comment).not_to be_valid
  end
  it "validation passes If description is described in name and description" do
    comment=Comment.new(name:'True' , description: 'hello world' )
  end
end
        