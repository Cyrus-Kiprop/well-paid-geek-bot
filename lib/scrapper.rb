require 'nokogiri'
require 'open-uri'
require 'set'

module MemeScrapper
  def scrapper(url_arr)
    rand_idx = rand(0...(url_arr.size))
    url = url_arr[rand_idx]
    doc = Nokogiri::HTML(URI.parse(url).open)
    doc.search('img')
  end

  def extract_img_src(src)
    img_src = []
    src.each do |element|
      img_src << element.attributes['src'].value if element.attributes['src']
    end
    img_src
  end

  def meme_extractor
    url_arr = ['https://twitter.com/sigsegmeme']
    elements = scrapper(url_arr)
    extract_img_src(elements)
  end

  def result?(result)
    return true if result.size.positive?

    false
  end
end
