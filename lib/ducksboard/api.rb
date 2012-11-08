module Ducksboard
  module API
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def type(subdomain="app", namespace="/api")
        self.base_uri "#{subdomain}.ducksboard.com#{namespace}"
      end
    end

  end
end
