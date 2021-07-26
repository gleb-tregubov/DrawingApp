//
//  DrawingsViewController.h
//  RSTask8Final
//
//  Created by Gleb Tregubov on 18.07.2021.
//

#import <UIKit/UIKit.h>
@class DrawingView;
@class DrawingButton;

NS_ASSUME_NONNULL_BEGIN

@interface DrawingsViewController : UIViewController

@property (strong, nonatomic) DrawingView * drawingView;

@property (strong, nonatomic) DrawingButton * planetButton;
@property (strong, nonatomic) DrawingButton * headButton;
@property (strong, nonatomic) DrawingButton * treeButton;
@property (strong, nonatomic) DrawingButton * landscapeButton;

@end

NS_ASSUME_NONNULL_END
