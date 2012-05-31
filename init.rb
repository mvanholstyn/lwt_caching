dir = File.join( File.dirname( __FILE__ ), 'lib' )

require File.join( dir, 'controller' )
require File.join( dir, 'sweeper' )
ActionController::Base.send :include, LWT::Caching::Controller
ActionController::Caching::Sweeper.send :include, LWT::Caching::Sweeper
