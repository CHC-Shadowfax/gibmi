class ListsController < ApplicationController
  require 'open-uri'

  skip_after_action :verify_authorized, only: [:show]
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_list, only: [:edit, :update, :destroy]

  def index
    @lists = nil
    if user_signed_in? && !params[:query].present?
      @lists = policy_scope(List).where(user: current_user)
    else
      @lists = policy_scope(List).search_by_code_or_user_email(params[:query])
      redirect_to list_path(@lists.first, query: params[:query]) if @lists.count == 1
    end
  end

  def show
    if user_signed_in?
      @list = List.find(params[:id])
    end
    @list = List.find_by(code: params[:query  ])

    if @list.nil?
      redirect_to lists_path
      flash[:alert] = "Not existent list"
    end
  end

  def new
    @list = List.new
    authorize @list
  end

  def create
    @list = List.new(list_params)
    if @list.photo_id.present?
      file = URI.open("https://source.unsplash.com/#{@list[:photo_id]}")
      @list.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
    end
    @list.user = current_user
    authorize @list

    if @list.save
      redirect_to list_path(@list, query: @list.code)
    else
      render :new
    end
  end

  def edit
    @list = authorize List.find(params[:id])
  end

  def update
    authorize @list
    if @list.update(list_params)
      redirect_to lists_path
    else
      render :edit
    end
  end

  def destroy
    authorize @list
    @list.destroy

    redirect_to lists_path
  end

 private

  def list_params
    params.require(:list).permit(:name, :description, :event_date, :address, :photo, :photo_id)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
