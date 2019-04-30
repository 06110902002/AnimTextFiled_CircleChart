//
//  AnimTextFiled.m
//  ZacharyTextField
//
//  Created by liuxiaobing on 2019/4/25.
//  Copyright © 2019 gaogang. All rights reserved.
//

#import "AnimTextFiled.h"

@interface AnimTextFiled()<UITextFieldDelegate>
{
    
    BOOL isEditing;
    BOOL isOrigin;
}
@end


@implementation AnimTextFiled

- (instancetype)initWithFrame:(CGRect)frame hintStr:(NSString*) placeHolderTxt{
    self = [super initWithFrame:frame];
    if(self){
        self.hintStr = placeHolderTxt;
        [self initView:frame];
        
    }
    return  self;
}


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self initView:frame];
    }
    return  self;
}

-(void) initView:(CGRect)frame{
    isEditing = NO;
    isOrigin = YES;
    self.hintLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 1.0 / 3.0 * frame.size.height, frame.size.width, 2.0 / 3.0 * frame.size.height)];
    self.hintLabel.text = self.hintStr;
    self.hintLabel.textColor = [UIColor grayColor];
    //self.hintLabel.backgroundColor = [UIColor blueColor];
    [self addSubview:self.hintLabel];
    
    self.editText = [[UITextField alloc] initWithFrame:CGRectMake(0, 1.0 / 3.0 * frame.size.height, frame.size.width, 2.0 / 3.0 * frame.size.height)];
    //self.editText.backgroundColor = [UIColor greenColor];
    self.editText.delegate = self;
    [self addSubview:self.editText];
    
}


-(void) startHintAnim{
    
    if(isEditing){
        return;
    }
    isEditing = YES;
    isOrigin = NO;
    self.hintLabel.center = CGPointMake(0, 1.0 / 3.0 * self.frame.size.height);
    self.hintLabel.layer.anchorPoint = CGPointMake(0, 0);//缩小的中心点
    
    //移动动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];///.y的话就向下移动。
    animation.toValue = [NSNumber numberWithFloat:-(1.0 / 3.0 * self.frame.size.height)];
    
    //缩小动画
    CABasicAnimation *ZoomAnima = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    ZoomAnima.fromValue = [NSNumber numberWithFloat:1];
    ZoomAnima.toValue = [NSNumber numberWithFloat:0.8];
    
    CAAnimationGroup *AnimationGroup = [CAAnimationGroup animation];
    AnimationGroup.animations = @[animation,ZoomAnima];
    AnimationGroup.duration = 0.3;
    AnimationGroup.removedOnCompletion = NO;
    AnimationGroup.fillMode = kCAFillModeForwards;
    [self.hintLabel.layer addAnimation:AnimationGroup forKey:@"groupAnimation"];
    
}

-(void) stopEditingAnimaiton{
    
    if(isOrigin) return;
    isOrigin = YES;
    isEditing = NO;
    self.hintLabel.center = CGPointMake(0, 0);
    self.hintLabel.layer.anchorPoint = CGPointMake(0, 0);//缩小的中心点
    //移动动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];///.y的话就向下移动。
    animation.toValue = [NSNumber numberWithFloat:1.0 / 3.0 * self.frame.size.height];
    //缩小动画
    CABasicAnimation *ZoomAnima = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    ZoomAnima.fromValue = [NSNumber numberWithFloat:0.8];
    ZoomAnima.toValue = [NSNumber numberWithFloat:1];
    
    CAAnimationGroup *AnimationGroup = [CAAnimationGroup animation];
    AnimationGroup.animations = @[animation,ZoomAnima];
    AnimationGroup.duration = 0.3;
    AnimationGroup.removedOnCompletion = NO;
    AnimationGroup.fillMode = kCAFillModeForwards;
    [self.hintLabel.layer addAnimation:AnimationGroup forKey:@"groupAnimation"];
}

-(void) releaseFirstResponder{
    [self.editText resignFirstResponder];
    if([self.editText.text isEqualToString:@""]){
        [self stopEditingAnimaiton];
    }
}

#pragma  mark -- UITextFeildDelagete
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [self startHintAnim];
}


- (void)textFieldDidEndEditing:(UITextField *)textField{
    [self releaseFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self releaseFirstResponder];
    return  YES;
}

@end
