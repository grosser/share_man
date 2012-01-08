module ApplicationHelper
  def bootstrap_will_paginate(collection, options={})
    will_paginate(collection, options.merge(:renderer => WillPaginate::ActionView::BootstrapLinkRenderer))
  end

  def nbsp(count=1)
    ("&nbsp;" * count).html_safe
  end
end
