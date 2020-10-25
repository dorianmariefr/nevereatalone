module MailerHelper
  def link_to_with_token(name, params, options = nil, &block)
    link_to(name, polymorphic_url(params, token: @user.login_token), options)
  end

  def markdown(text)
    CommonMarker.render_html(text, :DEFAULT, [:autolink]).html_safe
  end
end
