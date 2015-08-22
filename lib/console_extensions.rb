# Autoload stuff into the Rails console
module ConsoleExtensions
  # Returns a DomainFactory object
  def df
    @df ||= Domain::DomainFactory.new
  end
end
