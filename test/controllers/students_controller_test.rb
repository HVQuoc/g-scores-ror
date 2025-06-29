require "test_helper"

class StudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get students_index_url
    assert_response :success
  end

  test "should get search" do
    get students_search_url
    assert_response :success
  end

  test "should get report" do
    get students_report_url
    assert_response :success
  end

  test "should get top10" do
    get students_top10_url
    assert_response :success
  end
end
