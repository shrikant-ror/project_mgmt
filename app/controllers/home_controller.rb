class HomeController < ApplicationController
	def index
		if current_user.admin?
			redirect_to admin_path
		else
			redirect_to developer_path
		end
	end

	def admin
	end

	def developer
	end
end
