class Party < ApplicationRecord
  validates_presence_of :title,
                        :date,
                        :zip_code

  belongs_to :host, class_name: 'User'

  has_many :user_parties, dependent: :destroy
  has_many :users, through: :user_parties, dependent: :destroy

  geocoded_by :address
  after_validation :geocode

  attr_reader :address

  def address
    [street_address, city, zip_code, state].compact.join(", ")
  end

  def address_changed
    street_address_changed? || city_changed? || zip_code_changed? || state_changed?
  end

  def view_date
    self.date.strftime('%b. %-d, %Y')
  end

  def view_time
    self.date.strftime('%I:%M %p')
  end

  def location
    "#{self.street_address}, #{self.city}, #{self.state} #{self.zip_code}"
  end

  def attendance(user, rsvp)
    if rsvp == 'attend'
      self.users << user
    elsif rsvp == 'cancel'
      user_party = UserParty.where(user_id: user, party_id: self)
      user_party.first.delete
    end
  end
end
