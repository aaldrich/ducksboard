module Ducksboard
  module Api
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def type(subdomain="app")
        self.base_uri "#{subdomain}.ducksboard.com/api"
      end
    end

  end
end
