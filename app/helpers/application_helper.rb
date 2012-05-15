module ApplicationHelper
  #some help from http://stackoverflow.com/questions/5100023/rails-tab-selection
  #li = ordered list
  #i = icon
  def left_tab_bus_item(name, url)
    li_opts = {}
    li_opts[:class] = 'active' if current_page?(url)
    i_opts = {}
    i_opts[:class] = 'icon-white icon-home'
    #content_tag(:li, (link_to (name, url, content_tag(:i, :class=>'icon-white icon-home'))), :class =>li_opts[:class])
    content_tag :li, li_opts do
      link_to name, url
    end
    
  end
  
end



#content_tag(:div, content_tag(:p, "Hello world!"), :class => "strong")
