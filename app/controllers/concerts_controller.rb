class ConcertsController < ApplicationController
  def index
  	today = DateTime.now
  	@concerts_this_month = Concert.where('date >= ? and date <= ?', today.beginning_of_month, today.end_of_month)
  	@concerts_other_months = Concert.where('date > ?', today.end_of_month)
  end

  def new
  	@concert = Concert.new
  end

  def create
  	@concert = Concert.new(concert_params)
  		if @concert.save
  			link_to concerts_path
  		else
  			render :new
  		end
  end

  def show
  	@concert = Concert.find_by(id: params[:id])
  	@comments = @concert.comments.all
  	@comment = @concert.comments.new
  end

  private
  def concert_params
  	params.require(:concert).permit(:artist, :venue, :city, :date, :price, :description)
  end
end
