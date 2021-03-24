//
//  OneStack.m
//  StackAndQueue
//
//  Created by 刘杨 on 2021/3/23.
//

#import "OneStack.h"

@implementation OneStack {
    int _top; // 栈顶
    NSMutableArray *_data; // 存放的数据
    int _maxCount;  // 沾满
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _maxCount = 10;
    }
    return self;
}

- (void)createStack {
    _data = [[NSMutableArray alloc] init];
    _top = -1;
}

- (void)push:(NSString *)souce {
    if (_top == _maxCount) {
        NSLog(@"栈已经满了");
        return;
    }
    [_data addObject:souce];
    _top = (int)[_data count];
//    NSLog(@"插入成功");
}

- (void)pop {
    if (_top == -1) {
        NSLog(@"移除失败");
        return;
    }
    // 也可以使用removeLastObject
    [_data removeLastObject];
    _top--;
//    NSLog(@"移除成功");
}

- (NSString *)getTopStackData {
    if (_top == -1) {
        return @"";
    }
    return [_data lastObject];
}

- (int)getTop {
    return _top;
}

- (void)clear {
    [_data removeAllObjects];
    _top = -1;
    NSLog(@"清空成功");
}

- (void)printStack {
    if (_top == -1) {
        NSLog(@"堆栈是空的");
        return;
    }
    
    for (NSString *string in _data) {
        NSLog(@"堆栈里面的数据%@", string);
    }
}
@end
