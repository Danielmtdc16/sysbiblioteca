module Util 
    def numero_paginas
        string = "página <page> de <total>"
          # Green page numbers 1 to 11
          options = { :at => [bounds.right - 150, 0],
           :align => :right,
           :size => 7,
           :start_count_at => 1,
           :color => "000000" }
          number_pages string, options
      end
end