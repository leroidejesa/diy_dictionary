class Word
  #attr_reader()
  @@dictionary_storage = []

  define_method(:initialize) do |word|
    @word = word
    @id = @@dictionary_storage.length.+(1)
    @definitions_list = []
  end

  define_method(:word) do
    @word
  end

  define_singleton_method(:all) do
    @@dictionary_storage
  end

  define_method(:save) do
    @@dictionary_storage.push(self)
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:clear) do
    @@dictionary_storage = []
  end

  define_singleton_method(:find) do |id|
    found_word = nil
    @@dictionary_storage.each() do |word|
      if word.id().eql?(id.to_i())
        found_word = word
      end
    end
    found_word
  end

  define_method(:definitions_list) do
    @definitions_list
  end

end
