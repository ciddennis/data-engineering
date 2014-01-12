class HomeController < ApplicationController

  layout "application"

  def index
    @gross_revenue = Item.current_gross_revenue
  end

  def process_import
    Item.import_file(params[:file].tempfile) if params[:file]
    redirect_to home_path
  end

end