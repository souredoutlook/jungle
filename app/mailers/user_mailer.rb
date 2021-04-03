class UserMailer < ApplicationMailer
  default from: 'orders@jungle.com'
 
  def order_confirmation_email(order)
    @order = order
    mail(to: order.email, subject: "Jungle Order ##{order.id}")
  end
end
