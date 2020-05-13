package bbs;

public class TaskBbs {
	private int TaskID;
	private String TaskTitle;
	private String TaskContent;
	private String TaskDate;
	private String TaskManager;
	private String TaskManagerName;
	private int TaskAvailable;
	private String TaskDoneDate;
	private int TaskHit;
	
	public int getTaskID() {
		return TaskID;
	}
	public void setTaskID(int taskID) {
		TaskID = taskID;
	}
	public String getTaskTitle() {
		return TaskTitle;
	}
	public void setTaskTitle(String taskTitle) {
		TaskTitle = taskTitle;
	}
	public String getTaskContent() {
		return TaskContent;
	}
	public void setTaskContent(String taskContent) {
		TaskContent = taskContent;
	}
	public String getTaskDate() {
		return TaskDate;
	}
	public void setTaskDate(String taskDate) {
		TaskDate = taskDate;
	}
	public String getTaskManager() {
		return TaskManager;
	}
	public void setTaskManager(String taskManager) {
		TaskManager = taskManager;
	}
	public String getTaskManagerName() {
		return TaskManagerName;
	}
	public void setTaskManagerName(String taskManagerName) {
		TaskManagerName = taskManagerName;
	}
	public int getTaskAvailable() {
		return TaskAvailable;
	}
	public void setTaskAvailable(int taskAvailable) {
		TaskAvailable = taskAvailable;
	}
	public String getTaskDoneDate() {
		return TaskDoneDate;
	}
	public void setTaskDoneDate(String taskDoneDate) {
		TaskDoneDate = taskDoneDate;
	}
	public int getTaskHit() {
		return TaskHit;
	}
	public void setTaskHit(int taskHit) {
		TaskHit = taskHit;
	}
	
}