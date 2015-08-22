class LeadMailer < ApplicationMailer
	def new_lead(lead)
		@lead = lead
		mail(to: "nate@devocode.com", from: @lead.email, subject: "New Contact in Devocode!")
	end
end
