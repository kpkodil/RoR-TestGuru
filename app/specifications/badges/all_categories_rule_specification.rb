module Badges
  
  class AllCategoriesRuleSpecification < AbstractRuleSpecification

    # Если минимальное количество копий пройденных тестов данной категории больше, чем количество ачивок
    # то выдает ачивку.
    def satisfies?
      minimal_count_of_tests_copies > all_categories_rule_badges_count
    end 

    private

    # Возвращает массив тестов определенной категории, которые прошел юзер 
    # (может содержать копии тестов в зависимости от того, сколько раз юзер прошел данный тест)
    def complited_tests_by_category
     category = @value
      complited_tests_by_category = []
      @test_passage.user.test_passages.complited_successfully.each do |tp|
        complited_tests_by_category.push(tp.test)  if tp.test.category.id == category
      end
      complited_tests_by_category
    end

    # Возравщает список всех тестов с заданной категорией
    def tests_by_category
     category = @value
      tests_by_category = []
      Test.find_each do |test|
        tests_by_category << test if test.category.id == category
      end
      tests_by_category
    end

    # Возвращает количество баджей, соответствующих такому правилу и значению
    def all_categories_rule_badges_count
      all_categories_rule_badges_count = 0
      @test_passage.user.badges.each do |bdg|
        all_categories_rule_badges_count += 1 if ( bdg.rule_type == "finish_tests_by_category" && bdg.rule_value == @value )
      end
      all_categories_rule_badges_count
    end

    # Собирает массив  из количества копий для каждого успешно пройденного теста заданной категории
    # Возвращает минимальное значение копий из собранного массива
    def minimal_count_of_tests_copies
      copies = []
      local_complited_tests_by_category = complited_tests_by_category

      tests_by_category.each do |elem| 
        initial_length = local_complited_tests_by_category.length
        local_complited_tests_by_category.delete(elem)
        copies.push( initial_length - local_complited_tests_by_category.length )
      end
      copies.min
    end
  end
end 
