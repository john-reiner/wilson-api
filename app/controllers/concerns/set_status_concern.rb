module SetStatusConcern
    extend ActiveSupport::Concern
    def set_status
        # byebug
        if !@list.completed?
            if @list.tasks.count == 0 
                return @list.pending!
            end
            if @list.tasks.all? { |task| task.completed }
                return @list.ready!
            end
            if @list.tasks.all? { |task| !task.completed}
                return @list.pending! 
            end
            return @list.working!
        end
    end
end