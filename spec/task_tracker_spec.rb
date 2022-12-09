require "task_tracker"

RSpec.describe TaskTracker do
  context "No tasks added, list_tasks called" do
    it "returns empty array" do
      tt = TaskTracker.new
      expect(tt.list_tasks).to eq []
    end
  end
  
  context "After adding tasks" do
    it "Can return the tasks in an array" do
      tt = TaskTracker.new
      tt.add_task("Feed the cat")
      expect(tt.list_tasks).to eq ["Feed the cat"]
      tt.add_task("Mow the lawn")
      expect(tt.list_tasks).to eq ["Feed the cat", "Mow the lawn"]
    end
  end
  
  context "Calling remove_task" do
    it "removes task from array" do
      tt = TaskTracker.new
      tt.add_task("Feed the cat")
      tt.remove_task("Feed the cat")
      expect(tt.list_tasks).to eq []
    end
  end
end