//
//  HalfScreenSuperViewController.m
//  RSTask8Final
//
//  Created by Gleb Tregubov on 18.07.2021.
//

#import "HalfScreenSuperViewController.h"
#import "ArtistButton.h"
//#import "ArtistViewController.h"

@interface HalfScreenSuperViewController ()

@end

@implementation HalfScreenSuperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    // tint color
    
    [self configuringLayer];
    [self configuringSaveButton];
    
}

- (void)configuringLayer {
    self.view.layer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMaxXMinYCorner;
    self.view.layer.shadowOffset = CGSizeMake(10.0, 10.0);
    self.view.layer.shadowRadius = 20.0;
    self.view.layer.shadowOpacity = 0.5;
    self.view.layer.cornerRadius = 40.0;
}

- (void)configuringSaveButton {
    ArtistButton *saveButton = [[ArtistButton alloc] initWithFrame:CGRectMake(250.0, 20.0, 85.0, 32.0) andTitle:@"Save"];
    
    [saveButton addTarget:self action:@selector(saveButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:saveButton];
}

- (void)saveButtonTapped {
    [self willMoveToParentViewController:nil];
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
//    [(ArtistViewController *)self.parentViewController showHalfScreenChildVC:self];
}

@end
