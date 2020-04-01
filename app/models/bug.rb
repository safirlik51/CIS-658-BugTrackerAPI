class Bug < ApplicationRecord
	belongs_to :user

	validates :title, :description, presence: true

	enum issue_type: [:issue, :enhancement, :feature]
	enum priority: [:low, :medium, :high]
	enum status: [:open, :closed, :monitor]
	validates :issue_type, inclusion: {in: issue_types.keys}
	validates :priority, inclusion: {in: priorities.keys}
	validates :status, inclusion: {in: statuses.keys}
end
