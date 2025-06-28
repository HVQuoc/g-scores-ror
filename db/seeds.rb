require 'csv'

file_path = Rails.root.join('db/data/diem_thi_thpt_2024.csv')
puts "Seeding students from: #{file_path}"

batch = []
batch_size = 1000
count = 0
failed = 0

begin
  CSV.foreach(file_path, headers: true).with_index(2) do |row, line_number|
    next if row['sbd'].blank?

    batch << {
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
      ma_ngoai_ngu: row['ma_ngoai_ngu'],
      created_at: Time.now,
      updated_at: Time.now
    }

    if batch.size >= batch_size
      Student.upsert_all(batch, unique_by: :sbd)
      count += batch.size
      batch = []
    end
  rescue => e
    puts "Line #{line_number} failed: #{e.message}"
    failed += 1
  end

  Student.upsert_all(batch, unique_by: :sbd) unless batch.empty?
  count += batch.size

  puts "Done! Seeded #{count} student records"
  puts "Failed lines: #{failed}" if failed > 0

rescue => e
  puts "Critical error during seeding: #{e.message}"
end