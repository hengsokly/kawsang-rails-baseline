module ApplicationHelper
  def css_class_name
    "#{controller_path.parameterize}-#{action_name}"
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : "sortable"
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, { sort: column, direction: }, { class: css_class }
  end

  def timeago(date, type = "date")
    return "" unless date.present?

    dis_date = type == "date" ? display_date(date) : display_datetime(date)
    str = "<span class='timeago' data-date='#{dis_date}'>"
    str += time_ago_in_words(date)
    str += "</span>"
    str
  end

  def display_date(date)
    return "" unless date.present?

    I18n.l(date, format: :yyyy_mm_dd)
  end

  def display_datetime(date)
    return "" unless date.present?

    I18n.l(date, format: :yyyy_mm_dd_time)
  end

  def css_active_class(controller_name)
    "active" if request.path.split("/")[1] == controller_name
  end

  def system_locales
    [
      { code: "km", label: I18n.t("user.locale_km"), image: "khmer.png" },
      { code: "en", label: I18n.t("user.locale_en"), image: "english.png" }
    ]
  end
end
