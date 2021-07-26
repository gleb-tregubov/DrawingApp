//
//  ArtistViewController.m
//  RSTask8Final
//
//  Created by Gleb Tregubov on 18.07.2021.
//

#import "ArtistViewController.h"
#import "PaletteViewController.h"
//#import "TimerViewController.h"
#import "DrawingsViewController.h"
//#import "RSTask8Final-Bridging-Header.h"

#import "DrawingApp-Swift.h"

#import "DrawingView.h"

//@class PaletteViewController;

#import "ArtistButton.h"
#import "DrawingView.h"
#import "DrawingButton.h"
#import "DrawingButton+PictureTypeEnum.h"

@interface ArtistViewController ()

enum state {
    stateIdle,
    stateDone,
    stateDraw
};
typedef enum state state;

@property (strong, nonatomic) DrawingsViewController *drawingVC;
@property (strong, nonatomic) PaletteViewController *paletteChildVC;
@property (strong, nonatomic) TimerViewController *timerChildVC;
@property (strong, nonatomic) DrawingView *drawingView;

@property (strong, nonatomic) ArtistButton* shareButton;
@property (strong, nonatomic) ArtistButton* drawButton;
@property (strong, nonatomic) ArtistButton* paletteButton;
@property (strong, nonatomic) ArtistButton* timerButton;
@property (strong, nonatomic) UIBarButtonItem* drawingsRightBarButton;

@property (assign, nonatomic) state currentState;
@property (strong, nonatomic) NSTimer * timer;


@end

@implementation ArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.view.tintColor = [UIColor colorNamed:@"Light Green Sea"];
    self.drawingVC = [DrawingsViewController new];
    self.paletteChildVC = [PaletteViewController new];
    self.timerChildVC = [TimerViewController new];
    // Создаеть drawingView и прокинуть ее в остальные контроллер
    
    [self configuringArtistButtons];
    [self configuringDrawingView];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self setupNavigationItems];
    
}

// configuring navigation bar items
- (void)setupNavigationItems {
    self.navigationItem.title = @"Artist";
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{
        NSFontAttributeName:[UIFont fontWithName:@"Montserrat-Regular" size:17.0f]
    }];
    
    self.drawingsRightBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Drawings" style:UIBarButtonItemStylePlain target:self action:@selector(drawingsRightBarButtonTapped)];
    
    
    self.navigationItem.rightBarButtonItem = self.drawingsRightBarButton;
    
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{
        NSFontAttributeName:[UIFont fontWithName:@"Montserrat-Regular" size:17.0f] }
                                                          forState:UIControlStateNormal];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{
        NSFontAttributeName:[UIFont fontWithName:@"Montserrat-Regular" size:17.0f] }
                                                          forState:UIControlStateHighlighted];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{
        NSFontAttributeName:[UIFont fontWithName:@"Montserrat-Regular" size:17.0f] }
                                                          forState:UIControlStateDisabled];
    self.navigationController.navigationBar.tintColor = [UIColor colorNamed:@"Light Green Sea"];
//    self.navigationItem.rightBarButtonItem.tintColor = [UIColor colorNamed:@"Light Green Sea"];
}

// drawing right bar button tap selector
- (void)drawingsRightBarButtonTapped {
    [self.navigationController pushViewController:self.drawingVC animated:YES];
}

- (void)configuringDrawingView {
    DrawingView *drawingView = [[DrawingView alloc] initWithFrame:CGRectMake(38.0, 104.0, 300.0, 300.0)];
    
    self.drawingView = drawingView;
    
    self.drawingView.delegate = self;
    self.paletteChildVC.drawingView = self.drawingView;
    self.drawingVC.drawingView = self.drawingView;
    self.timerChildVC.drawingView = self.drawingView;
    
    [self.view addSubview:drawingView];
}


- (void)configuringArtistButtons {
    
    self.paletteButton = [[ArtistButton alloc] initWithFrame:CGRectMake(20.0, 454.0, 163.0, 32.0) andTitle:@"Open Palette"];
    self.drawButton = [[ArtistButton alloc] initWithFrame:CGRectMake(243.0, 454.0, 101.0, 32.0) andTitle:@"Draw"];
    self.timerButton = [[ArtistButton alloc] initWithFrame:CGRectMake(20.0, 506.0, 151.0, 32.0) andTitle:@"Open Timer"];
    self.shareButton = [[ArtistButton alloc] initWithFrame:CGRectMake(239.0, 506.0, 95.0, 32.0) andTitle:@"Share"];
    [self.shareButton setDisabledState];
    
    [self.paletteButton addTarget:self action:@selector(openPalette:) forControlEvents:UIControlEventTouchUpInside];
    [self.drawButton addTarget:self action:@selector(drawPicture:) forControlEvents:UIControlEventTouchUpInside];
    [self.timerButton addTarget:self action:@selector(openTimer:) forControlEvents:UIControlEventTouchUpInside];
    [self.shareButton addTarget:self action:@selector(sharePicture:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.paletteButton];
    [self.view addSubview:self.drawButton];
    [self.view addSubview:self.timerButton];
    [self.view addSubview:self.shareButton];
    
}

- (void)setIdleState {
    self.currentState = stateIdle;
    [self.paletteButton setDefaultState];
    [self.drawButton setDefaultState];
    [self.timerButton setDefaultState];
    [self.shareButton setDisabledState];
    
    self.drawingsRightBarButton.enabled = YES;
    self.drawingsRightBarButton.customView.alpha = 1;
    
}

- (void)setDrawState {
    self.currentState = stateDraw;
    [self.paletteButton setDisabledState];
    [self.timerButton setDisabledState];
    [self.drawButton setDisabledState];
    [self.shareButton setDisabledState];
    
    self.drawingsRightBarButton.enabled = NO;
    self.drawingsRightBarButton.customView.alpha = 0.5;
    
    NSLog(@"Alpha");
}

- (void)setDoneState {
    self.currentState = stateDone;
    [self.paletteButton setDisabledState];
    [self.timerButton setDisabledState];
    [self.drawButton setDefaultState];
    [self.shareButton setDefaultState];
    
    self.drawingsRightBarButton.enabled = YES;
    self.drawingsRightBarButton.customView.alpha = 1;
    
}

- (void)showHalfScreenChildVC:(UIViewController *)controller {
//    NSLog(@"111");
    [self addChildViewController:controller];
    controller.view.frame = CGRectMake(0.0, self.view.bounds.size.height / 2, self.view.bounds.size.width, self.view.bounds.size.height / 2);
    [self.view addSubview:controller.view];
    [controller didMoveToParentViewController:self];
}

- (void)openPalette:(ArtistButton *)sender {
    [self showHalfScreenChildVC:self.paletteChildVC];
}

- (void)drawPicture:(ArtistButton *)sender {
    if (self.currentState == stateIdle) {
        [self setDrawState];
        NSLog(@"123123");
        if (self.drawingView.pictureType == 0) {
            self.drawingView.pictureType = 2; // Drawing Head in via Starting Case
    //        [self.drawingVC.headButton setActive];
        }
        [self.drawingView setNeedsDisplay];
        [self.timer invalidate];
        [self setDoneState];
        [self.drawButton setTitle:@"Reset" forState:UIControlStateNormal];
//        [self.drawButton setNeedsDisplay];
    } else if (self.currentState == stateDone) {
        [self setIdleState];
//        [self.timer invalidate];
        [self.drawButton setTitle:@"Draw" forState:UIControlStateNormal];
        [self.drawingView clearLayer];
//        [self.drawingView.drawingLayer removeFromSuperlayer];
//        [self.drawingView setNeedsDisplay];
        
    }
}

- (void)justDrawing {
    float interval = 1.0/60.0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:interval target:self.drawingView selector:@selector(changeStrokeEnd) userInfo:nil repeats:true];
}

- (void)openTimer:(ArtistButton *)sender {
    [self showHalfScreenChildVC:self.timerChildVC];
}

- (void)sharePicture:(ArtistButton *)sender {
    CGRect rect = [self.drawingView bounds];
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.drawingView.layer renderInContext:context];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSArray *activityItems = @[img];
    UIActivityViewController *activityViewControntroller = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    activityViewControntroller.excludedActivityTypes = @[];
    activityViewControntroller.popoverPresentationController.sourceView = self.view;
    activityViewControntroller.popoverPresentationController.sourceRect = CGRectMake(self.view.bounds.size.width/2, self.view.bounds.size.height/4, 0, 0);
    [self presentViewController:activityViewControntroller animated:YES completion:nil];
}




















//if (self.isPaletteChildViewControllerAdded) {
//    self.isPaletteChildViewControllerAdded = NO;
//
//    [self.paletteChildVC willMoveToParentViewController:nil];
//    [self.paletteChildVC.view removeFromSuperview];
//    [self.paletteChildVC removeFromParentViewController];
//} else {
//    self.isPaletteChildViewControllerAdded = YES;
//
//    self.paletteChildVC = [[PaletteViewController alloc] initWithNibName:@"PaletteViewController" bundle:nil];
//    [self addChildViewController:self.paletteChildVC];
//
//    self.paletteChildVC.view.frame = CGRectMake(0.0, self.view.bounds.size.height / 2, self.view.bounds.size.width, self.view.bounds.size.height / 2);
//
//    [self.view addSubview:self.paletteChildVC.view];
//    [self.paletteChildVC didMoveToParentViewController:self];
//}

@end
