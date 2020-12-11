class ContactsController < ApplicationController
  def new
  end

  def create
    respond_to do |format|
      if AdminMailer.contact_email(email_params).deliver_now
        # re-initialize Home object for cleared form
        format.html { redirect_to root_path, notice: t("message_sent")}
        format.json { render :create, status: :ok }
      else
        format.html { redirect_to new_contact_path, notice: t("issue_message_sent") }
        format.json { render :new, status: :unprocessable_entity }
      end
    end
  end

private
  def email_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
