class MessagesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.order(created_at: :desc)
  end

  def show
  end

  def new
    @message = current_user.messages.build
  end

  def edit
  end

  def create
    @message = current_user.messages.build(message_params)

    if @message.save
      redirect_to root_path
    else
      render "new"
  end

  def destroy
    @message.destroy
    redirect_to root_path
  end

  def update
    if @message.update(message_params)
      redirect_to message_path
    else
      render "edit"
    end
  end
    private

  def find_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:title, :description)
  end
end
end