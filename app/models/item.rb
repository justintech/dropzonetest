class Item < ActiveRecord::Base
	validates_presence_of :name
	validates :image, presence: false

	has_attached_file :image, :styles => { 
		:very_small => '30x30>',
		:nav_small => '35x35>', 
		:small => "64x64>", 
		:medium => "128x128>",
		:large => "256x256>",
		:extra_large => "512x512>"
	 }
	
	validates_attachment :image, 
	content_type: { content_type: [ "image/jpg", "image/jpeg", "image/png" ] }, 
	size: { in: 0..1.megabytes }, 
	matches: [/png\Z/, /jpe?g\Z/]

end
