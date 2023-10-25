class Webhook < ApplicationRecord
  belongs_to :user
  scope :active, -> {where(status: ture)}
end
