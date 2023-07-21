class MessageCallbacksController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    message_request = MessageRequest.find_by(id: params[:message_id])
    return unless message_request

    # Update the status of the message_request based on the provider's callback
    message_request.update(status: params[:status])
    MessageStatusCallback.create(message_request: message_request, status: params[:status], message_id: params[:message_id])
    head :ok
  end
end
