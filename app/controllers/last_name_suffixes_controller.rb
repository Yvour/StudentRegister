class LastNameSuffixesController < ApplicationController
  before_action :set_last_name_suffix, only: [:show, :edit, :update, :destroy]

  # GET /last_name_suffixes
  # GET /last_name_suffixes.json
  def index
    @last_name_suffixes = LastNameSuffix.all
  end

  # GET /last_name_suffixes/1
  # GET /last_name_suffixes/1.json
  def show
  end

  # GET /last_name_suffixes/new
  def new
    @last_name_suffix = LastNameSuffix.new
  end

  # GET /last_name_suffixes/1/edit
  def edit
  end

  # POST /last_name_suffixes
  # POST /last_name_suffixes.json
  def create
    @last_name_suffix = LastNameSuffix.new(last_name_suffix_params)

    respond_to do |format|
      if @last_name_suffix.save
        format.html { redirect_to @last_name_suffix, notice: 'Last name suffix was successfully created.' }
        format.json { render :show, status: :created, location: @last_name_suffix }
      else
        format.html { render :new }
        format.json { render json: @last_name_suffix.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /last_name_suffixes/1
  # PATCH/PUT /last_name_suffixes/1.json
  def update
    respond_to do |format|
      if @last_name_suffix.update(last_name_suffix_params)
        format.html { redirect_to @last_name_suffix, notice: 'Last name suffix was successfully updated.' }
        format.json { render :show, status: :ok, location: @last_name_suffix }
      else
        format.html { render :edit }
        format.json { render json: @last_name_suffix.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /last_name_suffixes/1
  # DELETE /last_name_suffixes/1.json
  def destroy
    @last_name_suffix.destroy
    respond_to do |format|
      format.html { redirect_to last_name_suffixes_url, notice: 'Last name suffix was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_last_name_suffix
      @last_name_suffix = LastNameSuffix.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def last_name_suffix_params
      params.require(:last_name_suffix).permit(:name)
    end
end
