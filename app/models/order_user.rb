class OrderUser < ApplicationRecord
    belongs_to :order
    belongs_to :user
    after_create :order_send

    def order_send
	    UserMailer.order_email(self).deliver_now
	end
end
