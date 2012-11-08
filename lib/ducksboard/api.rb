module Ducksboard
  module API
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def type(subdomain="app", namespace="/api")
        self.base_uri "https://#{subdomain}.ducksboard.com#{namespace}"
      end
    end

  end
end
