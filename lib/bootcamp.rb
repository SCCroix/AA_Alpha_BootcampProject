class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @students = []
    @teachers = []
    @grades = Hash.new { |hash, student| hash[student] = [] }
  end

  def name
    @name
  end

  def slogan
    @slogan
  end

  def teachers
    @teachers
  end

  def students
    @students
  end

  def hire(name)
    @teachers << name
  end

  def enroll(name)
    if @students.length < @student_capacity
      @students << name
      return true
    else
      return false
    end
  end

  def enrolled?(name)
    @students.include?(name)
  end

  def student_to_teacher_ratio
    @students.length / @teachers.length
  end

  def add_grade(name, grade)
    if @students.include?(name)
      @grades[name] << grade
      return true
    else
      return false
    end
  end

  def num_grades(name)
    @grades[name].length
  end

  def average_grade(name)
    if @grades[name].length > 0
      @grades[name].reduce(&:+) / num_grades(name)
    else
      return nil
    end
  end
end
