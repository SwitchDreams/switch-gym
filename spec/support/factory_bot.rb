RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

def nested_attributes_for(*args)
  attributes = attributes_for(*args)
  klass = args.first.to_s.camelize.constantize

  klass.reflect_on_all_associations(:belongs_to).each do |r|
    association = FactoryBot.create(r.class_name.underscore)
    attributes["#{r.name}_id"] = association.id
    attributes["#{r.name}_type"] = association.class.name if r.options[:polymorphic]
  end

  attributes
end
