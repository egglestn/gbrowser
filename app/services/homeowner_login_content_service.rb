# frozen_string_literal: true
module HomeownerLoginContentService
  module_function

  def call(model = HomeownerLoginContent)
    if model.none?
      model.new(default_content)
    else
      model.order("RANDOM()").first
    end
  end

  private

  module_function

  def default_content
    {
      title_left: default_text("title_left"),
      title_right: default_text("title_right"),
      blurb_para_1: default_text("blurb_para_1"),
      blurb_para_2: default_text("blurb_para_2")
    }
  end

  def default_text(key)
    I18n.t(key, scope: "services.homeowner_login_content_service.defaults")
  end
end
