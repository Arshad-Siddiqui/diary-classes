require 'diary_entry'
require 'diary'

RSpec.describe 'Diary Integration' do
  describe '#add' do
    it 'Adds instance of diary_entry class to stored array' do
      diary = Diary.new
      diary_entry = DiaryEntry.new('Monday', 'I woke up and did some coding')
      diary.add(diary_entry)
      expect(diary.all).to eq 'Monday: I woke up and did some coding'
    end

    it 'Adds instances of diary_entry class to stored array' do
      diary = Diary.new
      diary_entry1 = DiaryEntry.new("Monday", "I woke up and did some coding")
      diary_entry2 = DiaryEntry.new("Tuesday", "Did some more coding")
      diary_entry3 = DiaryEntry.new("Wednesday", "Watched netflix, then some coding")
      diary.add(diary_entry1)
      diary.add(diary_entry2)
      diary.add(diary_entry3)
      expect(diary.all).to eq "Monday: I woke up and did some coding,\nTuesday: Did some more coding,\nWednesday: Watched netflix, then some coding"
    end
  end

  describe '#count_words' do
    it 'returns the number of words with 1 instance' do
      diary = Diary.new
      diary_entry1 = DiaryEntry.new("Monday", "I woke up and did some coding")
      diary.add(diary_entry1)
      expect(diary.count_words).to eq 7
    end

    it 'returns the number of words with 2 instances' do
      diary = Diary.new
      diary_entry1 = DiaryEntry.new("Monday", "I woke up and did some coding")
      diary_entry2 = DiaryEntry.new("Tuesday", "Did some more coding")
      diary.add(diary_entry1)
      diary.add(diary_entry2)
      expect(diary.count_words).to eq 11
    end
  end
end