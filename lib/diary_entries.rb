class DiaryEntry
  def initialize(title, contents) # title, contents are strings, which may contain phone numbers
    fail "No title." if title.empty?
    fail "No contents." if contents.empty?
    @title = title 
    @contents = contents
  end

  def title
    @title
  end

  def contents
    @contents
  end

  def count_words
    @contents.split.size
  end

end