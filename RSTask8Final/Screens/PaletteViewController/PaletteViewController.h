//
//  PaletteViewController.h
//  RSTask8Final
//
//  Created by Gleb Tregubov on 18.07.2021.
//

#import <UIKit/UIKit.h>
#import "HalfScreenSuperViewController.h"
//@class ColorButton;
@class DrawingView;

NS_ASSUME_NONNULL_BEGIN

@interface PaletteViewController : HalfScreenSuperViewController

//@property (strong, nonatomic) NSMutableArray<ColorButton *> *colorQueue;
@property (strong, nonatomic) DrawingView * drawingView;

@end

NS_ASSUME_NONNULL_END
