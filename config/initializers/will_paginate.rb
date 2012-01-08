# https://gist.github.com/1214011#comments
require 'will_paginate/view_helpers/link_renderer'
require 'will_paginate/view_helpers/action_view'

class WillPaginate::ActionView::BootstrapLinkRenderer < WillPaginate::ActionView::LinkRenderer
protected
  def html_container(html)
    tag :div, tag(:ul, html), container_attributes
  end

  def gap
    tag :li, link(super, '#'), :class => 'disabled'
  end

  def page_number(page)
    tag :li, link(page, page, :rel => rel_value(page)), :class => ('active' if page == current_page)
  end

  def previous_or_next_page(page, text, classname)
    tag :li, link(text, page || '#'), :class => [classname[0..3], classname, ('disabled' unless page)].join(' ')
  end
end
