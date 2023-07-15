class ListsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_list, only: [:edit, :update, :destroy]

  def index
  # @lists = List.all
    @lists = policy_scope(List)
  # pendiente validar la lógica de búsqueda no choque con el poundit
    if params[:query].present?
      @lists = List.search_by_code_or_user_email(params[:query])
    else
      @lists
    end
    if user_signed_in?
      @lists = List.find(user: current_user)
    else
      if params[:query].present?
        @lists = List.search_by_code_or_user_email(params[:query])
      else
        @lists = []
      end
    end
  end

  def show
    if user_signed_in?
      @list = List.find(params[:id])
      authorize @list
    else
      @list = authorize List.find_by(code: params[:code])
    end

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
    @list.user = current_user
    authorize @list

    if @list.save
      redirect_to lists_path
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
    params.require(:list).permit(:name, :description, :event_date, :address)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
