module ApplicationHelper
  def title(string)
    content_for(:title, string)
  end

  def fa(name, **options)
    icon("fas", name, **options)
  end

  def user_image_for(user, **options)
    if user.image.attached?
      image_tag(user.image, **options)
    else
      image_tag("user.svg", **options)
    end
  end

  def render_or_none(collection, none: "Aucun", **options)
    if collection.any?
      render(collection)
    else
      options[:class] ||= ""
      options[:class] = "#{options[:class]} mb-4".strip
      content_tag(:p, none, **options)
    end
  end

  def link_and_count_for(object, collection, one:, other:, **options)
    if collection.any?
      if collection.size == 1
        text = one
      else
        text = "#{collection.size} #{other}"
      end

      content_tag(:p, link_to(text, object), **options)
    end
  end

  def yes_no(field, f:)
    safe_join([
      f.radio_button(field, true),
      " ",
      f.label(field, "Oui", value: true),
      " ",
      f.radio_button(field, false),
      " ",
      f.label(field, "Non", value: false)
    ])
  end
end
