module TextHelper
  
  def format_text_as_html text, html
    text_formatted = simple_format(text)
    text_auto_linked = auto_link(text_formatted, html)
    make_targets_blank(text_auto_linked)
  end

  def make_targets_blank html
    targets = html.split('<a')
    targets.each {|target|
      if legit = target.split('href=')[1]
        replaced = legit.split('>')[0]
        unless replaced.match("target")
          html.sub!(replaced, replaced+' target="_blank"')
        end
      end
    }
    html.html_safe
  end
  
end

#usage: format_text_as_html(some_text, :html => { :target => "_blank" })