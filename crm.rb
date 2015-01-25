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
		puts "[3] Display all contacts"
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

		instance_contact = Contact.new(first_name, last_name, email, note)
		new_contact = @rolodex.new_contact(instance_contact)
		
		puts new_contact

	end

	def display_all
		puts @rolodex.display_all_contacts
		#call a method on rolodex that prints all contacts
	end

	def display_one
		
		puts "Provide a contact ID: "
		id_entry = gets.chomp 

		contact = @rolodex.find_contact(id_entry)
	
		puts "you want to see #{contact}" 
	end

	def display_attribute
		puts "Provide a contact ID: "
		id_entry = gets.chomp 

		attribute = @rolodex.display_one_attribute(id_entry)
	end


	def delete_contact
	end

	# def modify_contact
	# 	puts "Provide a contact ID: "
	# 	id_entry = gets.chomp 

	# 	puts "Are you sure you want to modify #{id_entry}? Enter 'Y' or 'N'."
	# 	confirmation = gets.chomp 

	# 	if confirmation == "Y"	

	# 	print "First name: "
	# 	first_name = gets.chomp
	
	# 	print "Last name: "	
	# 	last_name = gets.chomp
	
	# 	print "Email: "	
	# 	email = gets.chomp
		
	# 	print "Note: "
	# 	note = gets.chomp

	# 	else
	# 	end
	# end

end 

bitmaker = CRM.new ("Bitmaker Labs CRM")
bitmaker.main_menu

#puts bitmaker.name

