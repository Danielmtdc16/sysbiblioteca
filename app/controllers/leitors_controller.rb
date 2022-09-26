class LeitorsController < ApplicationController
  before_action :set_leitor, only: %i[ show edit update destroy ]

  # GET /leitors or /leitors.json
  def index
    @leitors = Leitor.all
  end

  # GET /leitors/1 or /leitors/1.json
  def show
  end

  # GET /leitors/new
  def new
    @leitor = Leitor.new
  end

  # GET /leitors/1/edit
  def edit
  end

  # POST /leitors or /leitors.json
  def create
    @leitor = Leitor.new(leitor_params)

    respond_to do |format|
      if @leitor.save
        format.html { redirect_to leitor_url(@leitor), notice: "Leitor was successfully created." }
        format.json { render :show, status: :created, location: @leitor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @leitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leitors/1 or /leitors/1.json
  def update
    respond_to do |format|
      if @leitor.update(leitor_params)
        format.html { redirect_to leitor_url(@leitor), notice: "Leitor was successfully updated." }
        format.json { render :show, status: :ok, location: @leitor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @leitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leitors/1 or /leitors/1.json
  def destroy
    @leitor.destroy

    respond_to do |format|
      format.html { redirect_to leitors_url, notice: "Leitor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leitor
      @leitor = Leitor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def leitor_params
      params.require(:leitor).permit(:nome, :cpf, :telefone, :email, :tipo_leitor, :matricula)
    end
end
