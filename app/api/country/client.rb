module Country
  class Client
    def self.symbol
      Request.connection
    end
  end
end