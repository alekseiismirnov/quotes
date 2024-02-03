require 'active_support/concern'

module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end
end
