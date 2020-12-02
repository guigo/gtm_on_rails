module GtmOnRails
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a GTM on Rails initializer to your application."

      def copy_initializer
        template "gtm_on_rails.rb", "config/initializers/gtm_on_rails.rb"
      end

      def insert_javascript_tag
        inject_into_file "app/views/layouts/_overrides.html.erb", after: /<% content_for :head do %>/ do
          "\n    <%= render_gtm_on_rails_tag_in_head %>\n"
        end
        inject_into_file "app/views/layouts/_overrides.html.erb", after: /<% content_for :body do %>/ do
          "\n    <%= render_gtm_on_rails_tag_in_body %>\n"
        end
      end
    end
  end
end
