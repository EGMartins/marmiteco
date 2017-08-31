class ContactsController < ApplicationController

	layout 'welcome'

	def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
      flash.now[:notice] = 'Obrigado por demonstrar interesse!'
    else
      flash.now[:error] = 'Ops... Não pudemos enviar sua mensagem! Tente em alguns minutos...'
      render :new
    end
  end
end
