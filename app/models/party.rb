class Party < ApplicationRecord
  validates_presence_of :title,
                        :date,
                        :zip_code

  belongs_to :host, class_name: 'User'

  has_many :user_parties
  has_many :users, through: :user_parties


  def view_date
    self.date.strftime('%b. %-d, %Y')
  end

  def location
    "#{self.street_address}, #{self.city}, #{self.state} #{self.zip_code}"
  end

  def attendance(user, rsvp)
    if rsvp == 'attend'
      self.users << user
    elsif rsvp == 'cancel'
      user_party = UserParty.find(user_id: user, party_id: self)
      user_party.first.delete
    end
  end
end
