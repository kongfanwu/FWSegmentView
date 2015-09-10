//
//  ViewController.h
//  FWSegmentView
//
//  Created by 孔凡伍 on 15/9/10.
//  Copyright (c) 2015年 kongfanwu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ViewControllerDelegate;

@interface ViewController : UIViewController

@property (nonatomic) id <ViewControllerDelegate> viewControllerDelegate;

@end

@protocol ViewControllerDelegate <NSObject>

- (void)adfdfd;

@end