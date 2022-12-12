module ConfiguracoesSistemasHelper

    def list_ativar_multa
        @list_ativar_multa   
        [ 
        ["Não", 0],
        ["Sim", 1],
        ]
    end

    def list_ativar_multa_invertida
		@list_ativar_multa =  
        {0=>"Não", 1=>"Sim"}
	end
end
