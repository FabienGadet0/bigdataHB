class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end

class Avatars < ActiveRecord::Base
  mount_uploaders :avatars, AvatarUploader
end
