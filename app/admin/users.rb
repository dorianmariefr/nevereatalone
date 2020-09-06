ActiveAdmin.register User do
  controller do
    def permitted_params
      params.permit!
    end
  end

  member_action :sign_in_as, method: :post do
    session[:user_id] = resource.id
    redirect_to root_path
  end

  action_item :sign_in_as, only: :show do
    link_to "Sign in as", sign_in_as_admin_user_path(user), method: :post
  end
end
