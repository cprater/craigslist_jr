class Post < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :category

  # def initialize
  #   self.pin = (0000..9999).rand
  # end
end

