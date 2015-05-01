require('rspec')
require('definition')
require('word')
require('pry')

describe(Definition) do
  before() do
    Definition.clear()
  end

  describe("#word_class") do
    it("returns the class of word") do
      test_definition = Definition.new("noun", "Cacti", "a succulent plant with typically sharp scales or spines")
      test_definition.save()
      expect(test_definition.word_class()).to(eq("noun"))
    end
  end

  describe("#save") do
    it("adds a definition to the array of saved definitions") do
      test_definition = Definition.new("noun", "Cacti", "a succulent plant with typically sharp scales or spines")
      test_definition.save()
      expect(Definition.all()).to(eq([test_definition]))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Definition.all()).to(eq([]))
    end
  end



end
