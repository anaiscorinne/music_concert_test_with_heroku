class CommentsController < ApplicationController

	before_action :authenticate_user!, only: [ "new", "create" ]
	
	def index
		@concert = Concert.find_by(id: params[:concert_id])
		@comments = @concert.comments.all
	end

	def new
		@concert = Concert.find_by(id: params[:concert_id])
		@comment = @concert.comments.new
	end

	def create
		@concert = Concert.find_by(id: params[:concert_id])
		@comment = @concert.comments.create(comment_params)
		redirect_to concert_path(@concert)
	end

	private
	def comment_params
		params.require(:comment).permit(:name, :email, :body)
	end
end
