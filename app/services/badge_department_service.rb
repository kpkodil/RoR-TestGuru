
class BadgeDepartmentService
  RULES = {
    finish_tests_by_category: Badges::AllCategoriesRuleSpecification,
    finish_test_first_time: Badges::TestFirstTimeRuleSpecification,
    finish_tests_by_level: Badges::AllLevelsRuleSpecification
  }.freeze

  def initialize(test_passage:)
    @test_passage = test_passage
  end

  def call
    Badge.find_each do |badge|
      rule = RULES[badge.rule_type.to_sym].new(value: badge.rule_value, test_passage: @test_passage)
      add_badges(badge) if rule.satisfies?
    end
  end

  private

  def add_badges(badge)
    @test_passage.user.badges << badge
  end
end
