module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
      direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
      link_to title, params.merge(sort: column, direction: direction, page: nil), {class: css_class}
  end
  def bootstrap_class_for flash_type
    case flash_type
      when :success
       "alert-success"
      when :error
       "alert-error"
      when :alert
       "alert-block"
      when :notice
       "alert-info"
      else
       flash_type.to_s
    end
  end
  def display_base_errors resource
      return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
      messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
      html = <<-HTML
      <div class="alert alert-error alert-block">
       <button type="button" class="close" data-dismiss="alert">&#215;</button>
       #{messages}
      </div>
      HTML
      html.html_safe
  end
  
end
