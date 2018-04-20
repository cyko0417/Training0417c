//
//  JokeViewController.h
//  Training0417c
//
//  Created by  Chih-Yu Ko on 2018/4/17.
//  Copyright © 2018年 Oath. All rights reserved.
//

#import "ViewController.h"

@interface JokeViewController : ViewController {
    
    __weak IBOutlet UITextField *txtZodiac;
    
    __weak IBOutlet UISegmentedControl *segGender;
    
    __weak IBOutlet UIImageView *imgResult;
    
    __weak IBOutlet UIImageView *imgResultYes;
    
    __weak IBOutlet UIImageView *imgResultNo;
}

@end
