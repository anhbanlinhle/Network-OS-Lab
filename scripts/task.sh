echo "Lesson number (XX): "; read lesson
echo "OS name (macos/linux): "; read os
echo "Task number (YY): "; read task
cp -i TEMPLATE.md lesson_$lesson/$os/task_$task.md
echo "File path: $(ls lesson_$lesson/$os/task_$task.md)";