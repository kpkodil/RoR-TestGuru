module Badges
  
  class AllCategoriesRuleSpecification < AbstractRuleSpecification
    def satisfies?
      category_id = @value

      tests_by_category = []
      Test.find_each do |test|
        tests_by_category << test if test.category_id == category_id
      end

      complited_user_tests = []
      @test_passage.user.test_passages.complited_successfully.each do |tp|
        complited_user_tests << tp.test
      end

      (complited_user_tests & tests_by_category) == tests_by_category
    end
  end
end 
