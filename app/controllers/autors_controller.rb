class AutorsController < ApplicationController
  before_action :set_autor, only: %i[ show edit update destroy ]

  # GET /autors or /autors.json
  def index
    
    if params[:nome] == nil
      @autors = Autor.all.order("autors.nome ASC").page(params[:page]).per(20)
    else
      #variavel que recebe pesquisa solicitada pelo usuario
      @autors = Autor.all.where("autors.nome ILIKE  '%"+params[:nome].strip+"%'").order("autors.nome ASC").page(params[:page]).per(20)
    end 
  end

  # GET /autors/1 or /autors/1.json
  def show
  end

  # GET /autors/new
  def new
    @autor = Autor.new
  end

  # GET /autors/1/edit
  def edit
  end

  def pesquisa
    @autors = Autor.all
    .where("autors.nome ILIKE '%"+params[:q].to_s+"%'").order("autors.nome")
    respond_to do |format|
      format.html
      format.json
    end
  end

  # POST /autors or /autors.json
  def create
    @autor = Autor.new(autor_params)



    respond_to do |format|
      if @autor.save
        format.html { redirect_to autor_url(@autor), notice: "Autor criada com sucesso."}
        format.json { render :show, status: :created, location: @autor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @autor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /autors/1 or /autors/1.json
  def update
    respond_to do |format|
      if @autor.update(autor_params)
        format.html { redirect_to autor_url(@autor), notice: "Autor was successfully updated." }
        format.json { render :show, status: :ok, location: @autor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @autor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /autors/1 or /autors/1.json
  def destroy
    @autor.destroy

    respond_to do |format|
      format.html { redirect_to autors_url, notice: "Autor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_autor
      @autor = Autor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def autor_params
      params.require(:autor).permit(:nome)
    end
end
