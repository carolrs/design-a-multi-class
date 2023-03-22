class TodoList
  def initialize
    @todo_list = []
  end

  def add(task)
    @todo_list << task
  end

  def print_tasks
    @todo_list
  end
end