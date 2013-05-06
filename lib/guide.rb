require 'restaurant'
class Guide

  def initialize(path = nil)
    Restaurant.filepath = path
    if Restaurant.file_exists?
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

    conclusion
  end

  def introduction
    puts "\n\n<<<Welcome to Food Finder>>>\n\n"
    puts "This is an interactive guide that helps you to find the food that you crave.\n"
  end

  def conclusion
    puts "\n\n<< GoodBye and Bon Apetit .>>\n\n"
  end
end
 
