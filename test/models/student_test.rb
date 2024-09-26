require "test_helper"

class StudentTest < ActiveSupport::TestCase
  def setup
    @student = Student.new(
      first_name: "Joe",
      last_name: "Bro",
      school_email: "jbro@msudenver.edu",
      major: "Computer Science",
      graduation_date: "2024-05-15"
    )
  end

  test "valid student" do
    assert @student.valid?
  end

  test "first name is required" do
    @student.first_name = nil
    assert_not @student.valid?
  end

  test "last name is required" do
    @student.last_name = nil
    assert_not @student.valid?
  end

  test "school email is required" do
    @student.school_email = nil
    assert_not @student.valid?
  end

  test "major is required" do
    @student.major = nil
    assert_not @student.valid?
  end

  test "graduation date is required" do
    @student.graduation_date = nil
    assert_not @student.valid?
  end

  test "school email must be unique" do
    duplicate_student = @student.dup
    @student.save
    assert_not duplicate_student.valid?
  end

  test "school email must follow MSU email format" do
    @student.school_email = "invalid_email_format"
    assert_not @student.valid?
  end
end
