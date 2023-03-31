ps -ylC httpd --sort:rss | awk '
BEGIN {
  min=999999999990;
  max=0;
}
{
  sum+=$8;
  if ($8 > max) {max=$8;}
  if ($8 < min) {min=$8;}
  ++n;
 } 
 END {
  printf("Httpd      Tot=%d (%d procs) - Avg=%.2f => %.2f Mb Min=%.2f Max=%.2f\n", sum, n, sum/n, sum/n/1024, min/1024, max/1024);
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
