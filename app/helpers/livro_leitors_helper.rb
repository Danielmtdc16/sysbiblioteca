module LivroLeitorsHelper

    def list_status
        @list_status =  
        [ 
        ["Pendente", "Pendente"],
        ["Prazo expirado", "Prazo expirado"],
        ["Entregue","Entregue"]
        ]
    end
    
    def list_status_multa
        @list_status_multa =  
        [ 
        ["Sem multa","Sem multa"],
        ["Pendente de Pagamento", "Pendente de Pagamento"],
        ["Revogado", "Revogado"],
        
        ]
    end
end
