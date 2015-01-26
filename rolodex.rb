class Rolodex
	@@ids = 1001

	def initialize 
		@contacts = []
	end

	def new_contact(contact)
		contact.id = @@ids
		@contacts << contact
		@@ids += 1
		contact
	end

	def find_contact(contact_id)
		@contacts.each do |contact| 
			if contact_id == contact.id
				puts contact
			end 
		end
	end

	# def display_one_contact(id)
	# 	index = @contacts.index(id)
	# 	@contacts [index.to_i]
	# end

	def display_all_contacts
		@contacts
	end

	def display_attribute(contact_id, attribute_entry)
		@contacts.each do |contact| 
			if contact_id == contact.id
				case attribute_entry
				when 1 then puts contact.first_name
				when 2 then puts contact.last_name
				when 3 then puts contact.email
				when 4 then puts contact.note
				else
					puts "Incorrect option. Try again."
				end 
			end 
		end
	end
	
	def delete_one_contact(contact_id)
		@contacts.delete_if {|contact| contact_id == contact.id}
	end 

end

