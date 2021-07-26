//
//  DrawingsButton.h
//  RSTask8Final
//
//  Created by Gleb Tregubov on 19.07.2021.
//

#import "ArtistButton.h"
#import "DrawingsViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface DrawingButton : ArtistButton

typedef NS_ENUM(NSInteger, pictureType) {
    pictureTypePlanet = 1,
    pictureTypeHead = 2,
    pictureTypeTree = 3,
    pictureTypeLandscape = 4,
};

@property (strong, nonatomic) DrawingsViewController *delegate;
@property (assign, nonatomic) pictureType pictureType;

-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title andPictureTypeEnum:(pictureType)pictureType;

@end

NS_ASSUME_NONNULL_END
