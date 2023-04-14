class Event < ApplicationRecord
    belongs_to :user
    has_many :guests, dependent: :destroy
    
    validates :name, presence: true
    validates :location, presence: true
    validates :budget, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :public, inclusion: { in: [true, false] }
    
    # New attributes
    attribute :public, :boolean
    attribute :budget, :integer
    attribute :guest_limit, :integer
    attribute :invitation_message, :text
    
    before_validation :set_defaults, on: :create
    
    private
    
    def set_defaults
      self.public ||= true
    end
  end
  