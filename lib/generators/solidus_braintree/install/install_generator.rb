module SolidusBraintree
  module Generators
    class InstallGenerator < Rails::Generators::Base
      class_option :auto_run_migrations, type: :boolean, default: false

      def add_javascripts
        # append_file "vendor/assets/javascripts/spree/frontend/all.js", "//= require spree/frontend/braintree/solidus_braintree\n"
        # append_file "vendor/assets/javascripts/spree/backend/all.js", "//= require spree/backend/braintree/solidus_braintree\n"
      end

      def add_stylesheets
        # inject_into_file "vendor/assets/stylesheets/spree/frontend/all.css", " *= require spree/frontend/solidus_braintree\n", before: '*/', verbose: true
      end

      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=solidus_braintree'
      end

      def run_migrations
         if running_migrations?
           run 'bundle exec rake db:migrate'
         else
           puts "Skiping rake db:migrate, don't forget to run it!"
         end
      end

      private

      def running_migrations?
         options.auto_run_migrations? || begin
           response = ask 'Would you like to run the migrations now? [Y/n]'
           ['', 'y'].include? response.downcase
         end
      end
    end
  end
end
