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

  def words
    @bag.keys
  end

  def length
    @bag.length
  end

  def add_word(word)
    if @bag.has_key?(word)
      @bag[word] += 1
    else
      @bag[word] = 1
    end
  end
end
