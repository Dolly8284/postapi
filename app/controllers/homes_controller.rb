class HomesController < ApplicationController
  def index
    return unless current_user
    return if current_user.payment_processor.nil?

    @portal_session = current_user.payment_processor.billing_portal
  end
end
