class GroupComment < ApplicationRecord

  belongs_to :group_document
  belongs_to :user
end
