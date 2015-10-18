class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_reader
    Reader.find_by(id: session[:reader_id]) || create_reader
  end

  def create_reader
    # TODO: figure out how to move this out of controller
    r = Reader.create
    # TODO: use feature flag instead of querying env
    unless Rails.env.test?
      domain_factory.sample_book.for_reader(r)
    end
    session[:reader_id] = r.id
    r
  end

  def domain_factory
    @domain_factory ||= Domain::DomainFactory.new
  end
  helper_method :domain_factory
end
