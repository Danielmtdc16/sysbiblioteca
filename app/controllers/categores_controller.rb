class CategoresController < ApplicationController
  before_action :set_categore, only: %i[ show edit update destroy ]

  # GET /categores or /categores.json
  def index
    
    if params[:nome] == nil
      @categores = Categore.all.order("categores.nome ASC").page(params[:page]).per(20)
    else
      #variavel que recebe pesquisa solicitada pelo usuario
      @categores = Categore.all.where("categores.nome ILIKE  '%"+params[:nome].strip+"%'").order("categores.nome ASC").page(params[:page]).per(20)
    end 
  end

  # GET /categores/1 or /categores/1.json
  def show
  end

  # GET /categores/new
  def new
    @categore = Categore.new
  end

  # GET /categores/1/edit
  def edit
  end

  # POST /categores or /categores.json
  def create
    @categore = Categore.new(categore_params)



    respond_to do |format|
      if @categore.save
        format.html { redirect_to categore_url(@categore), notice: "categore criada com sucesso."}
        format.json { render :show, status: :created, location: @categore }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @categore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categores/1 or /categores/1.json
  def update
    respond_to do |format|
      if @categore.update(categore_params)
        format.html { redirect_to categore_url(@categore), notice: "categore was successfully updated." }
        format.json { render :show, status: :ok, location: @categore }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @categore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categores/1 or /categores/1.json
  def destroy
    @categore.destroy

    respond_to do |format|
      format.html { redirect_to categores_url, notice: "categore was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categore
      @categore = Categore.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def categore_params
      params.require(:categore).permit(:nome)
    end
end
