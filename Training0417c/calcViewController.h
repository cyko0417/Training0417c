//
//  calcViewController.h
//  Training0417c
//
//  Created by  Chih-Yu Ko on 2018/4/19.
//  Copyright © 2018年 Oath. All rights reserved.
//

#import "ViewController.h"

@interface calcViewController : ViewController {
    
    __weak IBOutlet UILabel *labelResult;
    
    NSString *strOperand1, *strOperand2;
    NSString *strOperator;
    
    float operand1;
    float operand2;
    BOOL inDot;       // 目前數字已輸入過小數點
    BOOL inOperator;  // 剛輸入 operator (接下來輸入會是第二個數字)
    BOOL inError;     // 目前是錯誤狀況，只能按 AC
}

@end
