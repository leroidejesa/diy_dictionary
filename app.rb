require('sinatra')
require('sinatra/reloader')
require('./lib/definition')
require('./lib/word')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all()
  erb(:index)
end

get('/words/new') do
  erb(:word_form)
end

post('/words') do
  @the_word = params.fetch('word')
  @word_class = params.fetch('word_class')
  @plural_form = params.fetch('plural_form')
  @actual_definition = params.fetch('actual_definition')
  new_word = Word.new(@the_word)
  new_word.save()
  new_definition = Definition.new({ :word_class => @word_class, :plural_form => @plural_form, :actual_definition => @actual_definition })
  new_definition.save()
  new_word.add_definition(new_definition)
  erb(:success)
end

get('/words/:id') do
  @word = Word.find(params.fetch('id').to_i())
  @the_word = @word.word()
  @definitions_list = @word.definitions_list()
  erb(:words)
end

get('/words/:id/definitions/new') do
  @word = Word.find(params.fetch('id').to_i())
  @the_word = @word.word()
  erb(:word_definitions_form)
end

post('/words_definitions') do
  word_class = params.fetch('word_class')
  plural_form = params.fetch('plural_form')
  actual_definition = params.fetch('actual_definition')
  new_definition = Definition.new({ :word_class => word_class, :plural_form => plural_form, :actual_definition => actual_definition })
  new_definition.save()
  @word = Word.find(params.fetch('word_id').to_i())
  @word.add_definition(new_definition)
  (erb(:success))
end
