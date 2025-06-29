module StudentsHelper
  def subject_label(code)
    {
      "toan" => "Toán",
      "vat_li" => "Vật lý",
      "hoa_hoc" => "Hóa học",
      "ngu_van" => "Ngữ văn",
      "ngoai_ngu" => "Ngoại ngữ",
      "sinh_hoc" => "Sinh học",
      "lich_su" => "Lịch sử",
      "dia_li" => "Địa lý",
      "gdcd" => "GDCD",
      "ma_ngoai_ngu" => "Mã NN"
    }[code] || code.titleize
  end
end
