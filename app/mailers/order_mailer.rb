class OrderMailer < ApplicationMailer
  def order_mail(order, user)
    @order = order
    @user = user
    mail to: @user.email, subject: t(".ordered"), from: "ninhphamk41sp2@gmail.com"
  end
end
