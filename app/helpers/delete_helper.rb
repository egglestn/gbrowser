# frozen_string_literal: true
module DeleteHelper
  def data_to_delete(resource)
    {
      data: {
        id: resource.id,
        url: url_for(resource),
        name: resource.to_s,
        cancel: t("views.cancel"),
        confirm: t("views.destroy"),
        title: t("views.confirm_title"),
        text: t("views.confirm_text", type: resource.class.model_name.human)
      }
    }
  end
end
