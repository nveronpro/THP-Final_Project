class AdminMailer < ApplicationMailer
  default from: '	Do-not-reply@yopmail.com '

  def order_email(order)
    @order = order 
    @user = order.user    
    @cart = @user.cart
    @url = 'http://monsite.fr'
    @admin = Admin.all
    @admin.each do |f|
      mail(to: f.email, subject: 'Harry Cover - Nouvelle commande')
    end      
  end
end
