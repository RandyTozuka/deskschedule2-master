class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :workschedules
  belongs_to :dep_name
  # validates :name, presence: true
  # validates :dep_name_id, presence: true

end
