require_relative './rolodex.rb'
require_relative './contact.rb'


class CRM
attr_accessor :name

	def initialize(name)
		@name = name
		@rolodex = Rolodex.new
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

	def add_contact
		puts "\nProvide contact details..."

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
		contact = @rolodex.find_contact(id_entry)
		contact 
	end

	def display_attribute
		puts "\nProvide a contact ID: "
		id_entry = gets.chomp.to_i

		puts "\nWhich attribute do you want to display?"
		print_attribute_menu
		attribute_entry = gets.chomp.to_i

		puts "\nDisplaying attribute:"
		@rolodex.display_attribute(id_entry, attribute_entry)
		
	end

	def print_attribute_menu 
		puts "\n[1] First Name"
		puts "[2] Last Name"
		puts "[3] Email"
		puts "[4] Note"
		puts "\nEnter a number:"
	end

	def delete_contact
		puts "\nProvide a contact ID: "
		id_entry = gets.chomp.to_i
		@rolodex.delete_one_contact(id_entry)
		puts "\nContact #{id_entry} is deleted FOREVER!"
	end

	def modify_contact
		puts "\nProvide a contact ID: "
		id_entry = gets.chomp.to_i 

		puts "\nYou selected:"
		
		@rolodex.find_contact(id_entry)

		puts "\nSelect an attibute to modify:"
		print_attribute_menu
		attribute_entry = gets.chomp.to_i

		case attribute_entry
		when 1 then 
			puts "Enter a new first name:"
			new_attr = gets.chomp
		when 2 then 
			puts "Enter a new last name:"
			new_attr = gets.chomp
		when 3 then 
			puts "Enter a new email:"
			new_attr = gets.chomp
		when 4 then 
			puts "Enter a new note:"
			new_attr = gets.chomp
		end

		@rolodex.modify_attributes(id_entry, attribute_entry, new_attr)

		puts "\nYour contact has been updated to:"

		@rolodex.find_contact(id_entry)

	end

end 

bitmaker = CRM.new ("Bitmaker Labs CRM")
bitmaker.main_menu

#puts bitmaker.name

