class PagesController < ApplicationController
  include PgSearch::Model

  def home
    @kinds = ['Petrol', 'Diesel', 'Electric', 'Hybrid']
    @trans = ['Manual', 'Automatic']
  end

  def about
  end

  def contact
  end
end
