class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :shop, counter_cache: :favorites_count
end
