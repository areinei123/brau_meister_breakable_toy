require 'rails_helper'

RSpec.describe List, type: :model do
  it { should have_valid(:amount).when(2) }
end