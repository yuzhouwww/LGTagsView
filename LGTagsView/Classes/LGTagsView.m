//
//  LGTagsView.m
//  TagView
//
//  Created by 于宙 on 16/7/21.
//  Copyright © 2016年 于宙. All rights reserved.
//

#import "LGTagsView.h"

@implementation LGTagsView {
    NSArray<NSString *> *_tags;
    NSMutableArray<UILabel *> *_tagLabelArray;
    CGSize _contentSize;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
        if (!_textColor) {
            _textColor = [UIColor lightGrayColor];
        }
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
        _itemSpace = 5.0f;
        _lineSpace = 5.0f;
        _tagPadding = CGPointMake(5.0f, 5.0f);
        _tagBornerRadius = 3.0f;
        _tagBorderWidth = 1.0f / [UIScreen mainScreen].scale;
        _tagBorderColor = [UIColor lightGrayColor];
        _tagBackgroundColor = [UIColor whiteColor];
        _textColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)commonInit {
    _tagLabelArray = [NSMutableArray array];
    
    
    _font = [UIFont systemFontOfSize:15];
}

- (void)setTags:(NSArray<NSString *> *)tags {
    NSAssert(_preferredMaxLayoutWidth > 0, @"调用setTags: 之前必须设置 preferredMaxLayoutWidth 属性");
    
    if ([tags isEqualToArray:_tags]) {
        return;
    }
    
    _tags = tags;
    
    [self setNeedsLayout];
}

- (void)setContentInset:(UIEdgeInsets)contentInset {
    _contentInset = contentInset;
    
    [self setNeedsLayout];
}

- (void)setPreferredMaxLayoutWidth:(CGFloat)preferredMaxLayoutWidth {
    _preferredMaxLayoutWidth = preferredMaxLayoutWidth;
    
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat currentX = _contentInset.left;
    CGFloat currentY = _contentInset.top;
    CGFloat itemHeight = 0.0;
    BOOL multiLine;
    
    BOOL enable = [UIView areAnimationsEnabled];
    
    @autoreleasepool {
        for (NSUInteger i = 0; i < _tags.count; i ++) {
            NSString *tagText = _tags[i];
            CGSize size = [tagText sizeWithAttributes:@{NSFontAttributeName:_font}];
            itemHeight = itemHeight ?: ceilf(size.height);
            UILabel *label = [self createLabelWithIndex:i];
            label.text = tagText;
            if (currentX + ceilf(size.width) + _tagPadding.x * 2 + _contentInset.right > _preferredMaxLayoutWidth && currentX > _contentInset.left) {
                currentX = _contentInset.left;
                currentY += ceilf(size.height) + _tagPadding.y * 2 + _lineSpace;
                multiLine = YES;
            }
            
            label.frame = CGRectMake(currentX, currentY, ceilf(size.width) + _tagPadding.x * 2, ceilf(size.height) + _tagPadding.y * 2);
            if (_tagNeedRoundCorner) {
                label.layer.cornerRadius = (ceilf(size.height) + _tagPadding.x * 2) * 0.5;
            } else {
                label.layer.cornerRadius = _tagBornerRadius;
            }
            
            currentX += ceilf(size.width) + _tagPadding.x * 2 + _itemSpace;
        }
        
        currentY += itemHeight + _tagPadding.y * 2 + _contentInset.bottom;
        
        _contentSize = CGSizeMake(_preferredMaxLayoutWidth, currentY);
        [self invalidateIntrinsicContentSize];
    }
    
    if (_tags.count < _tagLabelArray.count) {
        for (NSUInteger i = _tags.count; i < _tagLabelArray.count; i ++) {
            [_tagLabelArray[i] removeFromSuperview];
            [_tagLabelArray removeObjectAtIndex:i];
        }
    }
    
    [UIView setAnimationsEnabled:enable];
}

- (UILabel *)createLabelWithIndex:(NSUInteger)index {
    UILabel *label;
    if (_tagLabelArray.count > index) {
        label = _tagLabelArray[index];
    } else {
        label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        [_tagLabelArray addObject:label];
    }

    label.font = _font;
    label.textColor = _textColor;
    label.backgroundColor = _tagBackgroundColor;
    label.layer.borderWidth = _tagBorderWidth;
    label.layer.borderColor = _tagBorderColor.CGColor;
    label.layer.masksToBounds = _tagBorderWidth > 0;
    return label;
}

- (CGSize)intrinsicContentSize {
    return _contentSize;
}



@end