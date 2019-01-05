class House < ApplicationRecord
  belongs_to :real_estate_company
  belongs_to :realtor, class_name: :User

  has_and_belongs_to_many :potential_buyers, class_name: :User

  has_many_attached :images

  # validates :location,
  #   presence: true,
  #   length: { maximum: 100 }

  # validates :square_footage,
  #   presence: true,
  #   length: { maximum: 100 }

  # validates :year_built,
  #   presence: true,
  #   length: { maximum: 100 }

  # validates :style,
  #   presence: true,
  #   length: { maximum: 100 }

  # validates :list_price,
  #   presence: true,
  #   length: { maximum: 100 }

  # validates :num_floors,
  #   presence: true,
  #   length: { maximum: 100 }

  # validates :current_house_owner,
  #   presence: true,
  #   length: { maximum: 100 }
end
