class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]

  def index
    @profile = Profile.find_by(user_id: current_user.id)
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def create
    @profile = current_user.profile ? current_user.profile : current_user.build_profile

    @profile.assign_attributes(profile_params)
    if @profile.save
     redirect_to @profile
    else
      flash[:alert] = @profile.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def new
    @profile = Profile.new 
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to @profile
    else
      render "edit"
    end
  end

  private 

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :bio, :image, :company)  
  end
end