module Badges
  
  class AllLevelsRuleSpecification < AbstractRuleSpecification

    # Если минимальное количество копий пройденных тестов данного уровня больше, чем количество ачивок
    # то выдает ачивку.
    def satisfies?
      minimal_count_of_tests_copies > all_levels_rule_badges_count
    end 

    private

    # Возвращает массив тестов определенного уровня, которые прошел юзер 
    # (может содержать копии тестов в зависимости от того, сколько раз юзер прошел данный тест)
    def complited_tests_by_level
      level = @value
      complited_tests_by_level = []
      @test_passage.user.test_passages.complited_successfully.each do |tp|
        complited_tests_by_level.push(tp.test)  if tp.test.level == level
      end
      complited_tests_by_level
    end


    # Возравщает список всех тестов с заданым уровнем
    def tests_by_level
      level = @value
      tests_by_level = []
      Test.find_each do |test|
        tests_by_level << test if test.level == level
      end
      tests_by_level
    end

    # Возвращает количество баджей, соответствующих такому правилу и значению
    def all_levels_rule_badges_count
      all_levels_rule_badges_count = 0
      @test_passage.user.badges.each do |bdg|
        all_levels_rule_badges_count += 1 if ( bdg.rule_type == "finish_tests_by_level" && bdg.rule_value == @value )
      end
      all_levels_rule_badges_count
    end

    # Собирает массив количества копий для каждого успешно пройденного теста заданного уровня
    # Возвращает минимальное значение копий из собранного массива
    def minimal_count_of_tests_copies
      copies = []
      local_complited_tests_by_level = complited_tests_by_level

      tests_by_level.each do |elem| 
        initial_length = local_complited_tests_by_level.length
        local_complited_tests_by_level.delete(elem)
        copies.push( initial_length - local_complited_tests_by_level.length )
      end
      copies.min
    end
  end
end

