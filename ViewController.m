//
//  ViewController.m
//  FWSegmentView
//
//  Created by 孔凡伍 on 15/9/10.
//  Copyright (c) 2015年 kongfanwu. All rights reserved.
//

#import "ViewController.h"
#import "FWSegmentView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    FWSegmentView *segmentView = [[FWSegmentView alloc] initWithFrame:CGRectMake(50, 100, 200, 40)];
    segmentView.selectedSegmentIndex = 1;
    segmentView.sliderColor = [UIColor redColor];
    segmentView.sliderViewHieght = 5;
    segmentView.segmentViewType = FWSegmentViewTypeButtomSlider;
    [segmentView insertSegmentWithNormalTitle:@"1"
                               withTitleColor:[UIColor blueColor]
                       withSelectedTitleConor:[UIColor redColor]
                                    withImage:[UIImage imageNamed:@"1"]
                            withSelectedImage:[UIImage imageNamed:@"2"]];
    
    [segmentView insertSegmentWithNormalTitle:@"2"
                               withTitleColor:[UIColor blueColor]
                       withSelectedTitleConor:[UIColor redColor]
                                    withImage:[UIImage imageNamed:@"1"]
                            withSelectedImage:[UIImage imageNamed:@"2"]];
    
    [segmentView insertSegmentWithNormalTitle:@"3"
                               withTitleColor:[UIColor blueColor]
                       withSelectedTitleConor:[UIColor redColor]
                                    withImage:[UIImage imageNamed:@"1"]
                            withSelectedImage:[UIImage imageNamed:@"2"]];
    [self.view addSubview:segmentView];
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
