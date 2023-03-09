class Car < ApplicationRecord
  has_many :car_owners
  has_many :people, through: :car_owners
  belongs_to :owner, class_name: 'Person'
end
