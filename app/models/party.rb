class Party < ApplicationRecord
  validates_presence_of :title,
                        :date,
                        :zip_code

  belongs_to :host, class_name: 'User'

  has_many :user_parties, dependent: :destroy
  has_many :users, through: :user_parties, dependent: :destroy


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
      user_party = UserParty.where(user_id: user, party_id: self)
      user_party.first.delete
    end
  end
end
