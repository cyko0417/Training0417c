//
//  JokeViewController.m
//  Training0417c
//
//  Created by  Chih-Yu Ko on 2018/4/17.
//  Copyright © 2018年 Oath. All rights reserved.
//

#import "JokeViewController.h"

@interface JokeViewController ()

@end

@implementation JokeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submitPushed:(id)sender {

    NSString *zodiac = txtZodiac.text;
    NSInteger segIndex = segGender.selectedSegmentIndex;
    BOOL match=false;

    if(segIndex==1) {
        if ([zodiac isEqualToString: @"orange"]) {
            match=true;
        }
    }
    //NSString *tmp = [NSString stringWithFormat:@"%d", (int)segIndex];

    if (match==true) {
        imgResult.image=[UIImage imageNamed:@"yes"];
        //imgResultYes.hidden=NO;
        //imgResultNo.hidden=YES;
    }
    else {
        imgResult.image=[UIImage imageNamed:@"no"];
        //imgResultYes.hidden=YES;
        //imgResultNo.hidden=NO;
    }
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
