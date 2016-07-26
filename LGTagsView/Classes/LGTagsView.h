//
//  LGTagsView.h
//  TagView
//
//  Created by 于宙 on 16/7/21.
//  Copyright © 2016年 于宙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LGTagsView : UIView

@property (nonatomic, assign) IBInspectable CGFloat             preferredMaxLayoutWidth;

@property (nonatomic, strong) IBInspectable UIColor *           tagBackgroundColor;

@property (nonatomic, assign) UIEdgeInsets                      contentInset;
///水平距离
@property (nonatomic, assign) IBInspectable CGFloat             itemSpace;
///垂直距离
@property (nonatomic, assign) IBInspectable CGFloat             lineSpace;

///tag的文字与边框的的距离
@property (nonatomic, assign) IBInspectable CGPoint             tagPadding;

@property (nonatomic, strong) UIFont *                          font;
@property (nonatomic, strong) IBInspectable UIColor *           textColor;

@property (nonatomic, assign) IBInspectable CGFloat             tagBornerRadius;
//若tagNeedRoundCorner为真，则忽略tagBornerRadius
@property (nonatomic, assign) IBInspectable BOOL                tagNeedRoundCorner;

@property (nonatomic, assign) IBInspectable CGFloat             tagBorderWidth;
@property (nonatomic, strong) IBInspectable UIColor *           tagBorderColor;


- (void)setTags:(NSArray<NSString *> *)tags;

@end
