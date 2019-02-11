require 'rails_helper'

RSpec.describe Attendance, type: :model do

  it "should return a string" do
    expect(@attendance.stripe_customer_id).to be_a(String)
  end

end
