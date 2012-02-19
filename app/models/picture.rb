class Picture < ActiveRecord::Base
belongs_to :user

MAX_FILESIZE=500*500

  def picture_file= (p)
  @picture_file = p
  unless @picture_file.blank?
      self.picture_data = p.read
      self.content_type = p.content_type
    end
  end

def vaildate
  if @picture_file.blank?
    	errors.add(:image_file, %q|did'nt designate.| )
    elsif @image_file.content_type !~/^image/
    	errors.add(:image_file, 'is not a imege.' )
	end
end
end
