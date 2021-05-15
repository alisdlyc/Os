/**
 * @description: 文件控制块
 */
typedef struct FCB {
    char filename[9];
    char exname[4];
    unsigned char attribute;        // 0: 目录文件，1: 普通文件
    unsigned long length;           // 文件占用数据块数量
  	char *first;			// 文件的起始地址
    char free;                      // 1 表示有效，0 表示空闲
} fcb;
