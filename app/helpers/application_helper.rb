module ApplicationHelper
  def bootstrap_will_paginate(collection, options={})
    will_paginate(collection, options.merge(:renderer => WillPaginate::ActionView::BootstrapLinkRenderer))
  end

  def nbsp(count=1)
    ("&nbsp;" * count).html_safe
  end

  def form_input_row(f, field, &block)
    text = f.text_field field unless block_given?
    error = 'error' if f.object.errors[field].present?
    input_row(f.label(field), :text => text, :class => error, &block)
  end

  def input_row(label, options={}, &block)
    input = if block_given?
      capture(&block)
    else
      options[:text]
    end

    <<-HTML.html_safe
    <div class="clearfix #{options[:class]}">
      #{label}
      <div class="input">#{ input }</div>
    </div>
    HTML
  end

  def form_button(f)
    f.submit (f.object.new_record? ? 'Create' : 'Save'), :class => 'btn primary'
  end
end
