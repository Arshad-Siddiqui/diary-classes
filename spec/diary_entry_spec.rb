require 'diary_entry'

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

  describe '#reading_time' do
    context 'contents is 6 words long' do
      it 'returns 6 when wpm is 1' do
        my_entry = DiaryEntry.new('monday', 'one space two space three space')
        expect(my_entry.reading_time(1)).to eq 6
      end

      it 'returns 3 when wpm is 2' do
        my_entry = DiaryEntry.new('monday', 'one space two space three space')
        expect(my_entry.reading_time(2)).to eq 3
      end
    end
  end
end
