//
// Created by Tony on 2021/3/1.
//

#import <Foundation/Foundation.h>

@interface LinkeListNode : NSObject

// 暂时将链表的数据域定义为 Int
@property (assign, nonatomic) NSInteger data;
// 下一个节点
@property (strong, nonatomic) LinkeListNode *next;

@end