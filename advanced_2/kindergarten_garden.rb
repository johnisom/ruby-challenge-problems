# frozen_string_literal: true

# garden class
class Garden
  PLANTS = { 'C' => :clover, 'G' => :grass,
             'R' => :radishes, 'V' => :violets }.freeze
  DEFAULT_STUDENTS = %w[Alice Bob Charlie David Eve Fred Ginny
                        Harriet Ileana Joseph Kincaid Larry].freeze

  def initialize(plant_str, students = DEFAULT_STUDENTS)
    @plants = plant_str.split.map do |row|
      row.chars.map { |chr| PLANTS[chr] }
    end
    students.map(&:downcase).sort.each_with_index do |student, idx|
      define_singleton_method(student) { plants_from(idx * 2) }
    end
  end

  private

  def plants_from(start)
    @plants[0][start, 2] + @plants[1][start, 2]
  end
end
