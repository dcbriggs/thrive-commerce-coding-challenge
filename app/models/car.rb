class Car < ApplicationRecord
  has_many :car_owners
  has_many :people, through: :car_owners
end
