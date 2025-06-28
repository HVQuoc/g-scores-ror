require 'csv'

CSV.foreach(Rails.root.join('db/data/diem_thi_thpt_2024.csv'), headers: true) do |row|
  Student.create!(
    sbd: row['sbd'],
    toan: row['toan'],
    ngu_van: row['ngu_van'],
    ngoai_ngu: row['ngoai_ngu'],
    vat_li: row['vat_li'],
    hoa_hoc: row['hoa_hoc'],
    sinh_hoc: row['sinh_hoc'],
    lich_su: row['lich_su'],
    dia_li: row['dia_li'],
    gdcd: row['gdcd'],
    ma_ngoai_ngu: row['ma_ngoai_ngu']
  )
end
