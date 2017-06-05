
class GalaxiesController < ApplicationController
  
  before_action :set_galaxy, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy] 
  
  # GET /galaxies
  # GET /galaxies.json
  def index
      @galaxies = Galaxy.all
      @signed_in = user_signed_in? 
      if @galaxies.count == 0
        flash[:zeroCount] = "No galaxies yet. Change that by clicking "
      end
    else
  end

  # GET /galaxies/1
  # GET /galaxies/1.json
  def show
   @signed_in = user_signed_in?
   @authorized = current_user == Galaxy.find(params[:id]).user
   @user = User.where("id = #{@galaxy.user_id}")
   puts "Username is: "+@user.pluck(:email).join("").to_s
  end
  
  # GET /galaxies/find
  def find
   @name = Galaxy.where("name = '#{params[:name].split(" ").map{|n| n.capitalize}.join(" ")}'")
   puts @name
    if !@name.blank?
      redirect_to '/galaxies/'+@name.pluck(:id).join("")
    else
      flash[:not_found] = "Record not found."
      redirect_to galaxies_url
    end
  end
  # GET /galaxies/new
  def new
    if current_user
    @galaxy = current_user.galaxy.build
  else
    redirect_to '/users/sign_in'
  end
  end
  
  # GET /galaxies/findadvanced
  def findadvanced
    @signed_in = user_signed_in?
    @record = Galaxy.where("galaxy_type = '#{params[:type]}' and mass between #{params[:lower_mass]} and #{params[:upper_mass]} and distance between #{params[:lower_distance]} and #{params[:upper_distance]} 
    and diameter between #{params[:lower_diameter]} and #{params[:upper_diameter]} and num_stars between #{params[:lower_stars]} and #{params[:upper_stars]}")
    @signed_in = user_signed_in?
  end

  # GET /galaxies/1/edit
  def edit
    
    @signed_in = user_signed_in?
    
    @galaxy = Galaxy.find(params[:id])
  end

  # POST /galaxies
  # POST /galaxies.json
  def create
    @galaxy = current_user.galaxy.build(galaxy_params)
    respond_to do |format|
      if @galaxy.save
        format.html { redirect_to @galaxy }
        format.json { render :show, status: :created, location: @galaxy }
        flash[:notice] = "Galaxy successfully created."
      else
        format.html { render :new }
        format.json { render json: @galaxy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /galaxies/1
  # PATCH/PUT /galaxies/1.json
  def update
    respond_to do |format|
      if @galaxy.update(galaxy_params)
        format.html { redirect_to @galaxy }
        format.json { render :show, status: :ok, location: @galaxy }
        flash[:notice] = "Galaxy successfully updated."
      else
        format.html { render :edit }
        format.json { render json: @galaxy.errors, status: :unprocessable_entity }
      end
    end
  end
  


  # DELETE /galaxies/1
  # DELETE /galaxies/1.json
  def destroy
    Galaxy.delete(@galaxy)
    respond_to do |format|
      format.html { redirect_to galaxies_url}
      format.json { head :no_content }
      flash[:notice] = "Galaxy successfully deleted."
    end
  end
  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_galaxy
      @galaxy = Galaxy.find(params[:id])
    end
    
    def set_record
       @record = Galaxy.where("mass between #{params[:lower_mass]} and #{params[:upper_mass]} and distance between #{params[:lower_distance]} and #{params[:upper_distance]} 
    and diameter between #{params[:lower_diameter]} and #{params[:upper_diameter]} and num_stars between #{params[:lower_stars]} and #{params[:upper_stars]}")
      redirect_to '/galaxies'
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def galaxy_params
      params.require(:galaxy).permit(:name, :galaxy_type, :distance, :num_stars, :diameter, :mass, :notable_features, :image)
    end
    
    def user_params
      params.require(:user).permit(:email,:username,:password)
    end
    
    def correct_user
     @user= User.find(current_user.id)
     redirect_to(root_url) unless current_user.id == @galaxy.user.id
    end
    
    def landing
    end
end