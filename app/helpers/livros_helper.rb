module LivrosHelper
    def listLivrosAll
        @livros = Livro.order(:nome)
    end
end
