require 'restaurant'
class Guide

  def initialize(path = nil)
    Restaurant.filepath = path
    if Restaurant.file_usable?
       puts "Found Restaurant file."
    elsif Restaurant.create_file
       puts "Created Restaurant file."
    else 
       puts "Exiting./n/n"
       exit!
    end
  end

  def launch!
    introduction
    loop do
      print "> "
      user_response = gets.chomp
      result = do_action(user_response)
      break if result == :quit
    end
    conclusion
  end

  def do_action(action)
    case action
    when 'list'
      puts "Listing...."
    when 'find'
      puts "Finding...."
    when 'add'
      puts "Adding...."
    when 'quit'
      return :quit
    else
      puts "\n I don't understand the command./n"
    end
  end
  def introduction
    puts "\n\n<<<Welcome to Food Finder>>>\n\n"
    puts "This is an interactive guide that helps you to find the food that you crave.\n"
  end

  def conclusion
    puts "\n\n<< GoodBye and Bon Apetit .>>\n\n"
  end
end
 
