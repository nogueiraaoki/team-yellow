class HomeController < ApplicationController
  def index
    @donate = Donate.new
    @acts = Act.new
    @product = Product.new
  end
end
