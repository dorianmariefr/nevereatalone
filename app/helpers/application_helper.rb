module ApplicationHelper
  def title(string)
    content_for(:title, string)
  end

  def fa(name, **options)
    icon("fas", name, **options)
  end

  def user_image_for(user, **options)
    content_tag(:div, class: "relative z-0") do
      if user.image.attached?
        image = image_tag(user.square_image, **options)
      else
        image = image_tag("user.svg", **options)
      end

      if user.vegetarian?
        classes = "absolute bottom-0 left-1/2 "
        classes += "text-green-600 bg-white border-green-600 border "
        classes += "rounded-full transform -translate-x-1/2 "

        if options[:class].to_s.include?("w-32")
          classes += "p-2"
        elsif options[:class].to_s.include?("w-16")
          classes += "text-sm p-1"
        else
          classes += "text-xs p-1"
        end

        safe_join([image, fa("leaf", class: classes)])
      else
        image
      end
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

  def count_for(collection, zero:, one:, other:)
    if collection.empty?
      zero
    elsif collection.size == 1
      one
    else
      "#{collection.size} #{other}"
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
