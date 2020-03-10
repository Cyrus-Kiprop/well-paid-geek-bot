require 'nokogiri'
require 'open-uri'
require 'set'

module MemeScrapper
  def scrapper(url_arr)
    rand_idx = rand(0...(url_arr.size))
    url = url_arr[rand_idx]
    doc = Nokogiri::HTML(open(url))
    src = doc.search('img')
  end

  def extract_img_src(src)
    img_src = []
    src.each do |element|
      if element.attributes["src"]
        img_src << element.attributes["src"].value
      end
    end
    img_src
  end

  def meme_extractor
    url_arr = ['https://twitter.com/sigsegmeme']
    elements = scrapper(url_arr)
    result = extract_img_src(elements)
  end

  def result?(result)
    return true if result.size.positive?

    false
  end
end
