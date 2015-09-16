//
//  PickNumberView.h
//  WmgsTemplate
//
//  Created by LanTun on 15/9/15.
//  Copyright © 2015年 Infinite Bussiness Alliance. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PickBlock)(int goodid,int number);

@interface PickNumberView : UIView

@property (assign,nonatomic) int goodid;
@property (strong,nonatomic) UIButton *addButton;
@property (assign,nonatomic) int number;
@property (strong,nonatomic) UIButton *subButton;
@property (assign,nonatomic) int maxSize;
@property (assign,nonatomic) int minSize;
@property (strong,nonatomic) UIColor *titleColor;
@property (strong,nonatomic) UIColor *addAndSubColor;
@property (strong,nonatomic) UIColor *lineColor;

@property (copy,nonatomic) PickBlock addBlock;
@property (copy,nonatomic) PickBlock subBlock;

@end
