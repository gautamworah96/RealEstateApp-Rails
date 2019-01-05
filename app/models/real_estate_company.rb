class RealEstateCompany < ApplicationRecord
  has_and_belongs_to_many :users

  validates :name,
    presence: true,
    length: { maximum: 100 }

   validates :website,
     presence: true,
     length: { maximum: 100 },
     format: URI::regexp(%w(http https))


   validates :address,
     presence: true,
     length: { maximum: 100 }
end
