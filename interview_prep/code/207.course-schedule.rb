# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Boolean}
def can_finish(num_courses, prerequisites)
  return true if prerequisites.empty?

  prereq_map = prerequisites.each_with_object(Hash.new { [] }) do |prereq, acc|
    acc[prereq.first] += [prereq.last]
  end

  courses_left = num_courses
  num_courses.times do |course|
    prereq = prereq_map[course]
    loop do
      if prereq.last.nil?
        courses_left -= 1
        break
      elsif prereq.include?(course)
        break
      else
        # Left off here, need to check the new prereq is not already in prereqs
        num = prereq_map[prereq.last]
        if !(prereq & num).empty?
          break
        elsif num.is_a?(Integer) # Awful
          prereq << num
        else
          prereq << nil
        end
      end
    end
  end

  courses_left <= 0
end

require 'byebug'; byebug;
# puts can_finish(3, [[0,2],[1,2],[2,0]])
# puts can_finish(3, [[1,0],[1,2],[0,1]])
puts can_finish(2, [[1,0],[0,1]])
