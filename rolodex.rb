class Rolodex
	@@ids = 1001

	def initialize 
		@contacts = []
	end

	def add_contact(contact)
		contact.id = @@ids
		#what is happening in contact.id?
		@contacts << contact
		@@ids += 1
		contact 
	end
end
