class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def show
   @contact = Contact.find(params[:id])
 end

 def new
   @contact = Contact.new
   render :new
 end

 def create
   @contact = Contact.new(contact_params)
   if @contact.save
     flash[:notice] = "Contact saved!"
     redirect_to "/"
   else
     render :new
   end
 end

 def edit
   @contact = Contact.find(params[:id])
   render :edit
 end

 def update
   @contact = Contact.find(params[:id])
   if @contact.update(contact_params)
     redirect_to contact_path
   else
     render :edit
   end
 end

 def destroy
   @contact = Contact.find(params[:id])
   @contact.destroy
   redirect_to "/"
 end

 private def contact_params
   params.require(:contact).permit(:name, :number)
 end
end
