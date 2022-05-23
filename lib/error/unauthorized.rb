# frozen_string_literal: true

module Error
  class Unauthorized < StandardError
    attr_reader :status, :error, :message

    def initialize(error: 423, status: :unauthorized, message: 'Usuário não autorizado')
      @error = error
      @status = status
      @message = message
      super(msg: message)
    end

    def fetch_json
      Helpers::Render.json(error, message, status)
    end
  end

  class WrongNonce < StandardError
    attr_reader :status, :error, :message

    def initialize(error: 424, status: :unauthorized, message: 'Nonce errado')
      @error = error
      @status = status
      @message = message
      super(msg: message)
    end

    def fetch_json
      Helpers::Render.json(error, message, status)
    end
  end

  class NoSignature < StandardError
    attr_reader :status, :error, :message

    def initialize(error: 425, status: :unauthorized, message: 'Por favor assine')
      @error = error
      @status = status
      @message = message
      super(msg: message)
    end

    def fetch_json
      Helpers::Render.json(error, message, status)
    end
  end

  class WrongUser < StandardError
    attr_reader :status, :error, :message

    def initialize(error: 426, status: :unauthorized, message: 'Usuario diferente tentando logar')
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
