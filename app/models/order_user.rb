class OrderUser < ApplicationRecord
    belongs_to :order
    belongs_to :user
    after_create :order_send, :order_admin

    def order_send
	    UserMailer.order_email(self).deliver_now
    end
    
    def order_admin
	    AdminMailer.order_email(self).deliver_now
	end
end
