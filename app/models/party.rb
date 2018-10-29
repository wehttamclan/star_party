class Party < ApplicationRecord
  validates_presence_of :title,
                        :date,
                        :zip_code

  geocoded_by :address
  after_validation :geocode

  def address
    [street_address, city, zip_code, state].compact.join(", ")
  end

  def address_changed
    street_address_changed? || city_changed? || zip_code_changed? || state_changed?
  end

  def view_date
    self.date.strftime('%b. %-d, %Y')
  end

  def location
    "#{self.street_address}, #{self.city}, #{self.state} #{self.zip_code}"
  end
end
