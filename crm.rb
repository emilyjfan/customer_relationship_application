require_relative './rolodex.rb'
require_relative './contact.rb'


class CRM
attr_accessor :name

	def initialize(name)
		@name = name
		@rolodex = Rolodex.new
	end

	def print_main_menu 
		puts "[1] Add a contact"
		puts "[2] Modify a contact"
		puts "[3] Display all contact"
		puts "[4] Display one contact"
		puts "[5] Display an attribute"
		puts "[6] Delete a contact"
		puts "[7] Exit"
		puts "Enter a number:"
	end 

	def main_menu
		puts "Welcome to #{@name}"
		
		while true
			print_main_menu
			input = gets.chomp.to_i
			choose_option(input)
			return if input == 7
		end
	end

	def choose_option(option)
		case option 
		when 1 then add_contact
		when 2 then modify_contact 
		when 3 then display_all
		when 4 then display_one
		when 5 then display_attribute
		when 6 then delete_contact
		when 7 then 
			puts "Goodbye!"
			return
		else
			puts "Incorrection option, try again."	
		end
	end

	def add_contact
		puts "Provide contact details"

		print "First name: "
		first_name = gets.chomp
	
		print "Last name: "	
		last_name = gets.chomp
	
		print "Email: "	
		email = gets.chomp
		
		print "Note: "
		note = gets.chomp

		add_contact = Contact.new(first_name, last_name, email, note)
		@rolodex.add_contact(contact)
		#clarify line above
	end
end 

bitmaker = CRM.new ("Bitmaker Labs CRM")
bitmaker.main_menu

puts bitmaker.name





