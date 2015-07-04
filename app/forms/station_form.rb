class StationForm

    include ActiveModel::Model

    def persisted?
      false
    end

    ATTRIBUTES = [:name, :email, :phone, :contract, :vote, :terms_of_service]

    attr_accessor :station, :address, :pole, *ATTRIBUTES

    def initialize(attributes = {})
      ATTRIBUTES.each do |attribute|
       send("#{attribute}=", attributes[attribute])
      end
    end

    validates :name, presence: true
    validates :vote, presence: true
    validates :contract, presence: true
    validates :terms_of_service, :acceptance => true
    validate :unique_station_name
    validate :validate_contact_method



    def save
      return false unless valid?
      persist
    end

    def people_collection
      Person.order(:name)
    end

private

    def unique_station_name
      if Station.exists?(name: name)
        errors.add(:name, "station name needs to be unique.Please choose another name." )
      end
    end

    def validate_contact_method
      if email.blank? and phone.blank?
        errors.add(:base,"At least one form of contact must be entered: Phone or Email" )
      end
    end

    def persist
      @station = Station.new(name: name)
      @address = Address.new(phone: phone, email: email)
      @pole = Pole.new(vote: vote)
      @person = Person.find(contract)

      begin
        ActiveRecord::Base.transaction do
          @station.addresses << @address
          @station.people << @person
          @station.save!
          @pole.save!
        end
      rescue ActiveRecord::RecordInvalid => e
        errors.add(:base, e)
        false
      end

    end

end










