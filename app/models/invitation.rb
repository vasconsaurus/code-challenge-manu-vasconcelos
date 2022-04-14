class Invitation < ApplicationRecord
  belongs_to :cycle
  validates :email, presence: true
  validates :message, presence: true
end
