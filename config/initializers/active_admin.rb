ActiveAdmin.setup do |config|
  config.site_title = "dorianmarie.fr"
  config.site_title_link = "/"
  config.authentication_method = :authenticate_admin_user!
  config.authorization_adapter = ActiveAdmin::CanCanAdapter
  config.cancan_ability_class = "Ability"
  config.on_unauthorized_access = :access_denied
  config.current_user_method = :current_admin_user
  config.logout_link_path = :session_path
  config.logout_link_method = :delete
  config.root_to = "dashboard#index"
  config.batch_actions = true
  config.filter_attributes = [
    :encrypted_password, :password, :password_digest, :password_confirmation
  ]

  config.localize_format = :long
end

ActiveSupport.on_load(:active_admin) do
  ActiveAdmin::ResourceController.class_eval do
    def find_resource
      if resource_class.is_a?(FriendlyId)
        scoped_collection.friendly.find(params[:id])
      else
        scoped_collection.find(params[:id])
      end
    end
  end
end
