# frozen_string_literal: true
class PlotResident < ApplicationRecord
  self.table_name = "plots_users"

  belongs_to :plot
  belongs_to :resident, foreign_key: :user_id, class_name: "User"
end
