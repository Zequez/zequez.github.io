require "rubygems"
require "json"
# require "time"
 
# class Date
#   DAYNAMES = [nil] + %w{Domingo Lunes Martes Miércoles Jueves Viernes Sábado Domingo}
#   ABBR_DAYNAMES = [nil] + %w{Dom Lun Mar Mié Jue Vie Sáb Dom}
#   MONTHNAMES = [nil] + %w{Enero Febrero Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre Dicembre}
#   ABBR_MONTHNAMES = [nil] + %w{Ene Feb Mar Abr May Jun Jul Ago Sep Oct Nov Dic}
# end

module JsonFilter
  def json(input)
    input.to_json
  end

  # def date(input, format)
  #   if format.to_s.empty?
  #     return input.to_s
  #   end
    
  #   date = case input
  #   when String
  #     Time.parse(input)
  #   when Date, Time, DateTime
  #     input
  #   else
  #     return input
  #   end
            
  #   date.strftime(format.to_s)
  # rescue => e 
  #   input
  # end
  
  Liquid::Template.register_filter self
end