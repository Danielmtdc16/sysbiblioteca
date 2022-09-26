class EditorasController < ApplicationController
  before_action :set_editora, only: %i[ show edit update destroy ]

  # GET /editoras or /editoras.json
  def index
    if params[:nome] == nil
      @editoras = Editora.all.order("editoras.nome ASC").page(params[:page]).per(20)
    else
      #variavel que recebe pesquisa solicitada pelo usuario
      @editoras = Editora.all.where("users.nome ILIKE  '%"+params[:nome].strip+"%'").order("editoras.nome ASC").page(params[:page]).per(20)
    end 
  end

  # GET /editoras/1 or /editoras/1.json
  def show
  end

  # GET /editoras/new
  def new
    @editora = Editora.new
  end

  # GET /editoras/1/edit
  def edit
  end

  # POST /editoras or /editoras.json
  def create
    @editora = Editora.new(editora_params)

    respond_to do |format|
      if @editora.save
        format.html { redirect_to editora_url(@editora), notice: "Editora criada com sucesso." }
        format.json { render :show, status: :created, location: @editora }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @editora.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /editoras/1 or /editoras/1.json
  def update
    respond_to do |format|
      if @editora.update(editora_params)
        format.html { redirect_to editora_url(@editora), notice: "Editora alterada com sucesso." }
        format.json { render :show, status: :ok, location: @editora }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @editora.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /editoras/1 or /editoras/1.json
  def destroy
    @editora.destroy

    respond_to do |format|
      format.html { redirect_to editoras_url, notice: "Editora excluída com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_editora
      @editora = Editora.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def editora_params
      params.require(:editora).permit(:nome)
    end
end
