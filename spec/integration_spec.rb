require 'diary_entry'
require 'diary'

RSpec.describe DiaryEntry do
  describe '#reading_chunk' do
    it 'returns first chunk' do
      my_entry = DiaryEntry.new('monday', 'one space two space three space four space five space')
      expect(my_entry.reading_chunk(2, 2)).to eq 'one space two space'
    end

    it 'returns second chunk' do
      my_entry = DiaryEntry.new('monday', 'one space two space three space four space five space')
      my_entry.reading_chunk(2, 2)
      expect(my_entry.reading_chunk(2, 2)).to eq 'three space four space'
    end

    it "it can return end of string even during overshoot" do
      my_entry = DiaryEntry.new('monday', 'one space two space three space four space five space')
      my_entry.reading_chunk(2, 2)
      my_entry.reading_chunk(2, 2)
      expect(my_entry.reading_chunk(2, 2)).to eq 'five space'
    end

    it "loops back to first chunk after returning last chunk" do
      my_entry = DiaryEntry.new('monday', 'one space two space three space four space five space')
      my_entry.reading_chunk(2, 2)
      my_entry.reading_chunk(2, 2)
      my_entry.reading_chunk(2, 2)
      expect(my_entry.reading_chunk(2, 2)).to eq 'one space two space'
    end
  end
end