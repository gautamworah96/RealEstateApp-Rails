class Message < ApplicationRecord
  belongs_to :user, :foreign_key=>:sender
  belongs_to :receiver, class_name: :User

  validates :subject,
            presence: true,
            length: { maximum: 100 }

  validates :content,
            presence: true,
            length: { maximum: 1000 }

  validates :sender, numericality: { only_integer: true }
end


