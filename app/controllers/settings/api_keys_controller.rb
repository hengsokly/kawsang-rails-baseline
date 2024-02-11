module Settings
  class ApiKeysController < ApplicationController
    before_action :authorize_user

    def show
    end

    def update
      if current_user.update(user_params)
        redirect_to settings_api_key_path, notice: "Update the Api Key successfully!"
      else
        render :show
      end
    end

    private
      def user_params
        params.require(:user).permit(:api_key)
      end

      def authorize_user
        authorize current_user, policy_class: Kawsang::UserApiKeyPolicy
      end
  end
end
