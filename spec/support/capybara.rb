Capybara.register_driver :remote_chrome do |app|
    url = ENV['SELENIUM_DRIVER_URL']
    caps = ::Selenium::WebDriver::Remote::Capabilities.chrome(
      'goog:chromeOptions' => {
        'args' => [
          'no-sandbox',
          'headless',
          'disable-gpu',
          'window-size=1680,1050'
        ]
      }
    )
    Capybara::Selenium::Driver.new(app, browser: :remote, url: url, desired_capabilities: caps)
  end
  
  RSpec.configure do |config|
    config.before(:each, type: :system) do
      driven_by :rack_test
    end
  
    config.before(:each, type: :system, js: true) do
      #driven_by :selenium_chrome_headless
      Capybara.server_host = IPSocket.getaddress(Socket.gethostname)
      Capybara.app_host = "http://#{Capybara.server_host}"
      driven_by :remote_chrome
    end
  end
  Capybara.default_driver = :rack_test
  Capybara.javascript_driver = :selenium_chrome_headless