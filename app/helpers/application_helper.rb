module ApplicationHelper
  def btn_to text, url,options={}, &block
    options[:style] ||= 'default'
    options[:class] ||= ''
    options[:class] += " btn btn-#{options[:style]}"
    link_to text, url, options, &block
  end
  ['default', 'primary', 'danger', 'info', 'success', 'warning'].each do |style|
    define_method "#{style}_btn_to" do |text, url, options={}, &block|
      options[:style] = style
      btn_to text, url, options, &block
    end
  end
end
