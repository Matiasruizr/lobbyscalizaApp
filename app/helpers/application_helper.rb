module ApplicationHelper
    def audiencias(rut)
      @audiencias  = ActiveRecord::Base.connection.execute("SELECT count(*) FROM ASISTENTE WHERE representa_rut='#{rut}';")
    end

end
