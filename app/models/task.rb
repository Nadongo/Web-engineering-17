class Task < ApplicationRecord
  enum status: { todo: 0, doing: 1, done: 2 }
  validates :title, presence: true
  validates :status, presence: true
  validates :deadline, presence: true

  # 1. Allowlist the searchable columns
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "deadline", "description", "id", "status", "title", "updated_at"]
  end

  # 2. Add this to allowlist associations (empty because we have none to search)
  def self.ransackable_associations(auth_object = nil)
    []
  end
end