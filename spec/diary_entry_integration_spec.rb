require 'diary'
require 'diary_entries'

RSpec.describe "Diary Library Integration" do
    it "gets all diary entries" do
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("Title", "E F G H I")
      diary_entry_2 = DiaryEntry.new("Title", "E F G H I")
      diary.add(diary_entry_1)
      diary.add(diary_entry_2)
      expect(diary.all).to eq [diary_entry_1, diary_entry_2]
    end

   it "returns closest entry" do
    diary = Diary.new
      diary_entry_1 = DiaryEntry.new("Title", "E F G ")
      diary_entry_2 = DiaryEntry.new("Title", "E F G H I")
      diary.add(diary_entry_1)
      diary.add(diary_entry_2)
    expect(diary.find_best_entry_for_reading_time(4,1)).to eq diary_entry_1
  end

    it "raises error" do
       diary = Diary.new
        diary_entry_1 = DiaryEntry.new("Title", "E F G H I K L M")
        diary_entry_2 = DiaryEntry.new("Title", "E F G H I J J J")
        diary.add(diary_entry_1)
        diary.add(diary_entry_2)
      expect {diary.find_best_entry_for_reading_time(6,1) }.to raise_error "No match found"
   end
 end


 #expect(result.title).to eq "Title2"
 #expect(result.contents).to eq "A B C"