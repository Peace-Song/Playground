#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>

int main(int argc, char *argv[]){
  int fd1, fd2, fd3;
  char *fname = argv[1];
  fd1 = open(fname, O_CREAT | O_TRUNC | O_RDWR, S_IRUSR | S_IWUSR);
  write(fd1, "pqrs", 4);
  fd3 = open(fname, O_APPEND | O_WRONLY, 0);
  write(fd3, "jklmn", 5);
  fd2 = dup(fd1);
  write(fd2, "wxyz", 4);
  write(fd3, "ef", 2);

  return 0;
}
