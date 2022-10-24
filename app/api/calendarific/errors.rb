module Calendarific
  class Errors
    def self.status(code)
      case code
      when 401
        return "Unauthorized"
      when 422
        return "Un-processable Entity"
      when 429 
        return "Too Many Requests"
      when 500
        return "Internal Server Error"
      when 503
        return "Service Unavailable"
      end
    end
  end
end