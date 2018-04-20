//
//  stepperViewController.h
//  Training0417c
//
//  Created by  Chih-Yu Ko on 2018/4/19.
//  Copyright © 2018年 Oath. All rights reserved.
//

#import "ViewController.h"

@interface stepperViewController : ViewController {
    
    __weak IBOutlet UIStepper *stepperMi;
    __weak IBOutlet UIStepper *stepperDen;
    __weak IBOutlet UIStepper *stepperYa;
    
    
    __weak IBOutlet UILabel *labelMi;
    __weak IBOutlet UILabel *labelDen;
    __weak IBOutlet UILabel *labelYa;

    __weak IBOutlet UILabel *labelResult;
}

@end
