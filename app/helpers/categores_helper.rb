module CategoresHelper
    def listCategoresAll
        @categores = Categore.order(:nome)
    end
end
