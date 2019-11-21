class EmailController < ApplicationController
  def index
  	@emails = Email.all
  end

  def new
  @email = Email.new
  end

  def create
  @email = Email.create(object: Faker::Lorem.sentence, body: Faker::Lorem.paragraph)
   if @email.save # essaie de sauvegarder en base @gossip
    # si ça marche, il redirige vers la page d'index du site
       @emails=Email.all
     
      respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
 	  end
  end
  end

  def show
  @email = Email.find(params[:id])
  respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end 

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
       
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
       
end 
  

  

end
