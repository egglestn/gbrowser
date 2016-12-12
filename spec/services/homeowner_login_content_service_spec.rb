# frozen_string_literal: true
require "rails_helper"

RSpec.describe HomeownerLoginContentService do
  context "no content is in db" do
    it "returns default content" do
      scope = "services.homeowner_login_content_service.defaults"

      result = described_class.call

      expect(result.title_left).to eq(I18n.t("title_left", scope: scope))
      expect(result.title_right).to eq(I18n.t("title_right", scope: scope))
      expect(result.blurb_para_1).to eq(I18n.t("blurb_para_1", scope: scope))
      expect(result.blurb_para_2).to eq(I18n.t("blurb_para_2", scope: scope))
      expect(result.background_image).to be_blank
    end
  end

  context "content has been added to the db" do
    it "returns content from the model" do
      content = create :homeowner_login_content

      result = described_class.call

      expect(result.title_left).to eq(content.title_left)
      expect(result.title_right).to eq(content.title_right)
      expect(result.blurb_para_1).to eq(content.blurb_para_1)
      expect(result.blurb_para_2).to eq(content.blurb_para_2)
      expect(result.background_image).to eq(content.background_image)
    end

    it "returns content randomly" do
      create :homeowner_login_content

      allow(HomeownerLoginContent).to receive(:order).and_call_original
      described_class.call

      expect(HomeownerLoginContent).to have_received(:order).with("RANDOM()")
    end
  end
end
