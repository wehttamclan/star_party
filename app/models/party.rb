class Party < ApplicationRecord
  validates_presence_of :title,
                        :date,
                        :zip_code

  belongs_to :host, class_name: 'User'


  def view_date
    self.date.strftime('%b. %-d, %Y')
  end

  def location
    "#{self.street_address}, #{self.city}, #{self.state} #{self.zip_code}"
  end

end
