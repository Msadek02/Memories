class Profile < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, ImageUploader
  
  def full_name
    self.first_name + ' ' + self.last_name
  end
end
