##
# Service with dry transaction generator
##
class ServiceGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  argument :steps, type: :array, default: [], banner: 'method method'

  check_class_collision suffix: 'Service'

  def create_service_file
    return if class_name.blank?

    template 'service.rb', File.join('app/services', class_path, "#{file_name}_service.rb")
  end

  hook_for :test_framework do |generator|
    invoke generator, [remove_possible_suffix(name), steps]
  end

  def create_contract_file
    Rails::Generators.invoke 'contract', [class_name]
  end

  private

  def file_name
    @_file_name ||= remove_possible_suffix(super)
  end

  def remove_possible_suffix(name)
    name.sub(/_?service$/i, '')
  end
end
