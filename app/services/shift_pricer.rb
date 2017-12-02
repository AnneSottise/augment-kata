# A simple service used to compute the money owed to a worker.
class ShiftPricer
  STATUS_PRICES = {
    intern:    126_00,
    medic:     270_00,
    temporary: 480_00,
  }

  NoStartDate      = Class.new(StandardError)
  NoWorkerAssigned = Class.new(StandardError)

  def initialize(shift)
  	@shift = shift
  end

  def perform
    raise NoStartDate      unless @shift.start_date
    raise NoWorkerAssigned unless @shift.worker

    @shift.price_cents = price_cents
  end

  private

  def date_multiplicator
    return 1 if @shift.start_date.workday?

    2
  end

  def price_cents
    worker_price * date_multiplicator
  end

  def worker_price
    @worker_price ||=
      case @shift.worker.status
      when 'intern'
        STATUS_PRICES[:intern]
      when 'medic'
        STATUS_PRICES[:medic]
      when 'temporary'
        STATUS_PRICES[:temporary]
      else
        0
      end
  end
end
