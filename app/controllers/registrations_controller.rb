class RegistrationsController < Devise::RegistrationsController

    private

    def sign_up_params
        params.require(:account).permit(:first_name, :last_name, :username, :birthday, :address, :email, :password, :password_confirmation)
    end

    def acount_update_params
        params.require(:account).permit(:first_name, :last_name, :email, :address, :password, :password_confirmation, :current_password)
    end

end
