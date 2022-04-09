#include "types.h"
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
  enablecount();
  int i = fork();
  int yehey;
  ps();
  if (i < 0){
	exit();
	}
  else if (i == 0){
 	for (yehey = 0; yehey <= 3; yehey++){
		printf(2, "Hello world, I am child. \n");
		ps();
	}
  }
  else {
	for (yehey = 0; yehey <= 3; yehey++){
		wait();
                printf(2,"Hello world, I am parent. \n");
		ps();
        }
	resetcount();
	ps();
	disablecount();
	ps();
	}
  ps();
  exit();
}

