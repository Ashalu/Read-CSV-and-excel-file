class UsersController < ApplicationController
  def index
  	
  end

  def import
  	unless params[:file].blank?    
      if ['xlsx', 'csv'].include? (params[:file].original_filename.split('.').second.strip)
      	@h = User.read_excel params[:file]
        p "---------------------------"
        p @h
      		# redirect_to import_users_path, flash: {success: "Withdraw request has been sent successfully"}
      	# else
      	# 	redirect_to upload_excel_wallets_path, flash: {error: "Something went wrong. Please try again."}
      	# end
      else 
      	redirect_to upload_excel_wallets_path, :flash => {:error => "File must have .xlsx or .xls extension"}
      end
    end
	end

	def show
	end




  # 	if ['xlsx', 'xls'].include? 
  # 	User.read_excel(params[:file])
  # 	redirect_to root_url, notice: "Actively data imported!"
  # end
end
