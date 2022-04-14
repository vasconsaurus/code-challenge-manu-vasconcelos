class Invitation < ApplicationRecord
  belongs_to :cycle
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Email invalid" }
  validates :message, presence: true
end
