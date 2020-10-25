module MailerHelper
  def link_to_with_token(name, params, options = nil, &block)
    link_to(name, polymorphic_url(params, token: @user.login_token), options)
  end
end
