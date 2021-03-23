//
// Created by Tony on 2021/3/1.
//

#import <Foundation/Foundation.h>
@class LinkeListNode;

@interface SingleLinkList : NSObject
/**
 * 创建链表 头部插入法（逆序插入
 * @return
 */
- (LinkeListNode *)createListHead:(NSInteger)count;

/**
 * 创建链表 尾部插入法（顺序插入）
 * @param count
 * @return
 */
- (LinkeListNode *)createListTail:(NSInteger)count;

/**
 * 查找下标在链表中的值
 * @param index 下标
 * @return
 */
- (LinkeListNode *)getElementAtIndex:(NSUInteger )index;

- (void)insterIndex:(NSUInteger)index withElement:(NSInteger)e;

- (void)deleteAtIndex:(NSInteger)index;

- (void)printNode;
- (void)printNodeWith:(LinkeListNode *)node;
- (LinkeListNode *)reverseListNode:(LinkeListNode *)node;
@end