class Person < ActiveRecord::Base
  has_many :contracts
  has_many :stations, :through => :contracts
end
