ps -ylC httpd --sort:rss | awk '
{
  sum+=$8; 
  ++n
 } 
 END {
  printf("Httpd      Tot=%d (%d procs) - Avg=%.2f => %.2f Mb\n", sum, n, sum/n, sum/n/1024);
 }
'


ps -ylC rotatelogs --sort:rss | awk '
{
  sum+=$8; 
  ++n
 } 
 END {
  printf("Rotatelogs Tot=%d (%d procs) - Avg=%.2f => %.2f Mb\n", sum, n, sum/n, sum/n/1024);
 }
'
