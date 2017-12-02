module ApplicationHelper
	def workers
    collection =
	    Worker.all.order(:first_name).map do |worker|
	      [worker.first_name, worker.id]
	    end

    collection
  end
end
