# frozen_string_literal: true
class PhasesUnitType < ApplicationRecord
  belongs_to :phase
  belongs_to :unit_type
end
