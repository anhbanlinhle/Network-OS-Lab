echo "Lesson number (XX): "; read lesson
echo "OS name (macos/linux): "; read os
echo "Task number (YY): "; read task
echo "Expected commands (Z): "; read cmd

mkdir lesson_$lesson lesson_$lesson/linux lesson_$lesson/macos

exec 3<> lesson_$lesson/$os/task_$task.md

  echo '<a name="bookmarks"/>\n' >&3
  echo '# Bookmarks\n' >&3
  echo '- [Requirements](#requirements)\n' >&3
  echo '- [Solutions](#solutions)\n' >&3
  echo '\t- [Commands](#commands)' >&3
  
  for i in `seq 1 $cmd`
  do
    echo "\t\t- [Command $i](#command-$i)" >&3
  done

  echo '\n\t- [Results](#results)' >&3
  for i in `seq 1 $cmd`
  do
    echo "\t\t- [Result of Command $i](#result-$i)" >&3
  done
  
  echo '\n<a name="requirements"/>\n' >&3
  echo '# Requirements\n' >&3
  for i in `seq 1 $cmd`
  do
    echo "- " >&3
  done

  echo '\n<a name="solutions"/>\n' >&3
  echo '# Solutions \n' >&3
  echo '<a name="commands"/>\n' >&3
  echo '## Commands\n' >&3
  
  for i in `seq 1 $cmd`
  do
    echo "<a name=\"command-$i\"/>\n" >&3
    echo "### Command $i [↑](#bookmarks) [↓](#result-$i)\n" >&3
    echo '```sh' >&3
    echo '' >&3
    echo '```\n' >&3  
  done
  
exec 3>&-

echo "File path: $(ls lesson_$lesson/$os/task_$task.md)";
