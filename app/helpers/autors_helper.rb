module AutorsHelper
    def listAutorsAll
        @autors = Autor.order(:nome)
    end
end
