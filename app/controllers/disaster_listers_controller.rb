class DisasterListersController < ApplicationController
  before_action :set_disaster_lister, only: [:show, :edit, :update, :destroy]

  # GET /disaster_listers
  # GET /disaster_listers.json
  def index
    @disaster_listers = DisasterLister.all

    response = Unirest::get "https://community-relief-web.p.mashape.com/disasters", 
  headers: { 
    "X-Mashape-Authorization" => "pHwhyFNyrYWKuPDsDnFgQ2MgzE97I1ZZ"
  }
      @disasters = response.body

      # response.body is made up of hash keys and values.
      # The hash key "data" has an array as its value. That array is made up of hashes.
      # Inside those hashes, there is a "fields" key which itself points to another hash. 
      # The hash that "fields" points to has "name" as its key.
      # The value of "name" is the actual title of the disaster. This is the value we want. 

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
