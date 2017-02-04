class BeersController < ApplicationController
  before_action :set_beer, only: [:show, :edit, :update, :destroy]

  # GET /beers
  # GET /beers.json
  def index
    @beers = Beer.all
  end

  # GET /beers/1
  # GET /beers/1.json
  def show
  end

  # GET /beers/new
  def new
  @beer = Beer.new
  @breweries = Brewery.all
  @styles = ["Altbier", "Amber Ale", "American Pale Ale", "American Strong Ale", "Barley wine", "Bitter", "Brown Ale",
             "Cream Ale", "English Pale Ale", "English Strong Ale", "Golden Ale/Blond Ale",
             "Fruit beer", "Imperial/Double IPA", "India Pale Ale (IPA)",
             "Irish Ale", "Kölsch", "Mild Ale", "Old Ale", "Saison", "Sahti", "Premium Bitter /ESB",
             "Scotch Ale", "Scottish Ale", "Abbey Dubbel", "Abbey Tripel", "Abt/Quadrupel",
             "Belgian ale", "Belgian strong ale", "Bière de Garde", "Foreign Stout",
             "Imperial Stout", "Dry Stout", "Porter", "Stout", "Sweet Stout",
             "American style wheatbeer", "Berliner Weisse", "Dunkel-Weizen", "Hefe-Weizenbier (Hefe-Weißbier)",
             "Kristall-Weizenbier", "Weizen-Bock", "Witbier", "American style dark lager", "Bock",
             "Pils", "California Common", "Doppelbock",
             "German pilsner", "Dortmunder/Helles", "Dunkel/Münchener/Münchner", "Eisbock",
             "European Strong Lager", "Malt Liquor",
             "Mead, mjød, mjöd, miód", "Oktoberfest/Märzen",
             "Pilsener", "Premium Lager", "Rauchbier", "Schwarzbier", "Ungespundetes bier",
             "Light lager", "Vienna/Wienerbier", "Zwickel/Keller/Landbier", "Lambicit", "Other beer type"]
end

  # GET /beers/1/edit
  def edit
    @breweries = Brewery.all
    @styles = ["Altbier", "Amber Ale", "American Pale Ale", "American Strong Ale", "Barley wine", "Bitter", "Brown Ale",
    "Cream Ale", "English Pale Ale", "English Strong Ale", "Golden Ale/Blond Ale",
    "Fruit beer", "Imperial/Double IPA", "India Pale Ale (IPA)",
    "Irish Ale", "Kölsch", "Mild Ale", "Old Ale", "Saison", "Sahti", "Premium Bitter /ESB",
     "Scotch Ale", "Scottish Ale", "Abbey Dubbel", "Abbey Tripel", "Abt/Quadrupel",
    "Belgian ale", "Belgian strong ale", "Bière de Garde", "Foreign Stout",
    "Imperial Stout", "Dry Stout", "Porter", "Stout", "Sweet Stout",
    "American style wheatbeer", "Berliner Weisse", "Dunkel-Weizen", "Hefe-Weizenbier (Hefe-Weißbier)",
    "Kristall-Weizenbier", "Weizen-Bock", "Witbier", "American style dark lager", "Bock",
    "Pils", "California Common", "Doppelbock",
    "German pilsner", "Dortmunder/Helles", "Dunkel/Münchener/Münchner", "Eisbock",
    "European Strong Lager", "Malt Liquor",
    "Mead, mjød, mjöd, miód", "Oktoberfest/Märzen",
    "Pilsener", "Premium Lager", "Rauchbier", "Schwarzbier", "Ungespundetes bier",
    "Light lager", "Vienna/Wienerbier", "Zwickel/Keller/Landbier", "Lambicit", "Other beer type"]
  end

  # POST /beers
  # POST /beers.json
  def create
    @beer = Beer.new(beer_params)

    respond_to do |format|
      if @beer.save
        format.html { redirect_to beers_path, notice: 'Beer was successfully created.' }
        format.json { render :show, status: :created, location: @beer }
      else
        @breweries = Brewery.all
        @styles = ["Altbier", "Amber Ale", "American Pale Ale", "American Strong Ale", "Barley wine", "Bitter", "Brown Ale",
                   "Cream Ale", "English Pale Ale", "English Strong Ale", "Golden Ale/Blond Ale",
                   "Fruit beer", "Imperial/Double IPA", "India Pale Ale (IPA)",
                   "Irish Ale", "Kölsch", "Mild Ale", "Old Ale", "Saison", "Sahti", "Premium Bitter /ESB",
                   "Scotch Ale", "Scottish Ale", "Abbey Dubbel", "Abbey Tripel", "Abt/Quadrupel",
                   "Belgian ale", "Belgian strong ale", "Bière de Garde", "Foreign Stout",
                   "Imperial Stout", "Dry Stout", "Porter", "Stout", "Sweet Stout",
                   "American style wheatbeer", "Berliner Weisse", "Dunkel-Weizen", "Hefe-Weizenbier (Hefe-Weißbier)",
                   "Kristall-Weizenbier", "Weizen-Bock", "Witbier", "American style dark lager", "Bock",
                   "Pils", "California Common", "Doppelbock",
                   "German pilsner", "Dortmunder/Helles", "Dunkel/Münchener/Münchner", "Eisbock",
                   "European Strong Lager", "Malt Liquor",
                   "Mead, mjød, mjöd, miód", "Oktoberfest/Märzen",
                   "Pilsener", "Premium Lager", "Rauchbier", "Schwarzbier", "Ungespundetes bier",
                   "Light lager", "Vienna/Wienerbier", "Zwickel/Keller/Landbier", "Lambicit", "Other beer type"]
        format.html { render :new }
        format.json { render json: @beer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /beers/1
  # PATCH/PUT /beers/1.json
  def update
    respond_to do |format|
      if @beer.update(beer_params)
        format.html { redirect_to @beer, notice: 'Beer was successfully updated.' }
        format.json { render :show, status: :ok, location: @beer }
      else
        format.html { render :edit }
        format.json { render json: @beer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /beers/1
  # DELETE /beers/1.json
  def destroy
    @beer.destroy
    respond_to do |format|
      format.html { redirect_to beers_url, notice: 'Beer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_beer
      @beer = Beer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def beer_params
      params.require(:beer).permit(:name, :style, :brewery_id)
    end
end
