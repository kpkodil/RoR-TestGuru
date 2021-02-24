module Badges
  
  class TestFirstTimeRuleSpecification < AbstractRuleSpecification
    def satisfies?
      test_id = @value
      required_test = Test.find(test_id)
      copies_of_required_test = []

      @test_passage.user.test_passages.each do |tp|
        copies_of_required_test << tp.test if tp.test == required_test
      end

      @test_passage.successful if copies_of_required_test.count == 1
    end
  end
end
