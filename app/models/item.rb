require 'csv'

class Item < ActiveRecord::Base
  belongs_to :purchaser
  belongs_to :merchant

  # Total Gross Revenue
  def self.current_gross_revenue
    Item.select("sum(price * count) as gross").first["gross"]
  end

  # Given a file read it as tab delim and create Merchants, Purchasers and Items.
  def self.import_file(file_to_import)

    CSV.foreach(file_to_import, { col_sep: "\t", headers: :first_row }) do |result|
      # Make sure we do not even try to import blank rows
      next if result[0].blank?

      merchant = Merchant.find_or_create_by(name: result[5], address: result[4])
      purchaser = Purchaser.find_or_create_by(name: result[0])
      purchaser.add_item(description:result[1],price:result[2],count:result[3],merchant_id: merchant.id)

    end

  end

end
