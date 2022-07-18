class Scraping < ApplicationRecord
  # require 'csv'
  # require 'mechanize'

  # def scraping
  #   agent = Mechanize.new
  #   page = agent.get("https://www.makuake.com/")
  #   elements = page.search('.project-item a')
  #   urls = []

  #   # aタグをすべて抽出し詳細ページのURLを抽出
  #   elements.each do |ele|
  #     urls << ele.get_attribute(:href)
  #   end

  #   data = []
  #   # 抽出した詳細ページURLにアクセスし、データ取得
  #   urls.each do |url|
  #     page = agent.get(url)
  #     p "ISBN: #{page.at('.isbn').inner_text}"
  #     data << [
  #       page.at('.title').inner_text,
  #       page.at('.author').inner_text,
  #       page.at('.price').inner_text,
  #       page.at('.sales_date').inner_text,
  #       "'" + page.at('.isbn').inner_text,
  #       page.at('.publisher_name').inner_text
  #     ]
  #     sleep 1000
  #   end
  # end

  # def dep_csv
  #   # 取得したデータをCSVに展開
  #   bom = %w[EF BB BF].map { |e| e.hex.chr }.join
  #   csv_file = CSV.generate(bom) do |csv|
  #     data.each do |datum|
  #       csv << datum
  #     end
  #   end

  #   File.open('./scraped.csv','w', force_quotes: true) do |file|
  #     file.write(csv_file.force_encoding('UTF-8'))
  #   end
  # end
end
