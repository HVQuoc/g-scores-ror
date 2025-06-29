class StudentsController < ApplicationController
  def index
  end

  def search
    @sbd = params[:sbd]
    @student = Student.find_by(sbd: @sbd)
  end

  def report
    @subjects = Student.column_names - %w[id sbd ma_ngoai_ngu created_at updated_at]
    @data = {}
    @subjects.each do |subject|
      @data[subject] = {
        ">= 8" => Student.where("#{subject} >= ?", 8).count,
        "6 - 8" => Student.where("#{subject} >= ? AND #{subject} < ?", 6, 8).count,
        "4 - 6" => Student.where("#{subject} >= ? AND #{subject} < ?", 4, 6).count,
        "< 4" => Student.where("#{subject} < ?", 4).count
      }
    end
  end

  def top10
    @top_students = Student
      .where.not(toan: nil, vat_li: nil, hoa_hoc: nil)
      .select("students.*, COALESCE(toan, 0) + COALESCE(vat_li, 0) + COALESCE(hoa_hoc, 0) AS total_score")
      .order("total_score DESC")
      .limit(10)
  end
end
