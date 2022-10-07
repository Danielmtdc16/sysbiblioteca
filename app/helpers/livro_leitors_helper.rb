module LivroLeitorsHelper

    def list_status
        @list_status =  
        [ 
        ["Pendente", "Pendente"],
        ["Prazo expirado", "Prazo expirado"],
        ["Entregue","Entregue"]
        ]
    end
    
end
