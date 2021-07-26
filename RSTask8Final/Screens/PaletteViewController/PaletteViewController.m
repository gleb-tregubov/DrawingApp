//
//  PaletteViewController.m
//  RSTask8Final
//
//  Created by Gleb Tregubov on 18.07.2021.
//

#import "PaletteViewController.h"
#import "ArtistViewController.h"
#import "DrawingView.h"
#import "ColorButton.h"

@interface PaletteViewController ()

//@property (strong, nonatomic) NSMutableArray<ColorButton *> *colorQueue;

@end

@implementation PaletteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configuringColorButtons];
//    self.colorQueue = [[NSMutableArray alloc] init];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    self.view.backgroundColor = UIColor.whiteColor;
}

- (void)configuringColorButtons {
    ColorButton *redColorButton = [[ColorButton alloc] initWithFrame:CGRectMake(17.0, 92.0, 40.0, 40.0) Color:[UIColor colorNamed:@"rsRed"] andColorTypeEnum:colorTypeRed];
    
    ColorButton *blueColorButton = [[ColorButton alloc] initWithFrame:CGRectMake(77.0, 92.0, 40.0, 40.0) Color:[UIColor colorNamed:@"rsBlue"] andColorTypeEnum:colorTypeBlue];
    
    ColorButton *greenColorButton = [[ColorButton alloc] initWithFrame:CGRectMake(137.0, 92.0, 40.0, 40.0) Color:[UIColor colorNamed:@"rsGreen"] andColorTypeEnum:colorTypeGreen];
                                     
    ColorButton *grayColorButton = [[ColorButton alloc] initWithFrame:CGRectMake(197.0,  92.0, 40.0, 40.0) Color:[UIColor colorNamed:@"rsGray"] andColorTypeEnum:colorTypeGray];
    
    ColorButton *purpleColorButton = [[ColorButton alloc] initWithFrame:CGRectMake(257.0, 92.0, 40.0, 40.0) Color:[UIColor colorNamed:@"rsPurple"] andColorTypeEnum:colorTypePurple];
    
    ColorButton *orangeColorButton = [[ColorButton alloc] initWithFrame:CGRectMake(317.0, 92.0, 40.0, 40.0) Color:[UIColor colorNamed:@"rsOrange"] andColorTypeEnum:colorTypeOrange];
    
    
    
    
    ColorButton *yellowColorButton = [[ColorButton alloc] initWithFrame:CGRectMake(17.0, 152.0, 40.0, 40.0) Color:[UIColor colorNamed:@"rsYellow"] andColorTypeEnum:colorTypeYellow];
    
    ColorButton *lightBlueColorButton = [[ColorButton alloc] initWithFrame:CGRectMake(77.0, 152.0, 40.0, 40.0) Color:[UIColor colorNamed:@"rsLightBlue"] andColorTypeEnum:colorTypeLightBlue];
    
    ColorButton *pinkColorButton = [[ColorButton alloc] initWithFrame:CGRectMake(137.0, 152.0, 40.0, 40.0) Color:[UIColor colorNamed:@"rsPink"] andColorTypeEnum:colorTypePink];
    
    ColorButton *blackColorButton = [[ColorButton alloc] initWithFrame:CGRectMake(197.0, 152.0, 40.0, 40.0) Color:[UIColor colorNamed:@"rsBlack"] andColorTypeEnum:colorTypeBlack];
    
    ColorButton *darkGreenColorButton = [[ColorButton alloc] initWithFrame:CGRectMake(257.0, 152.0, 40.0, 40.0) Color:[UIColor colorNamed:@"rsDarkGreen"] andColorTypeEnum:colorTypeDarkGreen];
    
    ColorButton *brownColorButton = [[ColorButton alloc] initWithFrame:CGRectMake(317.0, 152.0, 40.0, 40.0) Color:[UIColor colorNamed:@"rsBrown"] andColorTypeEnum:colorTypeBrown];
    
    [self.view addSubview:redColorButton];
    [self.view addSubview:blueColorButton];
    [self.view addSubview:greenColorButton];
    [self.view addSubview:grayColorButton];
    [self.view addSubview:purpleColorButton];
    [self.view addSubview:orangeColorButton];
    
    redColorButton.delegate = self;
    blueColorButton.delegate = self;
    greenColorButton.delegate = self;
    grayColorButton.delegate = self;
    purpleColorButton.delegate = self;
    orangeColorButton.delegate = self;
    
    [self.view addSubview:yellowColorButton];
    [self.view addSubview:lightBlueColorButton];
    [self.view addSubview:pinkColorButton];
    [self.view addSubview:blackColorButton];
    [self.view addSubview:darkGreenColorButton];
    [self.view addSubview:brownColorButton];
    
    yellowColorButton.delegate = self;
    lightBlueColorButton.delegate = self;
    pinkColorButton.delegate = self;
    blackColorButton.delegate = self;
    darkGreenColorButton.delegate = self;
    brownColorButton.delegate = self;
}

// v09d
- (void)colorTapped:(ColorButton *)sender {
    
    sender.backgroundColor = [UIColor colorWithCGColor:[sender.layer sublayers][0].backgroundColor];
    self.view.backgroundColor = [UIColor colorWithCGColor:[sender.layer sublayers][0].backgroundColor];
    
    
    if ([self.drawingView.colorQueue containsObject:sender]) {
        NSLog(@"contains");
        [self.drawingView.colorQueue removeObject:sender];
        sender.backgroundColor = UIColor.whiteColor;
        self.view.backgroundColor = UIColor.whiteColor;
    } else if (self.drawingView.colorQueue.count == 3) {
        self.drawingView.colorQueue[0].backgroundColor = UIColor.whiteColor;
        [self.drawingView.colorQueue removeObjectAtIndex:0];
        [self.drawingView.colorQueue addObject:sender];
    } else if (self.drawingView.colorQueue.count < 3) {
        [self.drawingView.colorQueue addObject:sender];
    }
//    [self.colorQueue addObject:sender];
    NSLog(@"---");
//    NSLog(@"%@", self.drawingView.colorQueue);
    for (ColorButton* item in self.drawingView.colorQueue) {
//        NSString* colorTypeString = nil;
//        switch (item.colorType) {
//            case colorTypePink:
//                colorTypeString = @"pink"
//                break;
//
//            default:
//                break;
//        }
        NSLog(@"%u", item.colorType);
    }
}


@end
