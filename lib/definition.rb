class Definition
  attr_reader(:word_class, :plural_form, :actual_definition, :id)
  @@definitions = []

  define_method(:initialize) do |attributes|
    @word_class = attributes.fetch(:word_class)
    @plural_form = attributes.fetch(:plural_form)
    @actual_definition = attributes.fetch(:actual_definition)
    @id = @@definitions.length().+(1)
  end

  define_method(:save) do
    @@definitions.push(self)
  end

  define_singleton_method(:all) do
    @@definitions
  end

  define_singleton_method(:clear) do
    @@definitions = []
  end

  define_singleton_method(:find) do |id|
    found_definition = nil
    @@definitions.each() do |definition|
      if definition.id().eql?(id.to_i())
        found_definition = definition
      end
    end
    found_definition
  end

end
