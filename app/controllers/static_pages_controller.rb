class StaticPagesController < ApplicationController
  require 'csv'
  require 'mechanize'

  def top
  end

  def scraping
    agent = Mechanize.new
    page = agent.get("https://camp-fire.jp/")
    elements = page.search('.popular .box-title a')
    urls = []

    # aタグをすべて抽出し詳細ページのURLを抽出
    elements.each do |ele|
      urls << ele.get_attribute(:href)
    end

    data = []
    # 抽出した詳細ページURLにアクセスし、データ取得
    urls.each do |url|
      page = agent.get(url)
      p "タイトル: #{page.at('.project-name').inner_text}"
      data << [
        page.at('.project-name').inner_text,
        page.at('.total .number').inner_text,
        page.at('.meter span').inner_text,
        page.at('.patron .number').inner_text,
        page.at('.rest .number').inner_text
      ]
      sleep 2
      title = page.at('.project-name').inner_text,
      total = page.at('.total .number').inner_text,
      rate = page.at('.meter span').inner_text,
      patron = page.at('.patron .number').inner_text,
      rest = page.at('.rest .number').inner_text
      scraping = Scraping.create!(title: title, price: total, rate: rate, rest: patron, number: rest)
    end
    @data = data
    # 取得したデータをCSVに展開
    bom = %w[EF BB BF].map { |e| e.hex.chr }.join
    csv_file = CSV.generate(bom) do |csv|
      data.each do |datum|
        csv << datum
      end
    end

    File.open('./scraped.csv','w', force_quotes: true) do |file|
      file.write(csv_file.force_encoding('UTF-8'))
    end
    render :top
  end
end
