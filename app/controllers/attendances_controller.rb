
class AttendancesController < ApplicationController

  def new
  end

  def create
    # Amount in cents
    puts @id = params[:event_id]
    puts @event = Event.find(@id)
    puts @amount = @event.price * 100
    customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => 'Event customers',
        :currency    => 'eur'
    )


    new_attendance = Attendance.create(stripe_customer_id: customer, user: current_user, event: @event)
    redirect_to event_path(@event)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end