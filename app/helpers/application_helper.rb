module ApplicationHelper
  def full_title page
    base_title = t("base_title")
    page.empty? ? base_title : (page + " | " + base_title)
  end
end
