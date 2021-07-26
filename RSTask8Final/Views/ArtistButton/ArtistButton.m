//
//  ArtistButton.m
//  RSTask8Final
//
//  Created by Gleb Tregubov on 18.07.2021.
//

#import "ArtistButton.h"

@implementation ArtistButton

- (instancetype)initWithFrame:(CGRect)frame andTitle:(NSString *)title {
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitle:title forState:UIControlStateNormal];
        
        [self configurinArtistButton];
        
    }
    return self;
}

- (void)configurinArtistButton {
    [self setTitleColor:[UIColor colorNamed:@"Light Green Sea"] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont fontWithName:@"Montserrat-Medium" size:18.0];
    
    self.backgroundColor = UIColor.whiteColor;
    self.layer.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.25].CGColor;
    self.layer.shadowRadius = 2;
    self.layer.shadowOffset = CGSizeMake(0.0, 0.0);
    self.layer.shadowOpacity = 1;
    self.contentEdgeInsets = UIEdgeInsetsMake(5, 21, 5, 21);
    self.layer.cornerRadius = 10;
}

- (void)setHighlightedState {
    self.layer.shadowColor = [UIColor colorNamed:@"Light Green Sea"].CGColor;
    self.layer.shadowRadius = 4.0;
    self.alpha = 1.0;
    [self setEnabled:YES];
}

- (void)setDefaultState {
    self.layer.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.25].CGColor;
    self.layer.shadowRadius = 2.0;
    self.alpha = 1.0;
    [self setEnabled:YES];
}

- (void)setDisabledState {
    self.layer.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.25].CGColor;
    self.layer.shadowRadius = 2.0;
    self.alpha = 0.5;
    self.enabled = NO;
}



- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    
    if (highlighted) {
        [self setHighlightedState];
        
    } else if (self.isEnabled) {
        [self setDefaultState];
    } else {
        [self setDisabledState];
    }
}



@end
