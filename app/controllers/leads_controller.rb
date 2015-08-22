class LeadsController < ApplicationController
	before_action :set_lead, only: [:show, :edit, :update, :destroy]

	def index
		@lead = Lead.all
	end

	def new
	end

	def create
		@lead = Lead.new lead_params
		if @lead.save
			redirect_to root_path, notice: "Thanks for the message! One of our guys will reach out to you soon."
			LeadMailer.new_lead(@lead).deliver_now
		else
			redirect_to root_path, alert: "Oops! We weren't able to save your information. Give it another try."
		end
	end

	def destroy
	  @lead.destroy
	  respond_to do |format|
	    format.html { redirect_to leads_url, notice: 'Lead was successfully deleted.' }
	    format.json { head :no_content }
	  end
	end

	private

	def set_lead 
		@lead = Lead.find(params[:id])
	end

	def lead_params
		params.require(:lead).permit(:name, :email, :telephone, :message)
	end
end
