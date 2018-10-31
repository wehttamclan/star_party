class Party < ApplicationRecord
  validates_presence_of :title,
                        :date,
                        :zip_code

<<<<<<< HEAD
  geocoded_by :address
  after_validation :geocode

  def address
    [street_address, city, zip_code, state].compact.join(", ")
  end

  def address_changed
    street_address_changed? || city_changed? || zip_code_changed? || state_changed?
  end
=======
  belongs_to :host, class_name: 'User'

  has_many :user_parties, dependent: :destroy
  has_many :users, through: :user_parties, dependent: :destroy

>>>>>>> 6fc3a4d83b3bacacd5d15ebb8e85ced550d7612a

  def view_date
    self.date.strftime('%b. %-d, %Y')
  end

  def location
    "#{self.street_address}, #{self.city}, #{self.state} #{self.zip_code}"
  end
<<<<<<< HEAD
=======

  def attendance(user, rsvp)
    if rsvp == 'attend'
      self.users << user
    elsif rsvp == 'cancel'
      user_party = UserParty.where(user_id: user, party_id: self)
      user_party.first.delete
    end
  end
>>>>>>> 6fc3a4d83b3bacacd5d15ebb8e85ced550d7612a
end
