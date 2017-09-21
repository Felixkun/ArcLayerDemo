//
//  CycleView.m
//  arcLayerDemo
//
//  Created by felix on 2017/9/20.
//  Copyright © 2017年 Felix. All rights reserved.
//

#import "CycleView.h"


@interface CycleView ()

@property (strong , nonatomic) CAShapeLayer *blueLayer;

@property (strong , nonatomic) CAShapeLayer *colorLayer;


@property (strong , nonatomic) CAShapeLayer *colorMaskLayer;

@end

@implementation CycleView



- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUPBackground];
        [self setupColorLayer];
        [self setupColorMaskLayer];
    }
    return self;
}



- (void)setUPBackground{
    UIView *view = [[UIView alloc] initWithFrame:self.bounds];
    view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.2];
    [self addSubview:view];
    
    self.layer.mask = self.blueLayer;
}


- (CAShapeLayer *)blueLayer {

    if (_blueLayer == nil) {
        _blueLayer = [CAShapeLayer layer];
        _blueLayer.frame = self.bounds;
            CGPoint center = CGPointMake(100, 100);
            CGFloat radius = 90;
            CGFloat startA  = - M_PI * 4 / 3;
            CGFloat endA = M_PI / 3;
        
            UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
        _blueLayer.lineCap = kCALineCapRound;
        _blueLayer.lineWidth = 10;
        _blueLayer.fillColor = [UIColor clearColor].CGColor;
        _blueLayer.strokeColor = [UIColor blueColor].CGColor;
        _blueLayer.path = path.CGPath;
        
    }
    return _blueLayer;
}

- (void)setupColorLayer{
    self.colorLayer = [CAShapeLayer layer];
    self.colorLayer.frame = self.bounds;
    [self.layer addSublayer:self.colorLayer];
    
    CAGradientLayer *leftLayer = [CAGradientLayer layer];
    leftLayer.frame = CGRectMake(0, 0, self.colorLayer.frame.size.width * 0.5, self.colorLayer.frame.size.height);
    leftLayer.locations = @[@(0.3) , @(0.9) , @(1)];
    leftLayer.colors = @[(id)[UIColor yellowColor].CGColor , (id)[UIColor orangeColor].CGColor];
    [self.colorLayer addSublayer:leftLayer];
    
    CAGradientLayer *rightLayer = [CAGradientLayer layer];
    rightLayer.frame = CGRectMake( self.colorLayer.frame.size.width * 0.5, 0, self.colorLayer.frame.size.width * 0.5, self.colorLayer.frame.size.height);
    rightLayer.locations = @[@(0.3) , @(0.9) , @(1)];
    rightLayer.colors = @[(id)[UIColor yellowColor].CGColor , (id)[UIColor lightGrayColor].CGColor];
    [self.colorLayer addSublayer:rightLayer];
    
    
    
}

- (void)setupColorMaskLayer{
    _colorMaskLayer = [CAShapeLayer layer];
    _colorMaskLayer.frame = self.bounds;
    CGPoint center = CGPointMake(100, 100);
    CGFloat radius = 90;
    CGFloat startA  = - M_PI * 4 / 3;
    CGFloat endA = - M_PI * 4 / 3 + self.progress /100.0 * ( M_PI * 5 / 3);
    
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    _colorMaskLayer.lineCap = kCALineCapRound;
    _colorMaskLayer.lineWidth = 11;
    _colorMaskLayer.fillColor = [UIColor clearColor].CGColor;
    _colorMaskLayer.strokeColor = [UIColor blueColor].CGColor;
    _colorMaskLayer.path = path.CGPath;
    self.colorLayer.mask = _colorMaskLayer;
    
}

- (void)setProgress:(CGFloat )progress{
    
    _progress = progress;
    self.colorMaskLayer.strokeEnd = progress;
    [self setupColorMaskLayer];
}



@end
