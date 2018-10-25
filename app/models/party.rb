class Party < ApplicationRecord
  validates_presence_of :title,
                        :date,
                        :zip_code

  def location
    "#{self.street_address}, #{self.city}, #{self.state} #{self.zip_code}"
  end

end
