# frozen_string_literal: true

module Error
  class Unauthorized < StandardError
    attr_reader :status, :error, :message

    def initialize(error: 401, status: :unauthorized, message: "Usuário não autorizado")
      @error = error
      @status = status
      @message = message
      super(msg: message)
    end

    def fetch_json
      Helpers::Render.json(error, message, status)
    end
  end
end
