class User < ApplicationRecord
  include SubscriptionConcern
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # pay_customer default_payment_processor: :stripe
  pay_customer stripe_attributes: :stripe_attributes       
end
 def stripe_attributes(pay_custmor)
    {
      address:{
        city: pay_custmor.owner.city,
        country: pay_custmor.owner.country
      },
      metadata:{
        pay_custmor_id: pay_custmor.id,
        user_id: id #or pay_customer.owner_id
      }
    }
  end

  def pay_should_sync_customer?
    # super will invoke Pay's default (e-mail changed)
    super || self.saved_change_to_address? || self.saved_change_to_name?
  end