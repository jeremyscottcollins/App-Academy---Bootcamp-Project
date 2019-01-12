class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new { |hash, k| hash[k] = [] }
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
  
  def hire(teacher)
    @teachers << teacher
  end

  def enroll(student)
    if @students.length < @student_capacity    
        @students << student
    end
    @students.include?(student)
  end

  def enrolled?(student)
    @students.include?(student)
  end

  def student_to_teacher_ratio
    (@students.length / @teachers.length).floor
  end

  def add_grade(student, grade)
    if enrolled?(student)
        @grades[student] << grade
    end
    enrolled?(student)
  end

  def num_grades(student)
    return @grades[student].length
  end

  def average_grade(student)
    return nil if !self.enrolled?(student) || num_grades(student) == 0
    @grades[student].sum / self.num_grades(student)
  end
end