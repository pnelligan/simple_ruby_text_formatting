module TextHelper
  
  def format_text_as_html text, html
    text_formatted = simple_format(text)
    text_auto_linked = auto_link(text_formatted, html)
    make_targets_blank(text_auto_linked)
  end

  protected

  def make_targets_blank html
    targets = html.split('<a')
    targets.collect! {|target| 
      if legit = target.split('href=')[1]
        target = legit.split('>')[0]
      else
        target = nil
      end
      target
    }
    targets.compact.flatten.each {|target| 
      html.sub!(target, target+' target="_blank"')
    }
    html.html_safe
  end
  
end
