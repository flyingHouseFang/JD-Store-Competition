class WelcomeController < ApplicationController
  layout "welcome"
  after_action :intercom_shutdown, only: [:index]

  def index
    @products = Product.all.sort_by{|product| -product.fans.count}
    @products = @products.first(12)
  end

  def about
  end

  protected
  def intercom_shutdown
    IntercomRails::ShutdownHelper.intercom_shutdown(session, cookies)
  end
end
