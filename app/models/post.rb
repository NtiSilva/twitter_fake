class Post < ApplicationRecord
    belongs_to :usuario
   validates :text, presence: true, length: { maximum: 280 }
  validates :usuario_id, presence: true
end
