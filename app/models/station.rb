class Station < ActiveRecord::Base
  has_many :addresses #email, phone
  has_many :contracts
  has_many :people, :through => :contracts
end
