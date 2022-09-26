class LivroLeitorsController < ApplicationController
  before_action :set_livro_leitor, only: %i[ show edit update destroy ]

  # GET /livro_leitors or /livro_leitors.json
  def index
    @livro_leitors = LivroLeitor.all
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
  end

  # POST /livro_leitors or /livro_leitors.json
  def create
    @livro_leitor = LivroLeitor.new(livro_leitor_params)

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
      params.require(:livro_leitor).permit(:data_inicio, :data_entrega, :data_possivel_entrega, :status, :observacao, :user_id, :livro_id, :leitor_id)
    end
end
