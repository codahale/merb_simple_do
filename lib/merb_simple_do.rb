# make sure we're running inside Merb
if defined?(Merb::Plugins)
  require "simple_do"
  
  Merb::BootLoader.before_app_loads do
    Merb.logger.info("Connecting to database...")
    ::DB = DataObjects::Simple.new(Merb.dir_for(:config) / "database.yml", Merb.environment)
    ::DB.logger = Merb.logger
  end
end