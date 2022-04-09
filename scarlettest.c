#include "types.h"
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
  enablecount();
  int myPID = getpid();
  int child_PID = fork();
  scarlet(myPID, 1234);
  int y;
  if (child_PID == 0){
	printf(2, "Child running \n");
  	for (y = 0; y <= 50; y++){
		ps();
	}
  }
  else if (child_PID < 0){
	exit();
	}
  else {
	wait();
	}
  ps();
  exit();
  return 0;
}

