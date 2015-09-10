//
//  FWSegmentView.h
//  FWSegmentView
//
//  Created by 孔凡伍 on 15/9/10.
//  Copyright (c) 2015年 kongfanwu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, FWSegmentViewType) {
    FWSegmentViewTypeDefault,
    FWSegmentViewTypeButtomSlider,
};

@interface FWSegmentView : UIView

/**
 *  样式
 */
@property (nonatomic) FWSegmentViewType segmentViewType;

/**
 *  默认选择
 */
@property(nonatomic) NSInteger selectedSegmentIndex;

/**
 *  滑动条颜色
 */
@property (strong, nonatomic) UIColor *sliderColor;

/**
 *  滑动条高
 */
@property (nonatomic) CGFloat sliderViewHieght;

/**
 *  添加按钮，可多次调用添加按钮。
 *
 *  @param title              文字
 *  @param titleColor         文字正常颜色
 *  @param selectedTitleColor 文字选中颜色
 *  @param image              正常图片
 *  @param selectedImage      选中图片
 */
- (void)insertSegmentWithNormalTitle:(NSString *)title
                      withTitleColor:(UIColor *)titleColor
              withSelectedTitleConor:(UIColor *)selectedTitleColor
                           withImage:(UIImage *)image
                   withSelectedImage:(UIImage *)selectedImage;
@end
