//
//  ColorButton.h
//  RSTask8Final
//
//  Created by Gleb Tregubov on 18.07.2021.
//

#import <UIKit/UIKit.h>
@class PaletteViewController;

NS_ASSUME_NONNULL_BEGIN

@interface ColorButton : UIButton // ИЗМЕНИЛИ НА UIView

enum colorType {
    colorTypeBlack = 0,
    colorTypeBlue = 1,
    colorTypeBrown = 2,
    colorTypeDarkGreen = 3,
    colorTypeGray = 4,
    colorTypeGreen = 5,
    colorTypeLightBlue = 6,
    colorTypeOrange = 7,
    colorTypePink = 8,
    colorTypePurple = 9,
    colorTypeRed = 10,
    colorTypeYellow = 11,
};
typedef enum colorType colorType;

// Можем удерживать STRONG, потому что сам делегат (Палет контроллер) не будет ссылаться на НАШУ колор кнопку вообще, будет только обрабатывать ивент тача
@property (weak, nonatomic) PaletteViewController *delegate;
@property (assign, nonatomic) colorType colorType;

-(instancetype)initWithFrame:(CGRect)frame Color:(UIColor *)color andColorTypeEnum:(colorType)colorType;

//-(instancetype)initWithColorType:(colorType)colorType;

@end

NS_ASSUME_NONNULL_END
