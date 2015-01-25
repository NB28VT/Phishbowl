class ConcertsController < ApplicationController
  def index
    # Upcoming shows?
  end

  def show
    @concert = Concert.find(params[:id])
  end

end
