# frozen_string_literal: true

# BEGIN
module Model
  def self.included(base)
    base.extend(ClassMethods)
  end

  class TypeCaster
    def self.execute(value, type)
      cast(value, type)
    end

    private_class_method def self.cast(value, type)
      case type
      when :string then value.to_s
      when :integer then value.to_i
      when :boolean then !!value
      when :datetime then DateTime.parse(value)
      else
        puts 'Oops'
      end
    end
  end

  def initialize(attributes = {})
    attributes.each_key do |attribute|
      has_attribute = self.class.instance_variables.map(&:to_s).include?("@#{attribute}")

      next unless has_attribute

      default_value, target_type = self.class.instance_variable_get("@#{attribute}").values
      value = attributes[attribute.to_sym] || default_value
      if target_type
        instance_variable_set("@#{attribute}", TypeCaster.execute(value, target_type))
      else
        instance_variable_set("@#{attribute}", value)
      end
    end
  end

  def attributes
    instance_variables.each_with_object({}) do |variable, accum|
      variable = variable.to_s.sub('@', '').to_sym
      accum[variable] = instance_variable_get("@#{variable}")
    end
  end

  module ClassMethods
    def attribute(name, options = {})
      define_method("#{name}=") do |value|
        if options[:type].nil?
          instance_variable_set("@#{name}", nil)
        else
          instance_variable_set("@#{name}", TypeCaster.execute(value, options[:type]))
        end
      end

      define_method(name.to_s) do
        instance_variable_get("@#{name}")
      end

      instance_variable_set("@#{name}", { default: options[:default], type: options[:type] })
    end
  end
end
# END
