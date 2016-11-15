module OwnableByDeveloper
  extend ActiveSupport::Concern

  included do
    before_save :add_developer, if: -> { developer.blank? }

    def add_developer
      if developer.blank? && documentable.respond_to?(:developer)
        self.developer = documentable.developer
      end
    end
  end
end
