class Product < ActiveRecord::Base
  has_many :photo, dependent: :destroy
  accepts_nested_attributes_for :photo
end
