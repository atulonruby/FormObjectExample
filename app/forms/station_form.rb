class StationForm
    include Virtus.model

    include ActiveModel::Model

    validates :station_name, :presence => true
    validate :unique_station_name
    validates :address_url, :presence => true

# Station
    attr_reader :station

    attribute :station_name, String
    attribute :station_description, String

# Address
    attr_reader :address

    attribute :address_url, String
    attribute :address_priority, Integer
    attribute :address_is_active, Boolean

    def unique_station_name
      if Station.exists? name: station_name
        errors.add :station_name, "station name needs to be unique"
      end
    end

    def persisted?
        false
    end

    def save
        if valid?
            persist
            true
        else
            false
        end
    end

private

    def persist
        @station = Station.create(name: station_name, description: station_description)
        @address = @station.addresses.create(url: address_url, priority: address_priority, is_active: address_is_active)
    end
end