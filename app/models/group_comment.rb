class GroupComment < ApplicationRecord
  serialize :tags

  belongs_to :group_document
  belongs_to :user

  TAGS = %w(niceone needhelp actionrequired info)

end
