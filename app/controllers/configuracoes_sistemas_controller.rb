class ConfiguracoesSistemasController < ApplicationController
  before_action :set_configuracoes_sistema, only: %i[ show edit update destroy ]


  # GET /configuracoes_sistemas/1 or /configuracoes_sistemas/1.json
  def show
  end


  # GET /configuracoes_sistemas/1/edit
  def edit
    
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


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_configuracoes_sistema
      @configuracoes_sistema = ConfiguracoesSistema.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def configuracoes_sistema_params
      params.require(:configuracoes_sistema).permit(:prazo_dias, :nome_sistema, :valor_multa, :ativar_multa)
    end
end
