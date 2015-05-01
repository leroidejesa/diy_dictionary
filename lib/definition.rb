class Definition
  attr_reader(:word_class, :plural_form, :actual_definition)
  #@@
  define_method(:initialize) do |attributes|
    @word_class = attributes.fetch(:word_class)
    @plural_form = attributes.fetch(:plural_form)
    @actual_definition = attributes.fetch(:actual_definition)
  end

end
