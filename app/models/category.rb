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

  def self.import file
    spreadsheet = open_spreadsheet file
    header = spreadsheet.row 1
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      category = find_by_id(row["id"]) || new
      category.attributes = row.to_hash
      category.save!
    end
  end

  def self.open_spreadsheet file
    if Settings.csv.type == File.extname(file.original_filename)
      Roo::CSV.new file.path
    else
      raise I18n.t("unfile") + "#{file.original_filename}"
    end
  end
end
