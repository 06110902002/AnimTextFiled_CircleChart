//
//  ViewController.m
//  AnimTextField
//
//  Created by liuxiaobing on 2019/4/25.
//  Copyright © 2019 dream. All rights reserved.
//

#import "ViewController.h"
#import "AnimTextFiled.h"
#import "circle/CircleItem.h"
#import "circle/CircleView.h"

@interface ViewController (){
    AnimTextFiled* tt;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //    CusTextField = [[ZacharyTextField alloc]initWithFrame:CGRectMake(40, 200, 200, 60)];
    //    [self.view addSubview:CusTextField];
    
    tt = [[AnimTextFiled alloc]initWithFrame:CGRectMake(40, 200, 200, 60) hintStr:@"请输入手机号"];
    tt.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:tt];
    
    [self testCircle];
    
    int a = 30000; int b = 40000; int c = 60000;
    NSLog(@"39-----------:%d",(a * b / c));
    
}

-(void) testCircle{
    CircleItem *item1 = [[CircleItem alloc] init];
    item1.r = 0.9;
    item1.g = 0.6;
    item1.b = 0.8;
    item1.consumptionAmount = @"5000";
    item1.name = @"消费购物";
    item1.totalConsumption = @"9100";
    item1.percentage = [item1 getPercentageWithConsumptionAmount:item1.consumptionAmount];
    
    CircleItem *item2 = [[CircleItem alloc] init];
    item2.r = 0.6;
    item2.g = 0.6;
    item2.b = 0.9;
    item2.consumptionAmount = @"800";
    item2.name = @"生活缴费";
    item2.totalConsumption = @"9100";
    item2.percentage = [item2 getPercentageWithConsumptionAmount:item2.consumptionAmount];
    
    CircleItem *item3 = [[CircleItem alloc] init];
    item3.r = 0.8;
    item3.g = 0.5;
    item3.b = 0.9;
    item3.name = @"金融理财";
    item3.consumptionAmount = @"1500";
    item3.totalConsumption = @"9100";
    item3.percentage = [item3 getPercentageWithConsumptionAmount:item3.consumptionAmount];
    
    CircleItem *item4 = [[CircleItem alloc] init];
    item4.r = 0.4;
    item4.g = 0.8;
    item4.b = 1.0;
    item4.name = @"其他";
    item4.consumptionAmount = @"1800";
    item4.totalConsumption = @"9100";
    item4.percentage = [item4 getPercentageWithConsumptionAmount:item4.consumptionAmount];
    
    CircleView * circleView = [[CircleView alloc] initWithFrame:CGRectMake(10, 400, [UIScreen mainScreen].bounds.size.width-20, 200)];
    circleView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:circleView];
    circleView.circleItemArray = @[item1,item2,item3,item4];
    [circleView setNeedsLayout];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [super touchesBegan:touches withEvent:event];
    [tt releaseFirstResponder];
    //    [CusTextField ZacharyResignFirstResponder];
    //    [_CusTextField1 ZacharyResignFirstResponder];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
