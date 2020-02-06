module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :validates

    def validate(name, *args)
      @validates ||= []
      @validates << { name => args }
    end
  end

  module InstanceMethods
    def validate!
      self.class.validates.each do |x|
        x.each do |key, args|
          value = instance_variable_get("@#{key}")
          send "validate_#{args.first}", value, *args[1]
        end
      end
    end

    def valid?
      validate!
      true
    rescue RuntimeError
      false
    end

    private

    def validate_present(value)
      raise 'Значение пустое' if value.nil? || value.empty?
    end

    def validate_type(value, type)
      raise 'Неверный тип данных' unless value.is_a?(type)
    end

    def validate_format(value, format)
      raise 'Неверный формат' if value !~ format
    end
  end
end
