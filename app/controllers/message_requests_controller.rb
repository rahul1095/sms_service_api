class MessageRequestsController < ApplicationController
  def create
    message_request = MessageRequest.create(message_params)
    SendSmsJob.perform_later(message_request.id) # Enqueue a background job to send the SMS
    render json: { message: 'Message request received and being processed.' }, status: :created
  end

  private

  def message_params
    params.permit(:phone_number, :message_body, :callback_url)
  end
end
