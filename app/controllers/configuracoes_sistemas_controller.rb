class ConfiguracoesSistemasController < ApplicationController
  before_action :set_configuracoes_sistema, only: %i[ show edit update destroy ]

  # GET /configuracoes_sistemas or /configuracoes_sistemas.json
  def index
    if params[:nome_sistema] == nil
      @configuracoesSistemas = ConfiguracoesSistema.all.order("configuracoes_sistemas.nome_sistema ASC").page(params[:page]).per(20)
    else
      #variavel que recebe pesquisa solicitada pelo usuario
      @configuracoesSistemas = ConfiguracoesSistemas.all.where("configuracoes_sistemas.nome_sistema ILIKE  '%"+params[:nome_sistema].strip+"%'").order("configuracoes_sistemas.nome_sistema ASC").page(params[:page]).per(20)
    end 
  end

  # GET /configuracoes_sistemas/1 or /configuracoes_sistemas/1.json
  def show
  end

  # GET /configuracoes_sistemas/new
  def new
    @configuracoes_sistema = ConfiguracoesSistema.new
  end

  # GET /configuracoes_sistemas/1/edit
  def edit
  end

  # POST /configuracoes_sistemas or /configuracoes_sistemas.json
  def create
    @configuracoes_sistema = ConfiguracoesSistema.new(configuracoes_sistema_params)

    respond_to do |format|
      if @configuracoes_sistema.save
        format.html { redirect_to configuracoes_sistema_url(@configuracoes_sistema), notice: "Configuracoes sistema was successfully created." }
        format.json { render :show, status: :created, location: @configuracoes_sistema }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @configuracoes_sistema.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /configuracoes_sistemas/1 or /configuracoes_sistemas/1.json
  def update
    respond_to do |format|
      if @configuracoes_sistema.update(configuracoes_sistema_params)
        format.html { redirect_to configuracoes_sistema_url(@configuracoes_sistema), notice: "Configuracoes sistema was successfully updated." }
        format.json { render :show, status: :ok, location: @configuracoes_sistema }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @configuracoes_sistema.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /configuracoes_sistemas/1 or /configuracoes_sistemas/1.json
  def destroy
    @configuracoes_sistema.destroy

    respond_to do |format|
      format.html { redirect_to configuracoes_sistemas_url, notice: "Configuracoes sistema was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_configuracoes_sistema
      @configuracoes_sistema = ConfiguracoesSistema.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def configuracoes_sistema_params
      params.require(:configuracoes_sistema).permit(:prazo_dias, :nome_sistema, :valor_multa)
    end
end
