
class AbstractRuleSpecification

  def initialize(value:, test_passage:)
    @value = value
    @test_passage = test_passage
  end

  def satisfies?
    raise "#{__method__} is undefined for #{self.class}"
  end
end