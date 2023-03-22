class PhoneBook
  def initialize(diary)
    @diary = diary
  end
  
  def all_phones
    @diary.all.flat_map {|entry|
      entry.contents.split.select { |word|
        word.match(/^[\d]{10,11}$/)
      }
    }.uniq
  end
end