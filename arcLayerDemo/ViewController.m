//
//  ViewController.m
//  arcLayerDemo
//
//  Created by felix on 2017/9/20.
//  Copyright © 2017年 Felix. All rights reserved.
//

#import "ViewController.h"
#import "CycleView.h"

@interface ViewController ()

@property (strong , nonatomic) UISlider *slider;

@property (strong , nonatomic) UILabel *progressLB;

@property (strong , nonatomic) CycleView *cycleView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CycleView *view = [[CycleView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    view.center = self.view.center;
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    self.cycleView = view;
    
    [self.view addSubview:self.progressLB];
    self.progressLB.center = self.view.center;
    
    
    self.slider = [[UISlider alloc] initWithFrame:CGRectMake(20, 50, self.view.frame.size.width - 40, 20)];
    self.slider.minimumValue = 0;
    self.slider.maximumValue = 100;
    [self.slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.slider];
}

- (UILabel *)progressLB {
    if (_progressLB == nil) {
        _progressLB = [[UILabel alloc] init];
        _progressLB.text = @"88.88%";
        _progressLB.textAlignment = NSTextAlignmentCenter;
        _progressLB.font = [UIFont systemFontOfSize:12.0f];
        [_progressLB sizeToFit];
        CGRect frame = _progressLB.frame;
        frame.size.width += 20;
        _progressLB.frame = frame;
        _progressLB.text = @"0.00%";
    }
    return  _progressLB;
}


- (void)sliderValueChanged:(UISlider *)slider{
    self.cycleView.progress = slider.value;
    self.progressLB.text = [NSString stringWithFormat:@"%0.2f％",slider.value];
}


@end
