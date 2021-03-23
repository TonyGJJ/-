//
// Created by Tony on 2021/3/1.
//

#import "SingleLinkList.h"
#import "LinkeListNode.h"

@implementation SingleLinkList {
    LinkeListNode *_node;
}

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    [self reverseString:@"Hello World!"];
    return self;
}

- (LinkeListNode *)createListHead:(NSInteger)count {
    _node = [[LinkeListNode alloc] init];
    _node.next = nil;
    for (int i = 0; i < count; ++i) {
        LinkeListNode *tempNode = [[LinkeListNode alloc] init];
        tempNode.data = (i + 1) * 100;
        tempNode.next = _node.next;
        _node.next = tempNode;
    };
    return _node;
}

- (LinkeListNode *)createListTail:(NSInteger)count {
    LinkeListNode *c;
    _node = [[LinkeListNode alloc] init];
    c = _node;
    for (int i = 0; i < count; ++i) {
        LinkeListNode *tempNode = [[LinkeListNode alloc] init];
        tempNode.data = (i + 1) * 100;
        c.next = tempNode;
        c = tempNode;
    }
//    c.next = nil;
    return _node;
}

- (LinkeListNode *)getElementAtIndex:(NSUInteger )index {
    LinkeListNode *p = _node.next;
    int j = 1;
    while (p.next && j < index) {
        p = p.next;
        j++;
    }
    if (!p || j > index) {
        return nil;
    }
    return p;
}

- (void)insterIndex:(NSUInteger)index withElement:(NSInteger)e {
    int j = 1;
    LinkeListNode *p = _node;
    LinkeListNode *s = [[LinkeListNode alloc] init];;
    while (p && j < index) {
        p = p.next;
        ++j;
    }
    if (!p || j > index) {
        [NSException raise:NSRangeException format:@"插入超过范围"];
    }
    s.data = e;
    s.next = p.next; // 将p的后续节点给到s的后续
    p.next = s;      // 将s赋值给p的后续
}

- (void)deleteAtIndex:(NSInteger)index {
    int j = 1;
    LinkeListNode *node = _node;
    LinkeListNode *q;
    while (node.next && j < index) {
        node = node.next;
        ++j;
    }
    if (!(node.next) || j > index) {
        [NSException raise:NSRangeException format:@"删除超过范围"];
    }
    q = node.next;
    node.next = q.next;
}

- (void)printNode {
    LinkeListNode *node = _node.next;
    while (node != nil && node.data != 0) {
        NSLog(@"%ld", node.data);
        node = node.next;
    }
    NSLog(@"=================");
}

- (void)printNodeWith:(LinkeListNode *)node {
    LinkeListNode *tempNode = node;
    while (tempNode != nil && tempNode.data != 0) {
        NSLog(@"%ld", tempNode.data);
        tempNode = tempNode.next;
    }
    NSLog(@"=================");
}

- (LinkeListNode *)reverseListNode:(LinkeListNode *)node {
    LinkeListNode *prev = nil;
    LinkeListNode *curr = node;
    while (curr) {
        LinkeListNode *tempNode = curr.next;
        curr.next = prev;
        prev = curr;
        curr = tempNode;
    }
    return prev;
}

- (NSString *)reverseString:(NSString *)string {
    NSMutableString *prev = [[NSMutableString alloc] init];
    NSMutableString *curr = string.mutableCopy;
    NSUInteger count = string.length;
    while (count != 0) {
        unichar tempString = [string characterAtIndex:count-1];
        curr = [NSMutableString stringWithFormat:@"%c", tempString];
        [prev appendString:curr];
        count--;
    }
    NSLog(@"%@",prev);
    return prev;
}
@end