module Rspec
  module Generators
    ##
    # Rspec services generator
    ##
    class ServiceGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('templates', __dir__)

      argument :steps, type: :array, default: [], banner: 'method method'

      def copy_spec_file
        template 'service_spec.rb', File.join('spec/services', class_path, "#{file_name}_service_spec.rb")
      end
    end
  end
end
