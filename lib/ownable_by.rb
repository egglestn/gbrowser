# frozen_string_literal: true
module OwnableBy
  def ownable_by(*resources, from:)
    parent_association = from.to_sym

    resources.map(&:to_sym).each do |resource|
      class_eval <<~RUBY, __FILE__, __LINE__ + 1

      define_method :"set_#{resource}" do
        parent_object = public_send(parent_association)

        if parent_object.respond_to?(resource)
          resource_object = parent_object.send(resource)
          self.send("#{resource}=", resource_object)
        end
      end

      before_validation :"set_#{resource}"
      RUBY
    end
  end
end

ActiveRecord::Base.extend OwnableBy
