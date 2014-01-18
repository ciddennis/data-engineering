require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # called before every single test
  def setup
    Item.destroy_all
    Merchant.destroy_all
    Purchaser.destroy_all
  end

  test "item will process the input file" do
     Item.import_file(File.new("#{Rails.root}/test/fixtures/example_input.tab"))
     assert_same(4, Item.count)
     assert_same(3, Merchant.count)
     assert_same(3, Purchaser.count)
  end

  test "item should compute correct gross revenue" do
    Item.import_file(File.new("#{Rails.root}/test/fixtures/example_input.tab"))
    assert_same(95, Item.current_gross_revenue)
  end


end