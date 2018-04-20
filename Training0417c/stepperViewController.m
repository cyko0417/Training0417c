//
//  stepperViewController.m
//  Training0417c
//
//  Created by  Chih-Yu Ko on 2018/4/19.
//  Copyright © 2018年 Oath. All rights reserved.
//

#import "stepperViewController.h"

@interface stepperViewController ()

@end

@implementation stepperViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)stepperChanged:(id)sender {
    [self calculateMembers];
    [self updateMessage];
}

- (void)calculateMembers {
    NSString *miValue=[NSString stringWithFormat:@"%d", (int)stepperMi.value];
    labelMi.text=miValue;
    NSString *denValue=[NSString stringWithFormat:@"%d", (int)stepperDen.value];
    labelDen.text=denValue;
    NSString *yaValue=[NSString stringWithFormat:@"%d", (int)stepperYa.value];
    labelYa.text=yaValue;
}

- (void)updateMessage {
    NSString *message = [NSString stringWithFormat: @"派出 迷唇娃%d隻 電擊怪%d隻 鴨嘴寶寶%d隻", (int)stepperMi.value, (int)stepperDen.value, (int)stepperYa.value];
    labelResult.text=message;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
