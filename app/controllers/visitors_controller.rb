class VisitorsController < ApplicationController
    def index
        @visitors = Visitor.all
        @unique_visitors = []
        @loyal_visitors = []
        @unique_os_device = []
        @loyal_os_device = []
        @visitors.each do |visitor|
          if !(@unique_visitors.include?(visitor.user_id))
            @unique_visitors.push(visitor.user_id)
            if (@visitors.where(user_id: visitor.user_id).count() >= 10)
              @loyal_visitors.push(visitor.user_id) 
              if (visitor.device == 1 || visitor.device == 2)
                if (visitor.os == 1 || visitor.os == 2)
                  @loyal_os_device.push(visitor.user_id)
                end
              end
            end
            if (visitor.os == 1 || visitor.os == 2)
              if (visitor.device == 1 || visitor.device == 2)
                @unique_os_device.push(visitor)
              end
            end
          end
        end
        @num_unique_visitors = @unique_visitors.length
        @num_loyal_visitors = @loyal_visitors.length
        @num_unique_os_device = @unique_os_device.length
        @num_loyal_os_device = @loyal_os_device.length

    end


end
