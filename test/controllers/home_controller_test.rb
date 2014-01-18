require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  test "should render index page and set require variables" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gross_revenue)
  end

  test "should accept the input file and redirect to index after processings" do
    prevcount = Item.count
    upload = ActionDispatch::Http::UploadedFile.new({
                                                        :filename => 'example_input.tab',
                                                        :content_type => 'text/tab-separated-values',
                                                        :tempfile => File.new("#{Rails.root}/test/fixtures/example_input.tab")
                                                    })

    post :process_import, file: upload
    assert_redirected_to home_path()
    assert_not_same(prevcount, Item.count)
  end


end