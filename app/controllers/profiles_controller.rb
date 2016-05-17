class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]

  def index
    @profile = Profile.find_by(user_id: current_user.id)
  end

  def show

  end

  def new
    @profile = Profile.new 
  end

  private 

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :bio)  
  end
end