require 'csv'
require './lib/joke'

class User

  attr_reader :name,
              :jokes

  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
    jokes << joke
  end

  def tell(user, joke)
    user.learn(joke)
  end

  def perform_routine_for(user)
      jokes.each do |joke|
        user.learn(joke)
      end
  end

  def learn_routine(file)
    data = CSV.open file, headers: true, header_converters: :symbol
    data.each do |joke|
      jokes << Joke.new(joke)
    end
  end

end

=begin
joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
print User.new("Sal").learn(joke)
=end
