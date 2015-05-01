require('rspec')
require('word')
require('definition')
require('pry')

describe(Word) do
  before() do
    Word.clear()
  end

  describe('#word') do
    it("returns the word") do
      test_word = Word.new("Ruby")
      expect(test_word.word()).to(eq("Ruby"))
    end
  end

  describe('.all') do
    it("is empty at first") do
      expect(Word.all()).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a word to the array of all words") do
      new_word = Word.new("Ruby")
      new_word.save()
      expect(Word.all()).to(eq([new_word]))
    end
  end

  describe('#id') do
    it("returns the id of the word") do
      test_word = Word.new("Ruby")
      expect(test_word.id()).to(eq(1))
    end
  end

  describe('.find') do
    it("returns a word by its id number") do
      test_word = Word.new("Ruby")
      test_word.save()
      test_word2 = Word.new("Rails")
      test_word2.save()
      expect(Word.find(test_word2.id())).to(eq(test_word2))
    end
  end

  describe('#definitions_list') do
    it("initially returns an empty array of the word's definitions") do
      test_word = Word.new("Ruby")
      expect(test_word.definitions_list()).to(eq([]))
    end
  end

  describe('#add_definition') do
    it("adds a new definition to the word") do
      test_word = Word.new("House")
      test_definition = Definition.new("noun", "Houses", "a dwelling constructed by and for humans")
      test_word.add_definition(test_definition)
      expect(test_word.definitions_list()).to(eq([test_definition]))
    end
  end

end
