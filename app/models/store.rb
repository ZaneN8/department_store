class Store < ApplicationRecord
  has_many :items, depent: :destroy
end
