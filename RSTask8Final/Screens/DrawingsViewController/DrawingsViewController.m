//
//  DrawingsViewController.m
//  RSTask8Final
//
//  Created by Gleb Tregubov on 18.07.2021.


#import "DrawingsViewController.h"
#import "DrawingButton.h"
//#import "DrawingButton+PictureTypeEnum.h"
#import "ArtistViewController.h"
#import "DrawingView.h"

@interface DrawingsViewController ()

@property (strong, nonatomic) DrawingButton* currentButton;

@end

@implementation DrawingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.view.tintColor = [UIColor colorNamed:@"Light Green Sea"];
    
    [self configuringDrawingButtons];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self setupNavigationItems];
    [self.currentButton setHighlightedState];

}

- (void)setupNavigationItems {
    self.navigationItem.title = @"Drawings";
//    self.navigationController.navigationBar.tintColor = [UIColor colorNamed:@"Light Green Sea"];
}

- (void)configuringDrawingButtons {
    
    self.planetButton = [[DrawingButton alloc] initWithFrame:CGRectMake(88.0, 114.0, 200.0, 40.0) title:@"Planet" andPictureTypeEnum:pictureTypePlanet];
    
    self.headButton = [[DrawingButton alloc] initWithFrame:CGRectMake(88.0, 169.0, 200.0, 40.0) title:@"Head" andPictureTypeEnum:pictureTypeHead];
    [self.headButton setHighlightedState];
    
    self.treeButton = [[DrawingButton alloc] initWithFrame:CGRectMake(88.0, 224.0, 200.0, 40.0) title:@"Tree" andPictureTypeEnum:pictureTypeTree];
    
    self.landscapeButton = [[DrawingButton alloc] initWithFrame:CGRectMake(88.0, 279.0, 200.0, 40.0) title:@"Landscape" andPictureTypeEnum:pictureTypeLandscape];
    
    self.planetButton.delegate = self;
    self.headButton.delegate = self;
    self.treeButton.delegate = self;
    self.landscapeButton.delegate = self;
    
    [self.view addSubview:self.planetButton];
    [self.view addSubview:self.headButton];
    [self.view addSubview:self.treeButton];
    [self.view addSubview:self.landscapeButton];
}



-(void)drawingButtonTapped:(DrawingButton *)sender {
    [self.planetButton setDefaultState];
    [self.headButton setDefaultState];
    [self.treeButton setDefaultState];
    [self.landscapeButton setDefaultState];
    
    [sender setHighlightedState];
    self.currentButton = sender;
    NSLog(@"SNDER: %@", sender);
    NSLog(@"sender picture type with click %ld", (long)sender.pictureType);
    self.drawingView.pictureType = (NSInteger)sender.pictureType;
    [self.navigationController popToRootViewControllerAnimated:YES];
    NSLog(@"picture type after equaling to drawingView --- %ld", (long) self.drawingView.pictureType);
}



@end
