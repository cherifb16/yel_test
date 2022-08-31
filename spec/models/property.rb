require 'rails_helper'
RSpec.describe Property, type: :model do
  it "Validation does not pass if the name is empty" do
    property = Property.new(headline: '', description: 'hello world' , city: 'hello-world', state: 'hayiki', country:'burnafaso', address_1: 'hello world', address_2:'hello world', price_cents:'700', zip_code:'B399', state:'Atanga')
    expect( property).not_to be_valid
  end
  it "Validation does not pass if description is empty" do
    property = Property.new(headline: 'Failure test' , description: '', city: 'hello-world', state: 'hayiki', country:'burnafaso', address_1: 'hello world', address_2:'hello world', price_cents:'700', zip_code:'B399', state:'Atanga')
    expect( property).not_to be_valid
  end
  it "Validation does not pass if city is empty" do
    property = Property.new(headline: 'Failure test' , description: 'hello world', city: '', state: 'hayiki', country:'burnafaso', address_1: 'hello world', address_2:'hello world', price_cents:'700', zip_code:'B399', state:'Atanga')
    expect( property).not_to be_valid
  end
  it "Validation does not pass if country is empty" do
    property = Property.new(headline: 'Failure test' , description: 'hello world', city: 'Bennie', state: 'hayiki', country:'', address_1: 'hello world', address_2:'hello world', price_cents:'700', zip_code:'B399', state:'Atanga')
    expect( property).not_to be_valid
  end
  it "Validation does not pass if state is empty" do
    property = Property.new(headline: 'Failure test' , description: 'hello world', city: 'Bennie', state: 'hayiki', country:'', address_1: 'hello world', address_2:'hello world', price_cents:'700', zip_code:'B399', state:'')
    expect( property).not_to be_valid
  end
  it "validation passes If description is described in name and description" do
    property=Property.new(headline:'True' , description: 'hello world', city: 'hello-world', state: 'hayiki', country:'burnafaso', address_1: 'hello world', address_2:'', price_cents:'700', zip_code:'B399', state:'Atanga' )
  end
  it "validation passes If description is described in name and description" do
    property=Property.new(headline:'True' , description: 'hello world', city: 'hello-world', state: 'hayiki', country:'burnafaso', address_1: 'hello world', address_2:'bunanga', price_cents:'700', zip_code:'B399', state:'Atanga' )
  end
end
      

