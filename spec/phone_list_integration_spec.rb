require 'phone_book'
require 'diary'
require 'diary_entries'

RSpec.describe "Phone Book Integration" do

  it "gets all phone entries" do
    diary = Diary.new
    diary_entry_1 = DiaryEntry.new("Title", "E F G H I 01234987633")
    diary_entry_2 = DiaryEntry.new("Title", "E F 09234987634 G H I")
    diary_entry_3 = DiaryEntry.new("Title", "09734987634 E F G H 09934987634 I")

    diary.add(diary_entry_1)
    diary.add(diary_entry_2)
    diary.add(diary_entry_3)

    phone_book = PhoneBook.new(diary)

    expect(phone_book.all_phones).to eq(["01234987633", "09234987634", "09734987634", "09934987634"])
  end

  it "should ignore numbers that arent phones" do
    diary = Diary.new
    diary_entry_1 = DiaryEntry.new("Title", "E F G H I 87633")
    diary_entry_2 = DiaryEntry.new("Title", "E F 092349879999634 G H I")
    diary_entry_3 = DiaryEntry.new("Title", "09734987634 E F G H 09934987634 I")

    diary.add(diary_entry_1)
    diary.add(diary_entry_2)
    diary.add(diary_entry_3)

    phone_book = PhoneBook.new(diary)

    expect(phone_book.all_phones).to eq(["09734987634", "09934987634"])
  end

  it "should not return duplicated phones numbers" do
    diary = Diary.new
    diary_entry_1 = DiaryEntry.new("Title", "E F G H I 01234987633")
    diary_entry_2 = DiaryEntry.new("Title", "E F 09234987634 G H I")
    diary_entry_3 = DiaryEntry.new("Title", "09734987634 E F G H 01234987633 I")

    diary.add(diary_entry_1)
    diary.add(diary_entry_2)
    diary.add(diary_entry_3)

    phone_book = PhoneBook.new(diary)

    expect(phone_book.all_phones).to eq(["01234987633", "09234987634", "09734987634"])
  end

end