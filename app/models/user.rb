class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

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