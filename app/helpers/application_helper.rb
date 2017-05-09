module ApplicationHelper

  def full_title page_title = ""
    base_title = I18n.t "Commerce"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  def get_short_description product
    return product.description.byteslice(0,30)
  end

end
