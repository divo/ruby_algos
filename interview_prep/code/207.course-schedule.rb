# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Boolean}
def can_finish(num_courses, prerequisites)
  return true if prerequisites.empty?

  prereq_map = prerequisites.each_with_object({}) do |prereq, acc|
    acc[prereq.last] = prereq.first
  end
  courses = prerequisites.flatten.uniq

  courses.map do |course|
    prereq = prereq_map[course]
    loop do
      if prereq.nil?
        num_courses -= 1
        break
      elsif prereq == course
        break
      else
        prereq = prereq_map[prereq]
      end
    end
  end

  num_courses <= 0
end
