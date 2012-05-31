module LWT
  module Caching
    module Sweeper
      def self.included base #:nodoc:
        base.send :include, InstanceMethods
      end
      
      module InstanceMethods
        def expire_page_path path, options = {}
          options = options.reverse_merge :recursive => false
          if options[:recursive]
            Dir.glob( File.join( RAILS_ROOT, 'public', path ) ).each do |path|
              puts "Expiring Cached Page: " + path
              FileUtils.rm_rf( path )
            end
          else
            path = 'index' if path == '' or path == '/'
            path += ".html" if File.extname( path ) == ''
            Dir.glob( File.join( RAILS_ROOT, 'public', path ) ).each do |path|
              puts "Expiring Cached Page: " + path
              FileUtils.rm_f( path )
            end
          end
        end
      end
    end
  end
end
