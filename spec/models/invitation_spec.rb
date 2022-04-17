require 'rails_helper'

RSpec.describe Invitation, type: :model do
  subject(:invitation) { create(:invitation) }

  it { should validate_presence_of (:email) }
  it { should validate_presence_of (:message) }
end
