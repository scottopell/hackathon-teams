class Hacker < ActiveRecord::Base
  belongs_to :school
  belongs_to :team
  has_many :ratings
end
