require 'active_support/concern'

module PictureSetting
  extend ActiveSupport::Concern
  included do
    has_attached_file :picture, styles: { medium: '300x300', thumb: '200x200' }
  validates_attachment :picture,
                       content_type: { content_type: ['image/jpg', 'image/jpeg', 'image/png'] }
  end
end