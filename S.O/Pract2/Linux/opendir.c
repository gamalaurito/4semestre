#include <time.h>
#include <stdio.h>
#include <dirent.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <inttypes.h>
#include <sys/stat.h>
#include <sys/types.h>

int main(int argc, char* argv[]) {
	DIR *direc = opendir(argv[1]);
	struct dirent *dir1 = readdir(direc);
	struct dirent *dir2 = readdir(direc);
	int read = readdir_r(direc, dir1, &dir2);
	struct stat *ura = malloc(sizeof(struct stat));
	printf("-----------------------------------------------------\n");
	while(dir2 != NULL) {
		char path[500] = "";
		strcat(path, argv[1]);
		printf("File name: \t\t%s\n",(dir1->d_name));
		strcat(path,(dir1->d_name));
		int file = stat(path, ura);
		printf("File Size: \t\t%jd bytes\n",ura -> st_size);
	    printf("Number of Links: \t%jd\n",ura -> st_nlink);
	    printf("File inode: \t\t%jd\n",ura -> st_ino);
	    printf("File Permissions: \t");
	    printf( (S_ISDIR(ura -> st_mode)) ? "d" : "-");
	    printf( (ura -> st_mode & S_IRUSR) ? "r" : "-");
	    printf( (ura -> st_mode & S_IWUSR) ? "w" : "-");
	    printf( (ura -> st_mode & S_IXUSR) ? "x" : "-");
	    printf( (ura -> st_mode & S_IRGRP) ? "r" : "-");
	    printf( (ura -> st_mode & S_IWGRP) ? "w" : "-");
	    printf( (ura -> st_mode & S_IXGRP) ? "x" : "-");
	    printf( (ura -> st_mode & S_IROTH) ? "r" : "-");
	    printf( (ura -> st_mode & S_IWOTH) ? "w" : "-");
	    printf( (ura -> st_mode & S_IXOTH) ? "x" : "-");
	    printf("\n");
	    printf("The file %s a symbolic link\n", (S_ISLNK(ura -> st_mode)) ? "is" : "is not");
	    printf("Last status change:       %s", ctime(&ura -> st_ctime));
    	printf("Last file access:         %s", ctime(&ura -> st_atime));
    	printf("Last file modification:   %s", ctime(&ura -> st_mtime));
	    printf("-------------------------------------------------------\n");
		dir1 = dir2;
		read = readdir_r(direc, dir1, &dir2);
	}
	int close = closedir(direc);
	return 0;
}