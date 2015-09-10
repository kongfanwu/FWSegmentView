//
//  FWSegmentView.m
//  FWSegmentView
//
//  Created by 孔凡伍 on 15/9/10.
//  Copyright (c) 2015年 kongfanwu. All rights reserved.
//

#import "FWSegmentView.h"

@interface FWItemButton : UIButton
@property (strong, nonatomic) NSDictionary *itemDic;
@property (strong, nonatomic) UILabel *fwtitleLabel;
@end

static NSString *const FWSegmentViewImageNameKey = @"FWSegmentViewImageNameKey";
static NSString *const FWSegmentViewSelectedImageNameKey = @"FWSegmentViewSelectedImageNameKey";
static NSString *const FWSegmentViewTitleKey = @"FWSegmentViewTitleKey";
static NSString *const FWSegmentViewTitleColorKey = @"FWSegmentViewTitleColorKey";
static NSString *const FWSegmentViewSelectedTitleColorKey = @"FWSegmentViewSelectedTitleColorKey";
static const CGFloat FWSegmentViewSliderAnimationTime = 0.3f;

@interface FWSegmentView ()

@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) UIView *sliderView;

@end

@implementation FWSegmentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.selectedSegmentIndex = 0;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat item_w = self.frame.size.width / self.dataArray.count;
    CGFloat item_h = self.frame.size.height;
    
    for (int i = 0; i < self.dataArray.count; i++) {
        NSDictionary *itemDic = self.dataArray[i];
        
        FWItemButton *itemButton = [FWItemButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:itemButton];
        [itemButton addTarget:self action:@selector(itemButtonCliek:) forControlEvents:UIControlEventTouchUpInside];
        itemButton.tag = i;
        itemButton.frame = CGRectMake(item_w * i, 0, item_w, item_h);
        itemButton.itemDic = itemDic;
        
        // 设置当前选中状态
        if (i == _selectedSegmentIndex) {
            itemButton.selected = YES;
            lastButton = itemButton;
        }
    }
    
    // 创建滑动View
    if (_segmentViewType == FWSegmentViewTypeButtomSlider) {
        self.sliderView.frame = CGRectMake(_selectedSegmentIndex * item_w, item_h - _sliderViewHieght, item_w, _sliderViewHieght);
    }
}

static UIButton *lastButton;
- (void)itemButtonCliek:(UIButton *)click
{
    lastButton.selected = !lastButton.selected;
    click.selected = !click.selected;
    lastButton = click;
    
    if (_segmentViewType == FWSegmentViewTypeButtomSlider) {
        [UIView animateWithDuration:FWSegmentViewSliderAnimationTime animations:^{
            self.sliderView.frame = CGRectMake(click.tag * _sliderView.frame.size.width,
                                               _sliderView.frame.origin.y,
                                               _sliderView.frame.size.width,
                                               _sliderView.frame.size.height);            
        }];
    }
}

#pragma mark - 公开方法

- (void)insertSegmentWithNormalTitle:(NSString *)title
                      withTitleColor:(UIColor *)titleColor
              withSelectedTitleConor:(UIColor *)selectedTitleColor
                           withImage:(UIImage *)image
                   withSelectedImage:(UIImage *)selectedImage
{
    NSDictionary *itemDic = @{FWSegmentViewTitleKey : title,
                              FWSegmentViewTitleColorKey : titleColor,
                              FWSegmentViewSelectedTitleColorKey : selectedTitleColor,
                              FWSegmentViewImageNameKey : image,
                              FWSegmentViewSelectedImageNameKey : selectedImage};
    [self.dataArray addObject:itemDic];
}

#pragma mark - 懒加载

- (NSMutableArray *)dataArray
{
    if (!_dataArray) _dataArray = [NSMutableArray array];
    return _dataArray;
}

- (UIView *)sliderView
{
    if (!_sliderView) {
        _sliderView = UIView.new;
        _sliderView.backgroundColor = self.sliderColor;
        [self addSubview:_sliderView];
    }
    return _sliderView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end


@implementation FWItemButton

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    self.fwtitleLabel = [[UILabel alloc] initWithFrame:self.bounds];
    [self addSubview:_fwtitleLabel];
    _fwtitleLabel.backgroundColor = [UIColor clearColor];
    _fwtitleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    if (selected) {
        _fwtitleLabel.textColor = _itemDic[FWSegmentViewSelectedTitleColorKey];
    } else {
        _fwtitleLabel.textColor = _itemDic[FWSegmentViewTitleColorKey];
    }
}

- (void)setItemDic:(NSDictionary *)itemDic
{
    if (_itemDic == itemDic) return;
    
    _itemDic = itemDic;
    
    [self setImage:_itemDic[FWSegmentViewImageNameKey] forState:UIControlStateNormal];
    [self setImage:_itemDic[FWSegmentViewSelectedImageNameKey] forState:UIControlStateSelected];
    
    _fwtitleLabel.text = _itemDic[FWSegmentViewTitleKey];
    _fwtitleLabel.textColor = _itemDic[FWSegmentViewTitleColorKey];
}

@end

