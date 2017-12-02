class ShiftsController < ApplicationController
  before_filter :set_shift, except: [:new, :create, :index]

  def index
    @shifts = Shift.all.map(&:decorate)
  end

  def new
    @shift = Shift.new
  end

  def create
    @shift = Shift.new shift_params

    if @shift.save
      redirect_to shifts_url,
                  notice: 'Shift successfully created.'
    else
      render action: 'new'
    end
  end

  def edit
    @shift = @shift.decorate
  end

  def update
    if @shift.update(shift_params)
      redirect_to shifts_url,
                  notice: 'Shift successfully updated.'
    else
      render action: 'edit'
    end
  end

  def show
  end

  def destroy
    @shift.destroy
    redirect_to shifts_url,
                notice: 'Shift successfully destroyed.'
  end

  private

  def set_shift
    @shift = Shift.find params[:id]
  end

  def shift_params
    params.require(:shift)
          .permit :start_date, :worker_id
  end
end
