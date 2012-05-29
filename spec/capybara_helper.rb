def screenshot
  require 'capybara/util/save_and_open_page'
  now = Time.now
  p = "/#{now.strftime('%Y-%m-%d-%H-%M-%S')}-#{rand}"
  Capybara.save_page body, "#{p}.html"
  path = Rails.root.join("#{Capybara.save_and_open_page_path}#{p}.png").to_s
  page.driver.render path
  Launchy.open path
end

def verify_alert_message(msg, &block)
  page.evaluate_script %Q|  window.alert = function(msg) {
                              window.alert_message = msg;
                              return true;
                            }; |
  yield
  page.evaluate_script("window.alert_message").should eq(msg)
ensure
  page.evaluate_script("window.alert_message = null")
end

def js_confirm(accept=true)
  page.evaluate_script "window.original_confirm = window.confirm"
  page.evaluate_script "window.confirm = function(msg) { return #{!!accept}; }"
  yield
ensure
  page.evaluate_script "window.confirm = window.original_confirm"
end

def wait_until_ajax_done
  Capybara.default_wait_time = 5
  wait_until do
    page.evaluate_script('jQuery.active') == 0
  end
  Capybara.default_wait_time = 2
end
