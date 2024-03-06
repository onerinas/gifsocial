class MomentsController < ApplicationController
  before_action :set_moment, only: %i[ show edit update destroy ]

  # GET /moments or /moments.json
  def index
    @moments = Moment.order(created_at: :desc)
  end

  # GET /moments/1 or /moments/1.json
  def show
  end

  # GET /moments/new
  def new
    @moment = Moment.new
  end

  # GET /moments/1/edit
  def edit
  end

  # POST /moments or /moments.json
  def create
    @moment = Moment.new(moment_params)

    respond_to do |format|
      if @moment.save
        format.html { redirect_to moment_url(@moment), notice: "Moment was successfully created." }
        format.json { render :show, status: :created, location: @moment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @moment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moments/1 or /moments/1.json
  def update
    respond_to do |format|
      if @moment.update(moment_params)
        format.html { redirect_to moment_url(@moment), notice: "Moment was successfully updated." }
        format.json { render :show, status: :ok, location: @moment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @moment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moments/1 or /moments/1.json
  def destroy
    @moment.destroy!

    respond_to do |format|
      format.html { redirect_to moments_url, notice: "Moment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_moment
      @moment = Moment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def moment_params
      params.require(:moment).permit(:wassup, :gif_url)
    end
end
