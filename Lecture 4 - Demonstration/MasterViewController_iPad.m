//
//  MasterViewController_iPad.m
//  Lecture4-DemoA
//
//  Created by T. Andrew Binkowski on 10/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MasterViewController_iPad.h"
#import "MasterDetailDelegate.h"
@implementation MasterViewController_iPad
@synthesize delegate=_delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 300.0);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}
- (void)dealloc {
    self.delegate = nil;
}

/*******************************************************************************
 * @method          masterTouchEvent:
 * @abstract        Pass a message to the detail view
 * @description     <# Description #>
 ******************************************************************************/
- (IBAction)masterTouchEvent:(id)sender {
    if (_delegate != nil) {
        [_delegate masterDetailChanged:[NSNumber numberWithInt:1]];
    }
}
@end
