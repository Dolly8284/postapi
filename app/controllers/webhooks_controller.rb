# class WebhooksController < ApplicationController
#   skip_before_action :authenticate_user!
#   skip_before_action :verify_authenticity_token

#   def create
#     payload = request.body.read
#     sig_header = request.env['HTTP_STRIPE_SIGNATURE']
#     event = nil

#     begin
#       event = Stripe::Webhook.construct_event(
#         payload, sig_header, Rails.application.credentials[:stripe][:webhook]
#       )
#     rescue JSON::ParserError => e
#       status 400
#       # Invalid payload
#       puts "Payload error"
#       return
#     rescue Stripe::SignatureVerificationError => e
#       # Invalid signature
#       puts "Signature error"
#       p e
#       return
#     end


#     # Handle the event
#     case event.type
#     when 'checkout.session.completed'
#       booking = Booking.find_by(checkout_session_id: event.data.object.id)
#       booking.update(paid: true)
#       booking.save

#       # @booking = Booking.where(checkout_session_id: event.data.object.id)
#       # @booking.update(paid: true)
#       # @booking.save
#     end

#     render json: { message: 'success' }
#   end
# end