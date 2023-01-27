class HomesController < ApplicationController
  def index
    @users = User.all
    # @portal_session = current_user.payment_processor.billing_portal
  end
end
