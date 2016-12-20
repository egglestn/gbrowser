# frozen_string_literal: true
module SortingHelper

  def sortable(klass, column)

    title = klass.human_attribute_name(column)

    if params[:sort] == column.to_s
      direction = params[:direction] == "asc" ? "desc" : "asc"
      link_to title, { sort: column, direction: direction }, class: direction
    else
      link_to title, { sort: column, direction: "desc" }, class: "both"
    end
  end

end
