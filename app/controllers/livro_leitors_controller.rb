class LivroLeitorsController < ApplicationController
  before_action :set_livro_leitor, only: %i[ show edit update destroy relatorioreserva ]

  def relatorio 
    @livro_leitors = LivroLeitor.all.order("id DESC")
    respond_to do |format|
      format.pdf do
          pdf = EmprestimosPdf.new(@livro_leitors, @view_context) 
          send_data pdf.render,
          filename: "Reservas.pdf", type: "application/pdf", disposition: "inline"
      end 
    end
  end

  def relatorioreserva
    respond_to do |format|
      format.pdf do
          pdf = RelatorioReservaPdf.new(@livro_leitor, @view_context) 
          send_data pdf.render,
          filename: "Reserva.pdf", type: "application/pdf", disposition: "inline"
      end 
    end
  end
  
  # GET /livro_leitors or /livro_leitors.json
 
  def index
    if params[:nome] == nil
      @livro_leitors = LivroLeitor.all.joins(:leitor).joins(:livro).joins(:user).order("leitors.nome ASC, livro_leitors.id DESC").page(params[:page]).per(20)
    else
      #variavel que recebe pesquisa solicitada pelo usuario
      @livro_leitors = LivroLeitor.all
      .joins("LEFT JOIN leitors ON leitors.id = livro_leitors.leitor_id")
      .joins("LEFT JOIN users ON users.id = livro_leitors.user_id")
      .joins("LEFT JOIN livros ON livros.id = livro_leitors.livro_id")
      .where("users.nome ILIKE  '%"+params[:nome].strip+"%' OR leitors.nome ILIKE  '%"+params[:nome].strip+"%'").order("leitors.nome ASC, livro_leitors.id DESC").page(params[:page]).per(20)
    end 
  end

  # GET /livro_leitors/1 or /livro_leitors/1.json
  def show
  end

  # GET /livro_leitors/new
  def new
    @livro_leitor = LivroLeitor.new
  end

  # GET /livro_leitors/1/edit
  def edit
    @configuracoes = ConfiguracoesSistema.first
    if @configuracoes.ativar_multa == 1 and @livro_leitor.status != "Entregue"
      @livro_leitor.multa = @livro_leitor.calcular_multa(@configuracoes.valor_multa)
      @livro_leitor.status = "Prazo expirado"
    end
  end

  # POST /livro_leitors or /livro_leitors.json
  def create
    @livro_leitor = LivroLeitor.new(livro_leitor_params)
    @livro_leitor.user_id = current_user.id
    @livro_leitor.status = "Pendente"
    respond_to do |format|
      if @livro_leitor.save
        format.html { redirect_to livro_leitor_url(@livro_leitor), notice: "Livro leitor was successfully created." }
        format.json { render :show, status: :created, location: @livro_leitor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @livro_leitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /livro_leitors/1 or /livro_leitors/1.json
  def update
    respond_to do |format|
      if @livro_leitor.update(livro_leitor_params)
        format.html { redirect_to livro_leitor_url(@livro_leitor), notice: "Livro leitor was successfully updated." }
        format.json { render :show, status: :ok, location: @livro_leitor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @livro_leitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /livro_leitors/1 or /livro_leitors/1.json
  def destroy
    @livro_leitor.destroy

    respond_to do |format|
      format.html { redirect_to livro_leitors_url, notice: "Livro leitor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_livro_leitor
      @livro_leitor = LivroLeitor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def livro_leitor_params
      params.require(:livro_leitor).permit(:data_inicio, :data_entrega, :data_possivel_entrega, :multa, :status_multa, :status, :observacao, :user_id, :livro_id, :leitor_id)
    end
end
