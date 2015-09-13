//
//  UIButton+FYClickInterval.h
//  固定间隔不能点击按钮
//
//  Created by fanyingzhao on 15/9/13.
//  Copyright (c) 2015年 fyz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (FYClickInterval)

/**
 *  可以两次点击的间隔
 */
@property (nonatomic, assign) NSInteger clickInterval;

/**
 *  不能点击时按钮的颜色
 */
@property (nonatomic, strong) UIColor* notEnableColor;
@end
