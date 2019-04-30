//
//  AnimTextFiled.h
//  ZacharyTextField
//
//  Created by liuxiaobing on 2019/4/25.
//  Copyright © 2019 gaogang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AnimTextFiled : UIView

@property(nonatomic,strong) UILabel* hintLabel;
@property(nonatomic,strong) UITextField* editText;
@property(nonatomic,copy) NSString* hintStr;

- (instancetype)initWithFrame:(CGRect)frame hintStr:(NSString*) placeHolderTxt;

-(void) releaseFirstResponder;

@end

NS_ASSUME_NONNULL_END
