class Page
  include RSpec::Matchers
  include Capybara::DSL

  attr_reader :page

  def initialize(page)
    @page = page
  end
end
