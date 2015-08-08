class BagOfWords
  getter bag

  def initialize(bag)
    @bag = bag || {} of String => Int32
  end

  def word_count
    count = 0
    @bag.values.each {|x| count += x}
    count
  end

  def +(other)
    new_bag = @bag.merge(other.bag) do |key, old_val, new_val|
      old_val + new_val
    end
    BagOfWords.new(new_bag)
  end

  def add_word(word)
  end
end

x = BagOfWords.new({"yea" => 1})
y = BagOfWords.new({"yea" => 2, "nope" => 4})

pp x
pp y

z = x + y

pp z
puts z.word_count


