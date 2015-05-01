require('rspec')
require('word')
require('definition')
require('pry')

describe(Word) do
  # before() do
  #   Word.clear()
  # end

  describe('#save') do
    it("saves a word to the array of all words") do
      new_word = Word.new("Ruby")
      new_word.save()
      expect(Word.all()).to(eq([new_word]))
    end
  end

end
