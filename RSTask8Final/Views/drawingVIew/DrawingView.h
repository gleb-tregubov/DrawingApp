//
//  drawingView.h
//  RSTask8Final
//
//  Created by Gleb Tregubov on 19.07.2021.
//

#import <UIKit/UIKit.h>

@class ArtistViewController;
@class ColorButton;

NS_ASSUME_NONNULL_BEGIN

@interface DrawingView : UIView

//@property (strong, nonatomic) NSMutableArray<ColorButton *> *colorQueue;
@property (strong, nonatomic) NSMutableArray<ColorButton *> *colorQueue;
@property (assign, nonatomic) NSInteger pictureType;
@property (assign, nonatomic) float drawingSpeed;
@property (weak, nonatomic) ArtistViewController *delegate;

- (void)clearLayer;

@end

NS_ASSUME_NONNULL_END
