class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  has_many :exams, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.name_maximum}

  before_create :set_default_role

  enum role: Settings.user.roles.to_h.keys

  private
  def set_default_role
    self.role ||= Settings.user.roles.normal
  end
end
