class UserMailer < ApplicationMailer
    default from: '	monthlee@yopmail.com '
   
    def welcome_email(user)
      #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
      @user = user 
  
      #on définit une variable @url qu'on utilisera dans la view d’e-mail
      @url  = 'https://the-final-project-production.herokuapp.com' 
  
      # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
      mail(to: @user.email, subject: 'Bienvenue chez nous !') 
    end
    
    def order_email(order)
      @order = order 
      @user = order.user
      @cart = @user.cart
      @url = 'http://monsite.fr'
      mail(to: @user.email, subject: 'Harry Cover - Merci pour votre commande')      
    end
end