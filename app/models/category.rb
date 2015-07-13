class Category < ActiveRecord::Base
  has_many :exams, dependent: :destroy
  has_many :questions, dependent: :destroy

  validates :name, :exetime, presence: true
  validates :exetime, numericality: {only_integer: true,
    greater_than: Settings.category.exetime.minimum}

  private
  def self.to_csv options = {}
    CSV.generate options do |csv|
      csv << column_names
      all.each do |category|
        csv << category.attributes.values_at(*column_names)
      end
    end
  end  
end
