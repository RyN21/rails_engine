require 'rails_helper'

RSpec.describe Sale do
  describe "relationships" do
    it {should belong_to :invoice}
  end
end
