class DisasterListersController < ApplicationController
  before_action :set_disaster_lister, only: [:show, :edit, :update, :destroy]

  # GET /disaster_listers
  # GET /disaster_listers.json
  def index
    @disaster_listers = DisasterLister.all

    response = Unirest::get "https://community-relief-web.p.mashape.com/resports?offset=%3Coffset%3E&limit=%3Climit%3E&query%3E&sort=%3Csort%E",
      headers: {
        "X-Mashape-Authorization" => "pHwhyFNyrYWKuPDsDnFgQ2MgzE97I1ZZ"
      }

      
  end

  # GET /disaster_listers/1
  # GET /disaster_listers/1.json
  def show
  end

  # GET /disaster_listers/new
  def new
    @disaster_lister = DisasterLister.new
  end

  # GET /disaster_listers/1/edit
  def edit
  end

  # POST /disaster_listers
  # POST /disaster_listers.json
  def create
    @disaster_lister = DisasterLister.new(disaster_lister_params)

    respond_to do |format|
      if @disaster_lister.save
        format.html { redirect_to @disaster_lister, notice: 'Disaster lister was successfully created.' }
        format.json { render :show, status: :created, location: @disaster_lister }
      else
        format.html { render :new }
        format.json { render json: @disaster_lister.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disaster_listers/1
  # PATCH/PUT /disaster_listers/1.json
  def update
    respond_to do |format|
      if @disaster_lister.update(disaster_lister_params)
        format.html { redirect_to @disaster_lister, notice: 'Disaster lister was successfully updated.' }
        format.json { render :show, status: :ok, location: @disaster_lister }
      else
        format.html { render :edit }
        format.json { render json: @disaster_lister.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disaster_listers/1
  # DELETE /disaster_listers/1.json
  def destroy
    @disaster_lister.destroy
    respond_to do |format|
      format.html { redirect_to disaster_listers_url, notice: 'Disaster lister was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disaster_lister
      @disaster_lister = DisasterLister.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def disaster_lister_params
      params[:disaster_lister]
    end
end
