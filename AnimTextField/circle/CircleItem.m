//
//  CircleItem.m
//  ZacharyTextField
//
//  Created by liuxiaobing on 2019/4/26.
//  Copyright © 2019 gaogang. All rights reserved.
//

#import "CircleItem.h"

@implementation CircleItem

-(instancetype)init {
    
    if (self = [super init]) {
        _r = 0.8;
        _g = 0.8;
        _b = 0.8;
        _lineWidth = 20.0;
        _percentage = 1.0;
    }
    return self;
}

- (double)getPercentageWithConsumptionAmount:(NSString *)consumptionAmount  {
    double percentage = consumptionAmount.doubleValue/_totalConsumption.doubleValue;
    return percentage;
}
@end
