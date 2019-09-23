class Scraping
  def self.get_articles
    agent = Mechanize.new
    current_page = agent.get('https://www.soccer-king.jp/news/japan/national')

    # link・title・imageを配列で取得
    urls   = current_page.search('.news-category-list__vertical a')
    titles = current_page.search('.news-category-list__vertical__title')
    images = current_page.search('.news-category-list__vertical__img img')

    # 一つずつ取り出して保存
    urls.zip(titles, images) do |url, title, image|
      url   = url.get_attribute('href')
      title = title.inner_text
      image = image.get_attribute('src')
      
      article       = Article.where(title: title).first_or_initialize
      article.url   = url
      article.image = image
      article.save
    end
  end
end