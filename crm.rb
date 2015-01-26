require_relative './rolodex.rb'
require_relative './contact.rb'


class CRM
	attr_accessor :name

	def initialize(name, random_contacts=false)
		@name = name
		@rolodex = Rolodex.new
		@rolodex.add_random_contacts if random_contacts
	end

	def print_main_menu 

		puts "\n[1] Add a contact"
		puts "[2] Modify a contact"
		puts "[3] Display all contacts"
		puts "[4] Display one contact"
		puts "[5] Display an attribute"
		puts "[6] Delete a contact"
		puts "[7] Exit"
		puts "\nEnter a number:"
	end 

	def main_menu
		puts "\e[H\e[2J"

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
			puts "Incorrection option. Try again."	
		end
	end

	def prompt(msg)
		print msg
		gets.chomp
	end

	def add_contact
		puts "\nProvide contact details..."

		first_name = prompt "First name: "
		last_name  = prompt "Last name: "	
		email 	   = prompt "Email: "	
		note 	   = prompt "Note: "

		instance_contact = Contact.new(first_name, last_name, email, note)
		new_contact = @rolodex.new_contact(instance_contact)
		
		puts "\nYou successfully added the contact below:"
		puts new_contact

	end

	def display_all
		puts "\nHere are all the contacts in the rolodex:"
		puts @rolodex.display_all_contacts
		#call a method on rolodex that prints all contacts
	end

	def display_one
		puts "\nProvide a contact ID: "
		id_entry = gets.chomp.to_i
		puts "\nYou chose to display:"
		puts @rolodex.find_contact(id_entry)
	end

	def display_attribute

		# puts "\nWhich attribute do you want to display?"
		# print_attribute_menu
		# attribute_entry = gets.chomp.to_i
		
		attribute_name = input_attribute_name

		puts "\nDisplaying #{attribute_name} for all contacts:"
		
		puts @rolodex.display_attribute(attribute_name)
		
	end

	ATTRIBUTE_NAMES = %w[
		first_name
		last_name
		email
		note
	]

	def input_attribute_name
		loop do 
			puts "\nSelect an attibute:"
			puts "\n[1] First Name"
			puts "[2] Last Name"
			puts "[3] Email"
			puts "[4] Note"
			puts "\nEnter a number:"

			attribute_entry = gets.chomp.to_i
			
			attribute_name = ATTRIBUTE_NAMES[attribute_entry-1]

			if attribute_name
				return attribute_name
			else
				puts "Incorrect entry. Try again."
			end
		end
	end

	# def print_attribute_menu 
	# 	puts "\n[1] First Name"
	# 	puts "[2] Last Name"
	# 	puts "[3] Email"
	# 	puts "[4] Note"
	# 	puts "\nEnter a number:"
	# end

	def delete_contact
		puts "\nProvide a contact ID: "
		id_entry = gets.chomp.to_i
		@rolodex.delete_one_contact(id_entry)
		puts "\nContact #{id_entry} is deleted FOREVER!"
	end

	def modify_contact
		puts "\nProvide a contact ID: "
		id_entry = gets.chomp.to_i 

		contact = @rolodex.find_contact(id_entry)

		puts "\nYou selected:"
		puts contact		

		attribute_name = input_attribute_name
	
		puts "Enter a new #{attribute_name}:"
		new_attr = gets.chomp

		contact.update_attribute(attribute_name, new_attr)

		puts "\nYour contact has been updated to:"
		puts contact
	end

end 

bitmaker = CRM.new("Bitmaker Labs CRM", true)
bitmaker.main_menu

#puts bitmaker.name

