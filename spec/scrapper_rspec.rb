require_relative '../lib/scrapper.rb'
require 'spec_helper'

class TestClass
  include MemeScrapper
end

RSpec.describe MemeScrapper do
  let (:url_arr) { ['https://twitter.com/sigsegmeme'] }
  let (:t_class) { TestClass.new }
  let (:url) { 'https://hackernoon.com/tagged/ruby/feed' }

  describe '#scrapper' do
    it 'returns an array of containing all the images of the scrapped website' do
      expect(t_class.scrapper(url_arr).class).to eql(Nokogiri::XML::NodeSet)
    end
  end

  describe '#extract_img_src' do
    it 'Takes in a nodeset and returns array of links' do
      expect(t_class.extract_img_src(t_class.scrapper(url_arr)).class).to eql(Array)
    end
  end

  describe '#meme_extractor' do
    it 'returns array of links' do
      expect(t_class.meme_extractor.class).to eql(Array)
    end
  end

  describe '#result?' do
    it 'Return a true value if the result arr not empty' do
      expect(t_class.result?(t_class.meme_extractor)).to be true
    end
    
    it 'Should return false if the array is empty' do
      expect(t_class.result?([])).to be false
    end
  end

end
