require 'diary_entries'
  describe DiaryEntry do
    context "If no title is provided" do
      it "when No title is provided" do
      expect {DiaryEntry.new("", "I need some more sleep")}.to raise_error "No title."
      end
    end  
  
    context "If no contents is provided" do
      it "when No contents is provided" do
      expect {DiaryEntry.new("Monday", "")}.to raise_error "No contents."
      end
    end 

    context "Return an entered title or contents" do
      it "return title" do
        entry = DiaryEntry.new("Monday", "Some contents")
        expect(entry.title).to eq "Monday"
      end

      it "return title" do
        entry = DiaryEntry.new("Tuesday", "Some contents")
        expect(entry.title).to eq "Tuesday"
      end

      it "return content" do
        entry = DiaryEntry.new("Tuesday", "Some contents")
        expect(entry.contents).to eq "Some contents"
      end
    end 

    context "#count_words" do
      it "returns number of words as integer" do
        entry = DiaryEntry.new("Monday", "Some contents")
        expect(entry.count_words).to eq 2
      end

      it "returns number of words as integer" do
        entry = DiaryEntry.new("Monday", "Some contents are here")
        expect(entry.count_words).to eq 4
      end
    end
  end