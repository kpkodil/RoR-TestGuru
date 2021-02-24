module Badges
  
  class AllLevelsRuleSpecification < AbstractRuleSpecification
    def satisfies?
      level = @value

      tests_by_level = []
      Test.find_each do |test|
        tests_by_level << test if test.level == level
      end

      complited_user_tests = []
      @test_passage.user.test_passages.complited_successfully.each do |tp|
        complited_user_tests << tp.test
      end

      (complited_user_tests & tests_by_level) == tests_by_level
    end
  end
end

