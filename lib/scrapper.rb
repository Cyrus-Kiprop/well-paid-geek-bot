require 'nokogiri'
require 'open-uri'

module MemeScrapper

    def scrapper(url_arr)
        rand_idx = rand(0...(url_arr.size))
        url = url_arr[rand_idx]
        doc = Nokogiri::HTML(open(url))
        src  = doc.search('img')
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
end




