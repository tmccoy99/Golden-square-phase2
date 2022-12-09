class TaskTracker
  
  def initialize
    @tasks = []
  end
  
  def list_tasks
    @tasks
  end

  def add_task(task_str)
    @tasks << task_str
  end
  
  def remove_task(task_str)
    @tasks.delete(task_str)
  end
  
end