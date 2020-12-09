class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:home])
    @contact.request = request
    respond_to do |format|
      if @contact.deliver
        # re-initialize Home object for cleared form
        @contact = Contact.new
        format.html { render :create, notice: 'Votre message a ete bien envoye.'}
        format.json { render :create, status: :ok }
      else
        format.html { render :new, notice: 'Echec, essayez a nouveau.' }
        format.json { render :new, status: :unprocessable_entity }
      end
    end
  end
  
end


    #def create
     # @contact = Contact.new(params[:contact])
      #@contact.request = request
      #if @contact.deliver
       # flash[:error] = nil
      #else
       # flash[:error] = "Echec, essayez a nouveau."
        #render :new
      #end
    #end