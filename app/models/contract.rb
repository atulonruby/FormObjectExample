class Contract < ActiveRecord::Base
  belongs_to :person
  belongs_to :station
end
