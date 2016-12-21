# frozen_string_literal: true
class UserLoginContent < ApplicationRecord
  validates :title_left, :title_right, :blurb_para_1, :blurb_para_2, presence: true
end
