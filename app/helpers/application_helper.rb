module ApplicationHelper
  def title(string)
    content_for(:title, string)
  end

  def fa(name, **options)
    icon("fas", name, **options)
  end
end
