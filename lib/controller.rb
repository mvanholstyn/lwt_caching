module LWT
  module Caching
    module Controller
      def self.included base #:nodoc:
        base.extend ClassMethods
      end
      
      module ClassMethods
        def cache_page_path *actions 
          return unless perform_caching
          actions.each do |action|
            class_eval "after_filter { |c| cache_page( c.response.body, c.request.path ) if c.action_name == '#{action}' }"
          end
        end
      end
    end
  end
end
