class Inventory < ApplicationRecord
  belongs_to :user
  after_create :push_after_create
  after_update :push_after_update
  validates :sku, presence: true, length: { minimum: 2 }
  validates :price, presence: true

  def push_after_update
    inventory = self
    user = inventory.user
    payload = inventory.to_json
    response = Integration.new(user).push(payload, "update")
    puts response
    return true
  end

  def push_after_create
    inventory = self
    user = inventory.user
    payload = inventory.to_json
    response = Integration.new(user).push(payload, "create")
    puts response
    return true
  end
end
