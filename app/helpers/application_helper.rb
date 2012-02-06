module ApplicationHelper
  
  def locale_flag(locale)
    content_tag :li, 
        :class => "locale #{'current_locale' if I18n.locale == locale}",
        :style => I18n.locale == locale ? "" : "display:none" do
      link_to image_tag("flags/#{locale}.png"), :locale => locale
    end
  end
  
  def page_title(title)
    content_tag :title do
      title.to_s
    end
  end
  
end
