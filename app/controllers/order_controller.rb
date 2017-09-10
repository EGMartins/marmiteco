class OrderController < LoggedController
  before_action :set_user, :set_order, :set_product, :set_reference

  protect_from_forgery

  # Gerar um Token de sessão para nosso pagamento
  def new
    @product
    session = PagSeguro::Session.new
    @session_id = session.create.id
  end

  # Enviar nosso pagamento para o Pagseguro
  def create

    payment = PagSeguro::Payment.new(notification_url: 'https://safe-dusk-38202.herokuapp.com/notification', payment_method: 'creditCard', reference: '1')


    ## Adicionando endereço do comprador
    address = PagSeguro::Address.new(postal_code: params[:zipcode], street: params[:street], number: params[:number], complement: '', district: params[:district], city: params[:city], state: params[:state])
    
    shipping = PagSeguro::Shipping.new
    shipping.address = address
    payment.shipping = shipping
    

    items = [PagSeguro::Item.new(id: @product.id, description: @product.description, amount: @product.price, quantity: 1)]
    payment.items = items

    # Criando uma referencia para a nossa ORDER
    
    payment.reference = @reference


    phone = PagSeguro::Phone.new(params[:phone_code], params[:phone_number])
    document = PagSeguro::Document.new(params[:cpf])
    sender = PagSeguro::Sender.new(email: params[:email], name: params[:name], hash_id: params[:sender_hash] )
    sender.phone = phone
    sender.document = document
    payment.sender = sender

    # payment.credit_card_token = params[:card_token]
    credit_card = PagSeguro::CreditCard.new(params[:card_token])
    credit_card.holder = PagSeguro::Holder.new(params[:card_name], params[:birthday].to_datetime())
    document = PagSeguro::Document.new(params[:cpf])
    credit_card.holder.document = document
    phone = PagSeguro::Phone.new(params[:phone_code], params[:phone_number])
    credit_card.holder.phone = phone
    
    credit_card.billing_address = address

    payment.credit_card = credit_card


    credit_card.installment = PagSeguro::Installment.new(1, @product.price)

    # payment.create
    transaction = payment.transaction



    # Cria uma Order para registro das transações
    
    create_order
    
    
    

    if payment.errors.any?
     puts "=> ERRORS"
     puts payment.errors.join("\n")
     render plain: "Erro No Pagamento #{payment.errors.join("\n")}"
    else

      redirect_to order_index_path

    end

  end

  def index
    @user
    @orders
  end

private
  
  def set_user
    @user = User.find(session[:id])
  end
  def set_order
    @orders = @user.orders.order('created_at DESC')
  end
  def set_product
    @product = Product.last
  end
  def set_reference
    @reference = "REF_#{(0...8).map { (65 + rand(26)).chr }.join}_#{@product.id}"
  end
def create_order
  Order.create(product_id: @product.id, price: @product.price, buyer_name: @user.name, reference: @reference, status: 'Pendente', user_id: @user.id)
  @order = Order.last
  @order.user.business.active = false
  @order.user.business.save!
end


end