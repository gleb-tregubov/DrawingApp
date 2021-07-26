//
//  DrawingsButton.m
//  RSTask8Final
//
//  Created by Gleb Tregubov on 19.07.2021.
//

#import "DrawingButton.h"
//#import "DrawingButton+PictureTypeEnum.h"

@implementation DrawingButton

- (instancetype)initWithFrame:(CGRect)frame andTitle:(NSString *)title {
    self = [super initWithFrame:frame andTitle:title];
    if (self) {
        [self configuringView];
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title andPictureTypeEnum:(pictureType)pictureType {
    self = [super initWithFrame:frame andTitle:title];
    if (self) {
        [self configuringView];
        
        self.pictureType = pictureType;
        
        [self addTarget:self.delegate action:@selector(drawingButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(void) configuringView {
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.frame = CGRectMake(0.0, 0.0, 106.0, 22.0);
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.contentEdgeInsets = UIEdgeInsetsMake(9.0, 47.0, 9.0, 47.0);
}

//- (void)setActive {
//    self.layer.shadowColor = [UIColor colorNamed:@"Light Green Sea"].CGColor;
//    self.layer.shadowRadius = 4;
//}
//
//- (void)setDefault {
//    self.layer.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.25].CGColor;
//    self.layer.shadowRadius = 2;
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
