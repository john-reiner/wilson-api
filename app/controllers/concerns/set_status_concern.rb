module SetStatusConcern
    extend ActiveSupport::Concern
    def set_status
        # byebug
        if !@list.completed?
            if @list.tasks.all? { |task| task.completed }
                return @list.ready!
            end
            if @list.tasks.all? { |task| !task.completed}
                return @list.pending! 
            end
            return @list.working!
        end

        if @list.ready?
            byebug
        end
    end
end