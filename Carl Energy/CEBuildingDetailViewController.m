//
//  CEBuildingDetailViewController.m
//  Carl Energy
//
//  Created by Michelle Chen on 5/10/14.
//  Copyright (c) 2014 Carleton College. All rights reserved.
//

#import "CEBuildingDetailViewController.h"
#import "CorePlot-CocoaTouch.h"


@interface CEBuildingDetailViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UILabel *dummyLabel;
- (IBAction)timeChanged:(UISegmentedControl *)sender;

@end

@implementation CEBuildingDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CEDataRetriever *retriever = [[CEDataRetriever alloc] init];
    [retriever setDelegate:self];
    [self makeLineGraph:0];
    self.dummyLabel.text = @"day";
}

-(IBAction)timeChanged:(UISegmentedControl *)sender
{
    // Should probably figure out a better way to do this than passing the index
    [self makeLineGraph:self.segmentedControl.selectedSegmentIndex];
    switch (self.segmentedControl.selectedSegmentIndex)
    {
        case 0:
            self.dummyLabel.text = @"day";
            break;
        case 1:
            self.dummyLabel.text = @"week";
            break;
        case 2:
            self.dummyLabel.text = @"month";
            break;
        case 3:
            self.dummyLabel.text = @"year";
            break;
        default:
            break;
    }
}

-(void)makeLineGraph:(NSInteger)timeframeIndex
{
    // make a graph, maybe in an embedded view controller
    CPTXYGraph *graph = [[CPTXYGraph alloc] init];
    graph.title = @"Electricity";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
