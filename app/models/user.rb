class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :timerecords
  has_many :tasks, through: :timerecords

	def fullName
		fullName = "#{firstname} #{lastname}"
	end

end
