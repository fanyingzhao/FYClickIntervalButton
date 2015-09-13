//
//  UIButton+FYClickInterval.m
//  固定间隔不能点击按钮
//
//  Created by fanyingzhao on 15/9/13.
//  Copyright (c) 2015年 fyz. All rights reserved.
//

#import "UIButton+FYClickInterval.h"
#import <objc/runtime.h>

static char btnClickIntercal;
static char btnNotEnableColor;
@implementation UIButton (FYClickInterval)

+ (void)load
{
    Method system = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method custom = class_getInstanceMethod(self, @selector(fy_sendAction:to:forEvent:));
    method_exchangeImplementations(system, custom);
}

- (void)fy_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    if (![self clickInterval]) {
        [self fy_sendAction:action to:target forEvent:event];
        return;
    }
    
    if (self.enabled) {
        [self fy_sendAction:action to:target forEvent:event];
    }
    
    self.enabled = NO;
    
    if (self.notEnableColor) {
        [self setTitleColor:self.notEnableColor forState:UIControlStateDisabled];
    }
    
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.clickInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        weakSelf.enabled = YES;
    });
}

- (NSInteger)clickInterval
{
    return [objc_getAssociatedObject(self, &btnClickIntercal) doubleValue];
}

- (void)setClickInterval:(NSInteger)clickInterval
{
    objc_setAssociatedObject(self, &btnClickIntercal, @(clickInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)notEnableColor
{
    return objc_getAssociatedObject(self, &btnNotEnableColor);
}

- (void)setNotEnableColor:(UIColor *)notEnableColor
{
    objc_setAssociatedObject(self, &btnNotEnableColor, notEnableColor, OBJC_ASSOCIATION_RETAIN);
}

@end
