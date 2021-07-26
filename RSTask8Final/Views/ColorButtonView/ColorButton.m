//
//  ColorButton.m
//  RSTask8Final
//
//  Created by Gleb Tregubov on 18.07.2021.
//

#import "ColorButton.h"

@implementation ColorButton


- (instancetype)initWithFrame:(CGRect)frame Color:(UIColor *)color andColorTypeEnum:(colorType)colorType {
    self = [super initWithFrame:frame];
    if (self) {
        self.colorType = colorType;
        [self configuringView];
        [self configuringInnerRectColorLayerWithColor:color];
    }
    return self;
}

//- (instancetype)initWithColorType:(colorType)colorType {
//    self = [[super alloc] init];
//    if (self) {
//        self.colorType = colorType;
//    }
//    return self;
//}

- (void)configuringView {
    self.layer.cornerRadius = 10.0;
    
    self.backgroundColor = UIColor.whiteColor;
    self.layer.shadowOffset = CGSizeZero;
    self.layer.shadowRadius = 2.0;
    self.layer.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.25].CGColor;
    self.layer.shadowOpacity = 1;
    
    self.layer.borderWidth = 2.0;
    self.layer.borderColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0].CGColor;
    
    [self addTarget:self.delegate action:@selector(colorTapped:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)configuringInnerRectColorLayerWithColor:(UIColor *)color {
    CALayer *innerRectColorLayer = [CALayer layer];
    innerRectColorLayer.backgroundColor = color.CGColor;
    innerRectColorLayer.frame = CGRectMake(8.0, 8.0, 24.0, 24.0);
    innerRectColorLayer.cornerRadius = 6.0;
    
//    UIButton *innerRectColorButton = [[UIButton alloc] initWithFrame:CGRectMake(8.0, 8.0, 24.0, 24.0)];
    
//    innerRectColorButton.backgroundColor = color;
//    innerRectColorButton.layer.cornerRadius = 6.0;
    
//    innerRectColorButton
    
    [self.layer addSublayer:innerRectColorLayer];
//    [self addSubview:innerRectColorButton];
}

@end
