class PagesController < ApplicationController
  include PgSearch::Model

  def home
    @kinds = ['Petrol', 'Diesel', 'Electric', 'Hybrid']
    @trans = ['Manual', 'automatic']
  end

  def about
  end

  def contact
  end
end
