//
//  LGTagsView.h
//  TagView
//
//  Created by 于宙 on 16/7/21.
//  Copyright © 2016年 于宙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LGTagsView : UIView

@property (nonatomic, assign) IBInspectable CGFloat             preferredMaxLayoutWidth;            //最大宽度

@property (nonatomic, strong) IBInspectable UIColor *           tagBackgroundColor;                 //tag背景颜色

@property (nonatomic, assign) UIEdgeInsets                      contentInset;                       //上下左右边距

@property (nonatomic, assign) IBInspectable CGFloat             itemSpace;                          //水平距离
@property (nonatomic, assign) IBInspectable CGFloat             lineSpace;                          //垂直距离

@property (nonatomic, assign) IBInspectable CGPoint             tagPadding;                         //tag的文字与边框的的距离

@property (nonatomic, strong) UIFont *                          font;                               //tag字体
@property (nonatomic, strong) IBInspectable UIColor *           textColor;

@property (nonatomic, assign) IBInspectable CGFloat             tagBorderRadius;                    //tag圆角半径

@property (nonatomic, assign) IBInspectable BOOL                tagNeedRoundCorner;                 //若tagNeedRoundCorner为真，则忽略tagBornerRadius

@property (nonatomic, assign) IBInspectable CGFloat             tagBorderWidth;                     //边框宽度
@property (nonatomic, strong) IBInspectable UIColor *           tagBorderColor;                     //边框颜色


- (void)setTags:(NSArray<NSString *> *)tags;

@end
