class ClientsController < ApplicationController
  load_and_authorize_resource
  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to clients_path, notice: "#{@client.first_name} #{@client.last_name} was added to your list of clients successfully!"
    else
      flash.alert = "please fix the errors below to continue"
      render :new
    end
  end

  def index
    @clients = Client.order('last_name asc')
    @clients = @clients.paginate(:page => params[:page], :per_page => 10)
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    redirect_to clients_path, notice: "#{@client.first_name} #{@client.last_name} was removed from your client list successfully!"
  end

  def edit
   @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    @client.assign_attributes(client_params)
    if @client.save
      redirect_to clients_path, notice: "#{@client.first_name} #{@client.last_name} was updated successfully!"
    else
      flash.alert = "Please fix the errors below to continue."
      render :edit
    end
  end

  def show
    @client = Client.find(params[:id])
  end

  protected

  def client_params
    params.require(:client).permit(:first_name, :last_name)
  end



end
