//
//  ViewController.m
//  XZDoubleFingersDemo
//
//  Created by 徐章 on 16/5/27.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "ViewController.h"
#import "XZDoubleFingersView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    XZDoubleFingersView *doubleFingersView = [[XZDoubleFingersView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    doubleFingersView.center = self.view.center;
    doubleFingersView.backgroundColor = [UIColor redColor];
    [self.view addSubview:doubleFingersView];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
