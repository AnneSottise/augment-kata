class WorkersController < ApplicationController
  before_filter :set_worker, except: [:new, :create, :index]

  def index
    @workers = Worker.all
  end

  def new
    @worker = Worker.new
  end

  def create
    @worker = Worker.new worker_params

    if @worker.save
      redirect_to workers_url,
                  notice: 'Worker successfully created.'
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @worker.update(worker_params)
      redirect_to workers_url,
                  notice: 'Worker successfully updated.'
    else
      render action: 'edit'
    end
  end

  def show
  end

  def destroy
    @worker.destroy
    redirect_to workers_url,
                notice: 'Worker successfully destroyed.'
  end

  private

  def set_worker
    @worker = Worker.find params[:id]
  end

  def worker_params
    params.require(:worker)
          .permit :first_name, :status
  end
end
