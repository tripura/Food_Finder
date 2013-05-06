require 'restaurant'
class Guide

class Config
  @@actions = ['list', 'add', 'find', 'quit']
  def self.actions; @@actions; end
end

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
    result = nil
    until result == :quit
      action = get_action
      result = do_action(action)
    end
    conclusion
  end

  def get_action
    action = nil
    until Guide::Config.actions.include?(action)
    puts "Actions: " + Guide::Config.actions.join(", ") if action
    print "> "
    user_response = gets.chomp
    action = user_response.downcase.strip
    end
    return action
  end

  def do_action(action)
    case action
    when 'list'
      puts "Listing...."
    when 'find'
      puts "Finding...."
    when 'add'
      add
    when 'quit'
      return :quit
    else
      puts "\n I don't understand the command./n"
    end
  end

  def add
    puts "\n Add a Restaurant.\n\n".upcase
    
    restaurant = Restaurant.build_using_questions

    if restaurant.save
      puts "\nRestaurant Added.\n"
    else
      puts "\n Save error: Restaurant not added.\n"
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
 
