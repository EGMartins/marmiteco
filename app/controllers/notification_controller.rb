class NotificationController < LoggedController
  # skip_before_filter :authenticate_user!, :only => :create
  protect_from_forgery
  
  def create
    # transaction = PagSeguro::Transaction.find_by_notification_code(params[:notificationCode])
    transaction = PagSeguro::Notification.new(notificationCode, 'transaction').transaction
    mystatus = ['Aguardando Pagamento', 'Em análise', 'Paga', 'Disponível', 'Em disputa', 'Devolvida', 'Cancelada']

    if transaction.errors.empty?
      order = Order.where(reference: transaction.reference).last
      order.status = mystatus[transaction.status.to_i - 1]
      if transaction.status == '3'
        order.user.business.active = true
        order.user.business.save
        order.end_date = 30.days.from_now
        order.save
      end
      order.save
    end

      render nothing: true, status: 200
  end
end