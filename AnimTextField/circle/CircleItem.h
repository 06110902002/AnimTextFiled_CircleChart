//
//  CircleItem.h
//  ZacharyTextField
//
//  Created by liuxiaobing on 2019/4/26.
//  Copyright © 2019 gaogang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CircleItem : NSObject

@property (nonatomic,assign) float r;
@property (nonatomic,assign) float g;
@property (nonatomic,assign) float b;
@property (nonatomic,assign) float lineWidth;//线宽
@property (nonatomic,assign) double percentage;//百分比
@property (nonatomic,copy) NSString* totalConsumption;
@property (nonatomic,copy) NSString* consumptionAmount;
@property (nonatomic,copy) NSString* name;

- (double)getPercentageWithConsumptionAmount:(NSString *)consumptionAmount;

@end

NS_ASSUME_NONNULL_END
