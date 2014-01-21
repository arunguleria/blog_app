class Author < ActiveRecord::Base
  
  has_one :profile, dependent: :destroy
  has_many :articles, dependent: :destroy
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, 
    format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, message: 'provide a valid email'},
    uniqueness: true



    def name
      " #{first_name} #{last_name}"
    end


end
