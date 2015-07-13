class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  devise :database_authenticatable, :registerable, :rememberable, :validatable

  has_many :exams, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.name_maximum}

  before_create :set_default_role

  enum role: Settings.user.roles.to_h.keys

  def slug_candidates
    [:name, [:name, :id]]
  end

  private
  def set_default_role
    self.role ||= Settings.user.roles.normal
  end
end
