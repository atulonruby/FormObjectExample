class Station < ActiveRecord::Base
  has_many :addresses
  has_many :contracts
  has_many :people, :through => :contracts
end
