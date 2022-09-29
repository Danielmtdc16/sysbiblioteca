module EditorasHelper
    def listEditorasAll
        @editoras = Editora.order(:nome)
    end
end
