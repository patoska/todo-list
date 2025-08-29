class ToDo < ApplicationRecord
  belongs_to :notify, class_name: "User", foreign_key: "notify_id"
  belongs_to :added_by, class_name: "User", foreign_key: "added_by_id"
  belongs_to :assigned_to, class_name: "User", foreign_key: "assigned_to_id"
end
