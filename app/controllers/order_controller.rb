class OrderController < ApplicationController
  protect_from_forgery

  # Gerar um Token de sessão para nosso pagamento
  def new
    @product = Product.find(params[:product_id])
    session = PagSeguro::Session.create
    @session_id = session.id
  end

  # Enviar nosso pagamento para o Pagseguro
  def create
    @product = Product.find(params[:product_id])

    payment = PagSeguro::CreditCardTransactionRequest.new
    payment.notification_url = "https://safe-dusk-38202.herokuapp.com/notification"
    payment.payment_mode = "default"


    ## Adicionando endereço do comprador
    address = PagSeguro::Address.new(postal_code: params[:zipcode], street: params[:street], number: params[:number], complement: '', district: params[:district], city: params[:city], state: params[:state])
    shipping = PagSeguro::Shipping.new
    shipping.address = address
    payment.shipping = shipping
    payment.billing_address = address

    # Aqui vão os itens que serão cobrados na transação, caso você tenha multiplos itens
    # em um carrinho altere aqui para incluir sua lista de itens
    payment.items << {
      id: @product.id,
      description: @product.description,
      amount: @product.price,
      weight: 0
    }

    # Criando uma referencia para a nossa ORDER
    reference = "REF_#{(0...8).map { (65 + rand(26)).chr }.join}_#{@product.id}"
    payment.reference = reference
    payment.sender = {
      hash: params[:sender_hash],
      name: params[:name],
      email: params[:email],
      cpf: params[:cpf],
      phone: {
       area_code: params[:phone_code],
       number: params[:phone_number]
     }
    }

    payment.credit_card_token = params[:card_token]
    payment.holder = {
     name: params[:card_name],
     birth_date: params[:birthday],
     document: {
       type: "CPF",
       value: params[:cpf]
     },
     phone: {
       area_code: params[:phone_code],
       number: params[:phone_number]
     }
    }

    payment.installment = {
     value: @product.price,
     quantity: 1
    }

    puts "=> REQUEST"
    puts PagSeguro::TransactionRequest::RequestSerializer.new(payment).to_params
    puts

    payment.create

    # Cria uma Order para registro das transações
    Order.create(product_id: @product.id, buyer_name: params[:name], reference: reference, status: 'Pendente')

    if payment.errors.any?
     puts "=> ERRORS"
     puts payment.errors.join("\n")
     render plain: "Erro No Pagamento #{payment.errors.join("\n")}"
    else
      @order = Order.last
      @order.user = current_user
      @order.save!

      redirect_to order_index_path

    end

  end

  def index
    @orders = current_user.orders
  end

end