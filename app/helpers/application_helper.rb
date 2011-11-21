module ApplicationHelper
  def provider_to(name)
    link_to image_tag("providers/" + name + "_64.png", :alt => t('login.' + name)), "#", :onclick => "login('/auth/" + name + "')"
  end
  
  def s(path, params=nil)
    send(default_locale.to_s + '_' + path, params)
  end
  
  def simple_format(text, html_options={}, options={})
    text = '' if text.nil?
    start_tag = tag('span', html_options, true)
    text = sanitize(text) unless options[:sanitize] == false
    text = text.to_str
    text.gsub!(/\n\n+/, "<br /><br />")
    text.html_safe
  end
  
  def any_flash?
    (!flash[:notice].nil? || !flash[:error].nil?)
  end
  
  def _(record, field)
    logger.info 'games.' + record.translate + '.' + field
    simple_format(t('games.' + record.translate + '.' + field))
  end
end
