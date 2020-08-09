class  Api::V1::BaseController < ActionController::API
  include ExceptionHandler

  before_action :only_respond_to_json

  private
  def only_respond_to_json
    head :not_acceptable unless params[:format] == 'json'
  end

  def json_response(object)
    serializer = Object.const_get("#{object_class(object)}Serializer")
    serializer.new(object)
  end

  def object_class(object)
    object.try(:klass) || object.try(:class)
  end
end
