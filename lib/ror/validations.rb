module Ror
  class Validations

    def initialize klasses, klass_variation
      @klasses = klasses
      @klass_variation = klass_variation
      @klass_assigned = false
    end

    def modus_valid?
      @klasses
    end

    def klass_param_valid?
      @klasses.include? @klass_variation
    end

    def klass_valid?
      klass_param_valid? or @klass_assigned
    end

    def mark_klass_assigned
      @klass_assigned = true
    end

    def valid?
      modus_valid? and (@klass_assigned or klass_param_valid?)
    end
  end
end
