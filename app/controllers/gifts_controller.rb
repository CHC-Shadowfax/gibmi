class GiftsController < ApplicationController
  before_action :set_gift, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: [:show, :add_assignee_email, :add_assignee]

  def index
    @gifts = policy_scope Gift.all
  end

  def new
    @gift = authorize Gift.new
  end

  def show
    @gift = authorize Gift.find(params[:id])
  end

  def create
    @gift = authorize Gift.new(gift_params)
    if @gift.save
       redirect_to gift_path(@gift)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @gift = authorize Gift.find(params[:id])
  end

  def update
    @gift = authorize Gift.find(params[:id])
    if @gift.update(gift_params)
      redirect_to gift_path(@gift)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @gift.destroy
    # redirect_to list_path(@gift.list, query: @gift.list.code), notice: 'Gift was successfully destroyed.', status: :see_other
     redirect_to lists_path, notice: 'Gift was successfully destroyed.', status: :see_other
  end

  def add_assignee_email
    @gift = Gift.find(params[:id])
    authorize @gift
    @gift.update!(gift_params)
    redirect_to lists_path(query: @gift.list.code), notice: 'Gift was successfully assigned, please create an account for more features', status: :see_other
  end

  def add_assignee
    @gift = Gift.find(params[:id])
    authorize @gift
    @gift.user = current_user
    @gift.save
    redirect_to lists_path, notice: 'Gift was successfully assigned', status: :see_other
  end


  def remove_assignee
    @gift = Gift.find(params[:id])
    @gift.user = nil
    @gift.save
    redirect_to lists_path, notice: 'Gift was successfully unassigned', status: :see_other
  end

  # def add_to_list
  #   @gift = Gift.find(params[:id])
  #   @gift.list = List.find(params[:list_id])
  #   @gift.save
  #   redirect_to lists_path, notice: 'Gift was successfully added to list', status: :see_other
  # end

  private

  def set_gift
    @gift = Gift.find(params[:id])
  end

  def gift_params
    params.require(:gift).permit(:name, :description, :photo, :list_id, :address, :size, :assignee_email)
  end
end

# paso 1 nueva columna en tabla gift assignee_email
# Route:¨crear ruta a este controlodar para a;ádir correo de asignado: patch gifts/:id/assignee_email, to: "gifts#add_assignee_email"

# modal will show two things
# if theres a current user it will only show a button that says "assign to me" patch  gifts/:id/assignee_email, to: "gifts#add_assignee"
# if theres no current user it will show a form to add email and a button to submit it  patch gifts/:id/assignee_email, to: "gifts#add_assignee"_emial

# create a button in the view to open modal
# the submit button of that modal should call the mthod in the controller
# def add_assignee_email
#   @gift = Gift.find(params[:id])
#   @gift.assignee_email = params[:assignee_email]
#   @gift.save
#   redirect_to lists_path, notice: 'Gift was successfully assigned, please create an account for more features', status: :see_other
# end

# when a user is created, add a callback in user model to search if theres  gift whit his email, if it is, asign it to him
# def after_create
#   gifts = Gift.where(assignee_email: self.email)
# if gifts.any?
#   gifts.each do |gift|
  #   gift.user = self
  #   gift.save
  # end
# end
