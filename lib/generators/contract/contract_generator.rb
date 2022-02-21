##
# Validation Contract generator
##
class ContractGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  def create_contact_file
    template 'contract.rb', File.join('app/contracts', class_path, "#{file_name}_contract.rb")
  end

  hook_for :test_framework

  private

  def file_name
    @_file_name ||= remove_possible_suffix(super)
  end

  def remove_possible_suffix(name)
    name.sub(/_?service$/i, '')
  end
end
