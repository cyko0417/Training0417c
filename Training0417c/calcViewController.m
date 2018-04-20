//
//  calcViewController.m
//  Training0417c
//
//  Created by  Chih-Yu Ko on 2018/4/19.
//  Copyright © 2018年 Oath. All rights reserved.
//

#import "calcViewController.h"

@interface calcViewController ()

@end

@implementation calcViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self reset];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reset {
    strOperand1=@"";
    strOperand2=@"";
    strOperator=@"";
    operand1=0;
    operand2=0;
    inDot=false;
    inOperator=false;
    inError=false;
}

- (IBAction)operandPushed:(UIButton *)sender {
    NSString *tmpOperand;
    
    // 根據有沒有 operator 決定現在是輸入 operand1 或 operand2
    tmpOperand=strOperator.length==0 ? strOperand1 : strOperand2;

    // 限制能輸入的長度
    if ( (tmpOperand.length>=16 || inError==true) && ![sender.currentTitle isEqualToString:@"AC"]) {
        labelResult.text=@"Err - press AC";
        inError=true;
        return;
    }
    
    // AC: 重設所有狀態
    if ([sender.currentTitle isEqualToString:@"AC"]) {
        [self reset];
        tmpOperand=@"";
    }
    // ±: 根據第一個字元決定如何處理
    else if ([sender.currentTitle isEqualToString:@"±"]) {
        if (![tmpOperand isEqualToString:@""]) {
            if ([tmpOperand hasPrefix:@"-"]) {
                tmpOperand=[tmpOperand substringFromIndex:1];
            }
            else {
                tmpOperand=[@"-" stringByAppendingString:tmpOperand];
            }
        }
    }
    else if ([sender.currentTitle isEqualToString:@"%"]) {
        if (tmpOperand.length>0 && [tmpOperand floatValue]!=0) {
            float flOperand=[tmpOperand floatValue];
            flOperand=flOperand/100;
            tmpOperand=[NSString stringWithFormat:@"%f", flOperand];
        }
    }
    // .: 對每個數字，小數點只能輸入一次
    else if ([sender.currentTitle isEqualToString:@"."]) {
        if (inDot==false) {
            if ([tmpOperand isEqualToString:@""]) {
                tmpOperand=@"0.";
            }
            else {
                tmpOperand=[tmpOperand stringByAppendingString:@"."];
            }
            inDot=true;
            // 直接輸入小數點變 0. 也算是輸入數字了，所以 inOperator 要改
            inOperator=false;
        }
    }
    // 真正的數字
    else {
        // 目前只輸入一個0，不能再輸入另一個0
        if ([tmpOperand isEqualToString:@"0"]) {
            if (![sender.currentTitle isEqualToString:@"0"]) {
                tmpOperand=sender.currentTitle;
            }
        }
        // 其他數字就直接加到後面
        else {
            // 剛輸入了 operator，接下來輸入數字，那值要清空
            if (inOperator==true) {
                tmpOperand=sender.currentTitle;
                inOperator=false;
            }
            else {
                tmpOperand=[tmpOperand stringByAppendingString:sender.currentTitle];
            }
        }
    }

    // 設回原來的變數
    if (strOperator.length==0) {
        strOperand1=tmpOperand;
    }
    else {
        strOperand2=tmpOperand;
    }
    
    // debug 用
    NSLog(@"operand1=%@, operator=%@, operand2=%@", strOperand1, strOperator, strOperand2);
    
    // 顯示在畫面上
    labelResult.text=tmpOperand;
}


- (IBAction)operatorPushed:(UIButton *)sender {
    if (inError==true) {
        return;
    }
    
    // 換一個數，小數點重設
    inDot=false;
    // 記錄是輸入 operator
    inOperator=true;
    // 第一次輸入 operator 而且有 operand1，直接存起來
    if (strOperator.length==0 && strOperand1.length!=0) {
        strOperator=sender.currentTitle;
    }
    // 第一次以後的輸入要作判斷決定如何處理
    else {
        // 先前已有 operand2 (亦即目前有 operand1, operator, operand2) 那就開始計算
        if (strOperand2.length!=0) {
            [self calculate];
            labelResult.text=strOperand1;
            strOperand2=@"";
            // 算好要把 operator 再重設
            // 按下等於，表示這次的計算已終止，operator不再沿用
            if ([sender.currentTitle isEqualToString:@"="]) {
                strOperator=@"";
            }
            else {
                strOperator=sender.currentTitle;
            }
        }
        // 還沒有 operand2(連續按 operator)，代換 operator 就好
        else {
            strOperator=sender.currentTitle;
        }
    }
    // debug 用
    NSLog(@"operand1=%@, operator=%@, operand2=%@", strOperand1, strOperator, strOperand2);
}

- (void)calculate {
    float operand1=strOperand1.floatValue;
    float operand2=strOperand2.floatValue;
    
    if ([strOperator isEqualToString:@"+"]) {
        operand1=operand1+operand2;
    }
    else if ([strOperator isEqualToString: @"-"]) {
        operand1=operand1-operand2;
    }
    else if ([strOperator isEqualToString: @"×"]) {
        operand1=operand1*operand2;
    }
    else if ([strOperator isEqualToString: @"÷"]) {
        if (operand2==0) {
            inError=true;
        }
        else {
            operand1=operand1/operand2;
        }
    }
    
    if (inError==false) {
        if ([self isInt:operand1]) {
            strOperand1=[NSString stringWithFormat:@"%d", (int)operand1];
        }
        else {
            strOperand1=[NSString stringWithFormat:@"%f", operand1];
        }
    }
    else {
        strOperand1=@"Err - press AC";
    }
}

- (BOOL)isInt:(float) number {
    return number==(int)number;
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
