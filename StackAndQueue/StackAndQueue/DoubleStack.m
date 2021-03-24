//
//  DoubleStack.m
//  StackAndQueue
//
//  Created by 刘杨 on 2021/3/23.
//

#import "DoubleStack.h"

@implementation DoubleStack {
    NSMutableArray *_data;
    int _top1;
    int _top2;
    int _maxCount;
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
    _top1 = -1;
    _top2 = 20;
    _data = [[NSMutableArray alloc] init];
    for (int i = 0; i < 20; i++) {
        [_data addObject:@""];
    }
    NSLog(@"创建堆栈成功");
}

- (void)push:(NSString *)source withStackNumber:(int) number {
    if (_top1 + 1 == _top2) {
        NSLog(@"堆栈已满");
        return;
    }
    
    if (number == 1) {
        _top1 ++;
        _data[_top1] = source;
    } else if (number == 2) {
        _top2 --;
        _data[_top2] = source;
    }
    NSLog(@"插入成功");
}

- (void)popStackNumber:(int)number {
    if (number == 1) {
        if (_top1 == -1) {
            NSLog(@"删除Top1失败");
            return;
        }
        _top1 --;
        [_data removeObjectAtIndex:_top1];
    } else if (number == 2) {
        if (_top2 == _maxCount) {
            NSLog(@"删除Top2失败");
            return;
        }
        _top2 ++;
        [_data removeObjectAtIndex:_top2];
    }
    NSLog(@"出栈成功");
}

- (void)clear {
    _top1 = -1;
    _top2 = (int)[_data count];
    [_data removeAllObjects];
    NSLog(@"清空成功");
}

- (void)printStack {
    if (_top1 == -1 || _top2 == _maxCount) {
        NSLog(@"堆栈是空的");
        return;
    }
    
    for (NSString *string in _data) {
        NSLog(@"堆栈里面的数据%@", string);
    }
}

@end
