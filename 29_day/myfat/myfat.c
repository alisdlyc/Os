#include "stdlib.h"	/* sprintf */
#include "apilib.h"
/**
 * @description: 文件控制块
 */
typedef struct FCB {
    char filename[9];
    char exname[4];
    unsigned char attribute;        // 0: 目录文件，1: 普通文件
    char *start;
    int len;
    int size;
    char free;                      // 1 表示有效，0 表示空闲
    struct fcb *next;               // 当前层的下一个fcb块
} fcb;

char** split(int, char*);
int strlen(char*);
int strcmp(char*, char*);
fcb *create(char *, char *);
void strcpy(char *, char *, int);
fcb *init();
fcb * root;
void mkdir(char **, int depth);
void ls();
void cp(char*, fcb*);
void delete(fcb*);
void mv(fcb*, char *, char *);
void cat(fcb*);

void HariMain(void) {
    char in[100];
    int size = 6; /*字符串分割数*/
    init();
    // 对结果进行匹配
    while (strcmp("exit", in) != 0) {
        gets(in);
        char** re = split(size, in);

        if(strcmp(re[0], "create") == 0) {
            // create qwq.txt
            fcb* file = create(re[1], re[2]);
            printf("%s.%s 起始：%s 使用:%d 分配:%d\n", file->filename, file->exname, file->start, file->len, file->size);
            fcb * cur = root;
            while (cur->next != NULL) cur= cur->next;
            cur->next = file;
        } else if(strcmp(re[0], "ls") == 0) {
            ls();
        } else if(strcmp(re[0], "cp") == 0) {
            // cp something qwq.txt
            fcb* cur = root;
            while (cur != NULL) {
                if(cur->attribute == 1 && strcmp(cur->filename, re[2]) == 0 && strcmp(cur->exname, re[3]) == 0) {
                    break;
                }
                cur = cur->next;
            }
            cp(re[1], cur);
            printf("file is %s, text is %s\n", cur->filename, cur->start);
        } else if(strcmp(re[0], "delete") == 0) {
            // delete qwq.txt
            fcb* cur = root;
            while (cur != NULL) {
                if(cur->attribute == 1 && strcmp(cur->filename, re[2]) == 0 && strcmp(cur->exname, re[3]) == 0) {
                    break;
                }
                cur = cur->next;
            }
            delete(cur);
        } else if(strcmp(re[0], "mv") == 0) {
            // mv qwq.txt ovo.txt
            fcb* cur = root;
            while (cur != NULL) {
                if(cur->attribute == 1 && strcmp(cur->filename, re[1]) == 0 && strcmp(cur->exname, re[2]) == 0) {
                    break;
                }
                cur = cur->next;
            }
            mv(cur, re[3], re[4]);
        } else if(strcmp(re[0], "cat") == 0) {
            // cat qwq.txt
            fcb* cur = root;
            while (cur != NULL) {
                if(cur->attribute == 1 && strcmp(cur->filename, re[1]) == 0 && strcmp(cur->exname, re[2]) == 0) {
                    break;
                }
                cur = cur->next;
            }
            cat(cur);
        }
    }

}

/**
 * @TODO 读文件
 * */
void cat(fcb* file) {
    printf("%s\n", file->start);
}

/**
 * @TODO 复制文件
 * */
void mv(fcb* file, char * fileName, char * extName) {
    fcb * re = (fcb *) malloc(sizeof (fcb));
    strcpy(fileName, re->filename, 8);
    strcpy(extName, re->exname, 4);
    re->attribute = 1;
    re->free = 0;

    int size = 1024;
    re->start = (char *) malloc((size + 1) * sizeof(char));
    strcpy(file->start, re->start, strlen(file->start));
    re->len = strlen(file->start);
    re->size = size;
    re->next = NULL;

    fcb* cur = root;
    while (cur->next != NULL) cur = cur->next;
    cur->next = re;
}

/**
 * @TODO 删除文件
 * */
void delete(fcb* file) {
    fcb* cur = root;
    while (cur != NULL && (fcb *)cur->next == file) cur = cur->next;
    fcb* next = cur->next;
    cur->next = next->next;
}

/**
 * @TODO 修改目标文件内容
 * */
void cp(char* content, fcb* file) {
    strcpy(content, file->start, strlen(content));
    file->len = strlen(content);
}

/**
 * @TODO 列出当前所有文件
 * */
void ls() {
    fcb* cur = root;
    while (cur != NULL) {
        if(cur->attribute == 1) {
            printf("%s.%s 内容：%s 使用:%d 分配:%d\n", cur->filename, cur->exname, cur->start, cur->len, cur->size);
        } else{
            printf("/%s\n", cur->filename);
        }
        cur = cur->next;
    }
}
/*
 * @TODO 初始化根目录文件
 * */
fcb* init() {
    root = (fcb*) malloc(sizeof (fcb));
    strcpy("/", root->filename, 8);
    root->free = 1;
    root->next = NULL;
    root->attribute = 0;
}

/**
 * @TODO 实现文件的创建
 * */
fcb* create(char* fileName, char* extName) {
    fcb* re = (fcb*) malloc(sizeof (fcb));
    strcpy(fileName, re->filename, 8);
    strcpy(extName, re->exname, 4);
    re->attribute = 1;
    re->free = 0;
    int size = 1024;
    re->start = (char *) malloc((size + 1) * sizeof(char));
    re->len = 0;
    re->size = size;
    re->next = NULL;
    return re;
}

/*
 * @TODO 拷贝字符串, 将字符串a的内容拷贝到字符串b
 * */
void strcpy(char* a, char* b, int len) {
    for (int i = 0; i < len; ++i) {
        b[i] = a[i];
    }
    b[len] = '\0';
}

/*
 * @TODO 判断两个字符串是否相等， 若相等返回0
 * */
int strcmp(char* a, char* b) {
    int len = strlen(a);
    if(len != strlen(b)) return -1;
    for (int i = 0; i < len; ++i) {
        if(a[i] != b[i]) return -1;
    }
    return 0;
}

/*
 * @TODO 按照空格和'.'将输入进行拆分，并返回字符串类型的数组
 * @Parm size 返回数组re的size
 * */
char** split(int size, char* str) {
    int len = strlen(str);
    int index = 0, offset = 0;
    char** re = (char**)malloc((size + 1) * sizeof(char*));

    for (int i = 0; i <= len && index < size; ++i) {
        if(str[i] == ' ' || str[i] == '.' || str[i] == '\0' || str[i] == '/') {
            // [offset, i) 为re[index]的值
            char *s = (char*)malloc((i - offset + 1) * sizeof(char));
            for (int j = 0; j < i - offset; ++j) {
                s[j] = str[offset + j];
            }
            offset = i + 1;
            re[index++] = s;
        }
    }
    return re;
}

int strlen(char* str) {
    int re = 0;
    while(str[re++] != '\0');
    return re;
}
