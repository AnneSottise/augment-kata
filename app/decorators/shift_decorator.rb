class ShiftDecorator < Draper::Decorator
  delegate_all

  def formatted_start_date
    object.start_date.try(:strftime, '%Y-%m-%d')
  end

  def worker_name
    object.worker.try(:first_name)
  end

  def formatted_price_cents
    h.number_to_currency(
      shift.price_cents.fdiv(100),
      unit: '€'
    )
  end

  def title
    "#{formatted_start_date} - #{worker_name}"
  end
end
