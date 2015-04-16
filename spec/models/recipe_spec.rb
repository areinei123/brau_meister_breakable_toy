require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it { should belong_to :user }

  it { should have_valid(:name).when("Fred's amazing ipa") }
  it { should have_valid(:batch_size).when(5) }
  it { should have_valid(:user).when(FactoryGirl.create(:user)) }

end