# frozen_string_literal: true
module OwnableBy
  def ownable_by(*resources, from:)
    resources.map(&:to_sym).each do |resource|
      method_name = :"set_#{resource}"

      class_eval <<~RUBY, __FILE__, __LINE__ + 1

      define_method method_name do
        from_class = send(from)

        if from_class.respond_to?(resource)
          resource_object = from_class.send(resource)
          self.send("#{resource}=", resource_object)
        end
      end

      before_validation method_name
      RUBY
    end
  end
end

ActiveRecord::Base.extend OwnableBy
