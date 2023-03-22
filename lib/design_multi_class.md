# Multi-Class Planned Design Recipe

## 1. Describe the Problem
As a user
So that I can record my experiences
I want to keep a regular diary

As a user
So that I can reflect on my experiences
I want to read my past diary entries

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary

As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries

_Put or write the user story here. Add any clarifying notes you might have._

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
┌────────────────────────────┐
| PhoneBook                  |
| - all_phones(diary)        |
└────────────────────────────┘
           |
           | owns
           ▼
┌─────────────────────────┐
│ Diary                   │
│                         │
│ - add                   │
│ - all                   │
│ - count_words           |
| - find_best_entry_for   |
└─────────────────────────┘
           |
           | owns list of
           ▼
┌──────────────────────────────┐
│ DiaryEntries(title,content)  │
│ - titles                     │
│ - contents                   │
│ - count_words                │
└──────────────────────────────┘

┌──────────────────────────────┐
│ TodoList                     │
│ - add(task)                  │
│ - print_tasks                │
└──────────────────────────────┘

```

_Also design the interface of each class in more detail._

```ruby
class Diary
def initialize
end

def add(entry)
  #add entries to Diary
end

def all
  #return entries
end

def count_words
  #return the words quantity
end

def find_best_entry_for_reading_time(wpm,minutes)
  #given a time it return the best entry to read
end

class DiaryEntry
  def initialize(title, contents)
end

def title
end

def contents
 end

def count_words
end

class TodoList
  def initialize
  end

  def add(task)
  end

  def print_tasks
  end
end

class PhoneBook
  def initialize(diary)
  end
  
  def all_phones
  end
end
```
## 3. Create Examples as Integration Tests
_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._
```ruby
# EXAMPLE

#Integration classes
#gets all diary entries
diary = Diary.new
diary_entry_1 = DiaryEntry.new("Title", "E F G H I")
diary_entry_2 = DiaryEntry.new("Title", "E F G H I")
diary.add(diary_entry_1)
diary.add(diary_entry_2)
diary.all #=> [diary_entry_1, diary_entry_2]

#gets all phone entries 
diary = Diary.new
diary_entry_1 = DiaryEntry.new("Title", "Mary, my friend's 09993453211 phone")
diary.add(diary_entry_1)
diary_entry_3 = DiaryEntry.new("Title", "Johane's number 01234987634")
diary.add(diary_entry_3)

phone_book = PhoneBook.new(diary)

phone_book.all_phones #=> (["09993453211", "01234987634"])

#ignore numbers that are not phone numbers
diary = Diary.new
diary_entry_1 = DiaryEntry.new("Title", "E F G H I 87633")
diary_entry_2 = DiaryEntry.new("Title", "E F 092349879999634 G H I")
diary_entry_3 = DiaryEntry.new("Title", "097349876")
diary.add(diary_entry_1)
diary.add(diary_entry_2)
diary.add(diary_entry_3)

phone_book = PhoneBook.new(diary)
phone_book.all_phones #=> (["09734987634", "09934987634"])

# should not return duplicated phones numbers
diary = Diary.new
diary_entry_1 = DiaryEntry.new("Title", "E F G H I 01234987633")
diary_entry_2 = DiaryEntry.new("Title", "E F 09234987634 G H I")
diary_entry_3 = DiaryEntry.new("Title", "09734987634 E F G H 01234987633 I")

diary.add(diary_entry_1)
diary.add(diary_entry_2)
diary.add(diary_entry_3)

phone_book = PhoneBook.new(diary)

phone_book.all_phones #=> (["01234987633", "09234987634", "09734987634"])
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE
#raise error

DiaryEntry.new("", "I need some more sleep") # => no title
DiaryEntry.new("Monday", "") #=> no content

#return title and content
entry = DiaryEntry.new("Monday", "Some contents")
entry.title #=>"Monday"
entry.contents #"Some contents"

#return count_words method
entry = DiaryEntry.new("Monday", "Some contents")
entry.count_words #-> 2

#return reading_time method
entry = DiaryEntry.new("Monday", ("one two three four five six seven eight nine ten ")*10)
entry.reading_time(10) #=> 10

#return todo_list method
todo_list = TodoList.new
todo_list.add("Go for a walk")
todo_list.add("Do yoga")

todo_list.all #=> ["Go for a walk", "Do yoga"]

#return empty list
todo_list = TodoList.new
todo_list.print_tasks #=> []
```
