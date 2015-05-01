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
      test_definition = Definition.new({ :word_class => "noun", :plural_form => "Cacti", :actual_definition => "a succulent plant with typically sharp scales or spines" })
      test_definition.save()
      expect(test_definition.word_class()).to(eq("noun"))
    end
  end

  describe("#plural_form") do
    it("returns the plural form of word") do
      test_definition = Definition.new({ :word_class => "noun", :plural_form => "Cacti", :actual_definition => "a succulent plant with typically sharp scales or spines" })
      test_definition.save()
      expect(test_definition.plural_form()).to(eq("Cacti"))
    end
  end

  describe("#actual_definition") do
    it("returns the definition of word") do
      test_definition = Definition.new({ :word_class => "noun", :plural_form => "Cacti", :actual_definition => "a succulent plant with typically sharp scales or spines" })
      test_definition.save()
      expect(test_definition.actual_definition()).to(eq("a succulent plant with typically sharp scales or spines"))
    end
  end

  describe("#save") do
    it("adds a definition to the array of saved definitions") do
      test_definition = Definition.new({ :word_class => "noun", :plural_form => "Cacti", :actual_definition => "a succulent plant with typically sharp scales or spines" })
      test_definition.save()
      expect(Definition.all()).to(eq([test_definition]))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Definition.all()).to(eq([]))
    end
  end

  describe("#id") do
    it("returns the id of the definition") do
      test_definition = Definition.new({ :word_class => "noun", :plural_form => "Cacti", :actual_definition => "a succulent plant with typically sharp scales or spines" })
      test_definition.save()
      expect(test_definition.id()).to(eq(1))
    end
  end

  describe(".find") do
    it("returns the definition by its ID number") do
      test_definition = Definition.new({ :word_class => "noun", :plural_form => "Cacti", :actual_definition => "a succulent plant with typically sharp scales or spines" })
      test_definition.save()
      test_definition2 = Definition.new({ :word_class => "noun", :plural_form => "Canyons", :actual_definition => "a deep gorge, typically with a river flowing through it" })
      test_definition2.save()
      expect(Definition.find(test_definition2.id())).to(eq(test_definition2))
    end
  end

end
