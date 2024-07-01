class Task < ApplicationRecord
  belongs_to :project

  validates :title, presence: true
  validates :deadline, presence: true
  validates :status, presence: true, inclusion: { in: %w[pending in_progress completed] }
  validate :verify_valid_deadline, on: [:create, :update]
  
  private
  
  def verify_valid_deadline
    unless self.project.end_date >= self.deadline && self.project.start_date <= self.deadline
      errors.add(
        :task, 
        'cannot be created outside of the project timeframe'
      )
    end
  end
end
