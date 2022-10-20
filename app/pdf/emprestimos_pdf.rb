class EmprestimosPdf < Prawn::Document
    include Util
        def initialize(livro_leitors, view)
          super(top_margin: 30)
          @livro_leitors = livro_leitors
          @view = view
          printPdf
        end
      
        def printPdf 
            horaAtual = Time.now
            text "#{horaAtual.strftime("%d/%m/%Y - %H:%M " )}", :align=> :right, :cell_style => { :font => "Courier"},:size => 10
            
            move_down 5
            text "Relatório das Reservas",:align=> :center,:style => :bold, :font => "Courier", :size => 17
          
            move_down 4 
    
            table tabela1 , :cell_style => { :font =>"Courier", :size => 6, :border_color=>"FFFFFF"} do
            #row(0).font_style = :bold
                column(0).width = 70
                column(0).font_style = :bold
                column(1).width = 140
                column(1).font_style = :bold
                column(2).width = 50
                column(2).font_style = :bold
                column(3).width = 50
                column(3).font_style = :bold
                column(4).width = 50
                column(4).font_style = :bold
                column(5).width = 50
                column(5).font_style = :bold
                column(6).width = 60
                column(6).font_style = :bold
                column(7).width = 50
                column(7).font_style = :bold
                
            end
        
            move_down 4 
            stroke_horizontal_line(0, 540, at: 595)
            i=0
            @livro_leitors.each do |livro_leitor|
                color = (i%2==0 ? "FFFFFF" : "F7F8E1")
                i=i+1
                table tabela2(livro_leitor) , :cell_style => { :style => :bold, :font =>"Courier", :size => 4}, row_colors: [color] do
                    #row(0).font_style = :bold
                    column(0).width = 70
                    column(1).width = 140
                    column(2).width = 50
                    column(3).width = 50
                    column(4).width = 50
                    column(5).width = 50
                    column(6).width = 60
                    column(7).width = 50

                end

            end
            move_down 10
            numero_paginas
            
        end
      
        def tabela1
              [["Código", "Leitor", "D.Emprést", "D.Entrega", "D.P.Entreg", "Status", "Titulo", "Tipo de leitor"]]
        end 

        def tabela2(livro_leitor)
            [["%06d"%livro_leitor.id, livro_leitor.leitor.nome, (livro_leitor.data_inicio != nil ? livro_leitor.data_inicio.strftime("%d/%m/%Y") : ''), (livro_leitor.data_entrega != nil ? livro_leitor.data_entrega.strftime("%d/%m/%Y") : ''), (livro_leitor.data_possivel_entrega != nil ? livro_leitor.data_possivel_entrega.strftime("%d/%m/%Y") : ''), livro_leitor.status, livro_leitor.livro.nome, livro_leitor.user.nome]]
        end 

           
        end