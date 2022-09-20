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

  describe '#reading_time' do
    context 'Can read 2 wpm' do
      it 'returns reading time with 1 instance' do
        diary = Diary.new
        diary_entry1 = DiaryEntry.new("Monday", "I woke up and did some coding")
        diary.add diary_entry1
        expect(diary.reading_time(2)).to eq 4
      end

      it 'returns reading time with 2 instances' do
        diary = Diary.new
        diary_entry1 = DiaryEntry.new("Monday", "I woke up and did some coding")
        diary_entry2 = DiaryEntry.new("Tuesday", "Did some more coding")
        diary.add(diary_entry1)
        diary.add(diary_entry2)
        expect(diary.reading_time(2)).to eq 6
      end
    end
  end

  describe '#find_best_entry_for_reading_time' do
    context '3 wpm and 2 minutes' do
      it 'returns largest reading chunk that is smaller than or equal to 6' do
        diary = Diary.new
        diary_entry1 = DiaryEntry.new("Monday", "I woke up and did some coding")
        diary_entry2 = DiaryEntry.new("Tuesday", "Did some more coding")
        diary_entry3 = DiaryEntry.new("Wednesday", "Watched netflix, then some coding")
        diary_entry4 = DiaryEntry.new("Thursday", "This string is 6 words long")
        diary.add(diary_entry1)
        diary.add(diary_entry2)
        diary.add(diary_entry3)
        diary.add(diary_entry4)
        expect(diary.find_best_entry_for_reading_time(3, 2)).to eq "Thursday: This string is 6 words long"
      end
    end
  end
end