//
//  PickNumberView.m
//  WmgsTemplate
//
//  Created by LanTun on 15/9/15.
//  Copyright © 2015年 Infinite Bussiness Alliance. All rights reserved.
//

#import "PickNumberView.h"

@interface PickNumberView()
{
    UITextField *_numberText;
}

@end


@implementation PickNumberView

#pragma setter

- (void)setLineColor:(UIColor *)lineColor{
    _numberText.layer.borderColor = lineColor.CGColor;
    _numberText.layer.borderWidth = 1.0;
    
}
- (void)setTitleColor:(UIColor *)titleColor{
    _numberText.textColor = titleColor;
}

- (void)setAddAndSubColor:(UIColor *)addAndSubColor{
    [_subButton setTitleColor:addAndSubColor forState:UIControlStateNormal];
    [_addButton setTitleColor:addAndSubColor forState:UIControlStateNormal];
}


-(void)setNumber:(int)number{
    _number = number;
    _numberText.text = [NSString stringWithFormat:@"%d",_number];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _subButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_subButton setTitleColor:TabtopBkgColor forState:UIControlStateNormal];
        [_subButton setTitle:@"-" forState:UIControlStateNormal];
        _subButton.tag = 1;
        [_subButton addTarget:self action:@selector(changeCount:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_subButton];
        
        _addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addButton setTitleColor:TabtopBkgColor forState:UIControlStateNormal];
        [_addButton setTitle:@"+" forState:UIControlStateNormal];
        _addButton.tag = 2;
        [_addButton addTarget:self action:@selector(changeCount:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_addButton];
        
        _numberText = [[UITextField alloc]init];
        _numberText.layer.borderColor = TabtopBkgColor.CGColor;
        _numberText.layer.borderWidth = 1.0;
        _numberText.layer.masksToBounds = YES;
        _numberText.enabled = NO;
        
        _numberText.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_numberText];
        
        self.layer.cornerRadius = 1.0;
        self.layer.borderColor = TabtopBkgColor.CGColor;
        self.layer.borderWidth = 1.0;
        self.layer.masksToBounds = YES;
        
        [_subButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.left.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(self.frame.size.height, self.frame.size.height));
        }];
        
        [_addButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.right.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(self.frame.size.height, self.frame.size.height));
        }];
        
        [_numberText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.bottom.equalTo(self);
            make.left.equalTo(_subButton.mas_right);
            make.right.equalTo(_addButton.mas_left);
        }];
        
        _minSize = 1;
        self.number = 1;
    }
    return self;
}

- (void)changeCount:(UIButton *)sender {
   
    if (sender.tag == 1) {
        if (_number == _minSize ) {
            return;
        }else if (_number > _minSize) {
            self.number--;
            if (_subBlock) {
                _subBlock(_goodid,_number);
            }
        }
    }else if (sender.tag == 2) {
        if (_number == _maxSize ) {
            return;
        }else if (_number < _maxSize) {
           self.number++;
            if (_addBlock) {
                _addBlock(_goodid,_number);
            }
        }
    }
}

@end
