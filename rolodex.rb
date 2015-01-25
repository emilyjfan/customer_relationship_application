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

	def display_one_contact(id)
		index = @contacts.index(id)
		@contacts [index.to_i]
	end

	def display_all_contacts
		@contacts
	end

	def display_one_attribute(contact_id)
		@contact.each do |contact| 
			puts contact.id
		end
	end 
	
	def delete_one_contact(id)
		@contacts.delete(id)	
	end

end

