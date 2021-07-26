//
//  ArtistButton.h
//  RSTask8Final
//
//  Created by Gleb Tregubov on 18.07.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ArtistButton : UIButton

- (instancetype)initWithFrame:(CGRect)frame andTitle:(NSString *)title;

- (void)setHighlightedState;
- (void)setDefaultState;
- (void)setDisabledState;

@end

NS_ASSUME_NONNULL_END
