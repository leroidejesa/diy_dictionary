class Word
  # attr_reader()
  @@dictionary_storage = []

  define_method(:initialize) do |word|
    @word = word
    #@id = @@dictionary_storage.length.+(1)
  end

  define_singleton_method(:all) do
    @@dictionary_storage
  end

  define_method(:save) do
    @@dictionary_storage.push(self)
  end

end
