class PaymentDecorator < BaseDecorator
  def displayed_money
    amount ? amount : "NOT PAYED"
  end

  def displayed_date
    amount ? date_of_payment.to_s : "NOT PAYED"
  end
end
