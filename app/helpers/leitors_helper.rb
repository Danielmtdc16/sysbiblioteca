module LeitorsHelper
    def listLeitorsAll
        @leitors = Leitor.order(:nome)
    end
end
