//
//  main.m
//  SingleLinkedList
//
//  Created by Tony on 2021/3/1.
//
//

#import <Foundation/Foundation.h>
#import "SingleLinkList.h"
#import "LinkeListNode.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        SingleLinkList *singleLinkList = [[SingleLinkList alloc] init];
        // 创建链表
        LinkeListNode *node = [singleLinkList createListHead:10];
//        LinkeListNode *node = [singleLinkList createListTail:10];
        [singleLinkList printNode];
        // 获取链表下标的节点
        NSUInteger index = 10;
        LinkeListNode *getNode = [singleLinkList getElementAtIndex:index];
        NSLog(@"根据下标%ld找到的节点%ld", index, getNode.data);

        NSLog(@"==============");
        [singleLinkList insterIndex:2 withElement:2000];
        [singleLinkList printNode];
        NSLog(@"==============");

        [singleLinkList deleteAtIndex:1];
        [singleLinkList printNode];

//        [singleLinkList printNode];
//        LinkeListNode *reverseNode = [singleLinkList reverseListNode:node];
//        [singleLinkList printNodeWith:reverseNode];
    }
    return 0;

}
