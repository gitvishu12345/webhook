class User < ApplicationRecord
	has_many :inventories, dependent: :destroy
	has_one :webhook, dependent: :destroy
end
