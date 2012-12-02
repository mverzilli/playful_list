class Sequence
  def initialize(level)
    number_of_elements = level.order + 1

    @level = level

    choices = Choice.all.shuffle.take number_of_elements

    @elements = choices.map {|q| q.question }
    @series = @elements.shuffle
  end

  def series
    @series
  end

  def elements
    @elements
  end
end

