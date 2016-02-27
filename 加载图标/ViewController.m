//
//  ViewController.m
//  加载图标
//
//  Created by 谢小御 on 16/1/25.
//  Copyright © 2016年 谢小御. All rights reserved.
//

#import "ViewController.h"
#import "LO_GifHudView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)OneActionButton:(UIButton *)sender {
    [LO_GifHudView setLO_GifWithImageName:@"pika.gif"];
    [LO_GifHudView show];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [LO_GifHudView stop];
    });
}
- (IBAction)TwoActionButton:(UIButton *)sender {
    [LO_GifHudView setLO_GifWithImageName:@"pika2.gif"];
    [LO_GifHudView show];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [LO_GifHudView stop];
    });
}

@end
