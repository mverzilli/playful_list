class Sequence
  def initialize(level)
    number_of_elements = level.order + 1

    @level = level

    choices = Choice.all.shuffle.take number_of_elements

    @elements = choices.map {|q| q.image }
    @series = @elements.shuffle
  end

  def series
    @series
  end

  def goal
    goal_hash = []

    @series.each do |e|
      goal_hash.push({ :key => element_key(e), :visible => true })
    end

    goal_hash.push({ :key => element_key(@series.first), :visible => true })

    @series[1..-1].each do |e|
      goal_hash.push({ :key => element_key(e), :visible => false})
    end

    @series.each do |e|
      goal_hash.push({ :key => element_key(e), :visible => false})
    end

    goal_hash
  end

  def elements
    elements_hash = {}
    key = "a"

    @elements.each do |e|
      elements_hash[key] = "/assets/#{e}"
      key = key.next
    end

    elements_hash
  end

  def element_key(element)
    elements.select{|key, value| value == "/assets/#{element}" }.keys[0]
  end
end

