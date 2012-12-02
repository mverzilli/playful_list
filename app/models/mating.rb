class Mating
  def initialize(level)
    @level = level
  end

  def left_column_choices
    @left_column_choices
  end

  def right_column_choices
    @right_column_choices
  end

  def question
    @question
  end

  def answer
    @answer
  end

  class IdenticalObjectsMating < Mating
    def initialize(level)
      super

      groups = Choice.where("'group' IS NOT NULL").map {|choice| choice.group }
      group = groups.shuffle[0]

      choices = Choice.where(:group => group).shuffle.take(3)

      @question = choices.sample
      @answer = @question

      @left_column_choices = choices.shuffle
      @right_column_choices = choices.shuffle
    end
  end

  class NonIdenticalObjectsMating < Mating
    def initialize(level)
      super

      questions = level.questions.shuffle.take 3

      @question = questions.sample.question
      @answer = @question.answer

      @left_column_choices = questions.map { |q| q.question }
      @right_column_choices = questions.map { |q| q.answer }
    end
  end
end


