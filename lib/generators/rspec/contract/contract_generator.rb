module Rspec
  module Generators
    ##
    # Rspec contract generator
    ##
    class ContractGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('templates', __dir__)

      def copy_spec_file
        template 'contract_spec.rb', File.join('spec/contracts', class_path, "#{file_name}_contract_spec.rb")
      end
    end
  end
end
