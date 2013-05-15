class Url < ActiveRecord::Base
  validates :long_url, :format => { :with => /^[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix,
    :message => "Must be a valid Url." }

  def increment
    self.click_count += 1
    self.save
    puts click_count
  end
end
