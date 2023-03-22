require 'todo_list'

describe TodoList do
  context"given a task"do
    it"should add the task and return the task"do
        todo_list = TodoList.new
        task = "Buy bread"
        todo_list.add(task)
        expect(todo_list.print_tasks).to eq [task]
    end

    it"should a list of  tasks"do
      todo_list = TodoList.new
      task = "Buy bread"
      task_2 = "Buy milk"
      todo_list.add(task)
      todo_list.add(task_2)
      expect(todo_list.print_tasks).to eq [task, task_2]
    end
    
    it"should return empty list"do
      todo_list = TodoList.new
      expect(todo_list.print_tasks).to eq []
    end
  end
end