//
//  ViewController.m
//  FYClickIntervalButton
//
//  Created by fanyingzhao on 15/9/13.
//  Copyright (c) 2015年 fyz. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+FYClickInterval.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.btn.clickInterval = 5;
    self.btn.notEnableColor = [UIColor lightGrayColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionBtnTouch:(UIButton *)sender
{
    NSLog(@"btn clicked");
}
@end
