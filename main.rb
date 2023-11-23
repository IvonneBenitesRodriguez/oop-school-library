require_relative 'message_class'
require_relative 'app_class'

def main
  app = App.new
  Message.welcome_message
  loop do
    Message.display_options
    option = gets.chomp
    if option == '7'
      app.close_app
      break
    end
    puts ''
    app.handle_option(option)
  end
  Message.close_message
end

main
