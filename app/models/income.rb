class Income < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions


  belongs_to :user
  belongs_to_active_hash :incomecategory
  belongs_to_active_hash :month
  belongs_to_active_hash :year

end
