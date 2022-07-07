require 'rails_helper'  

RSpec.describe State do
    it {should have_many :cities}
end