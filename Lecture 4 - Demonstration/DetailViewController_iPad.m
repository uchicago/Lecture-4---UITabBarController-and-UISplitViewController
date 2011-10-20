//
//  DetailViewController_iPad.m
//  Lecture4-DemoA
//
//  Created by T. Andrew Binkowski on 10/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController_iPad.h"
#import "AddViewController.h"

@implementation DetailViewController_iPad
@synthesize popover;
@synthesize addPopover;

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
/*******************************************************************************
 * @method          viewDidLoad
 * @abstract        <# Abstract #>
 * @description     <# Description #>
 ******************************************************************************/
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // Create the "+" add button and put it in the top right
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd 
                                                                                target:self
                                                                                action:@selector(add:)];
    [self.navigationItem setRightBarButtonItem:addButton animated:YES];

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
#pragma mark - Split view

/*******************************************************************************
 * @method          <# Method Name #>
 * @abstract        SplitViewController delegate methods
 * @description     <# Description #>
 ******************************************************************************/
- (void)splitViewController:(UISplitViewController *)splitController 
     willHideViewController:(UIViewController *)viewController 
          withBarButtonItem:(UIBarButtonItem *)barButtonItem 
       forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    //self.masterPopoverController = popoverController;
    //self.popover = popoverController;
}

/*******************************************************************************
 * @method          <# Method Name #>
 * @abstract        SplitViewController delegate methods
 * @description     <# Description #>
 ******************************************************************************/
- (void)splitViewController:(UISplitViewController *)splitController 
     willShowViewController:(UIViewController *)viewController 
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    NSLog(@"hi");
    // Called when the view is shown again in the split view
    //invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    //self.popover = nil;
}

/*******************************************************************************
 * @method          masterDetailChanged
 * @abstract        Method to receive message from the master
 * @description     <# Description #>
 ******************************************************************************/
- (void)masterDetailChanged:(id)message {
    NSLog(@"delegate");
}

/*******************************************************************************
 * @method          add:
 * @abstract        Create an indpendent popovercontroller when touched
 * @description     <# Description #>
 ******************************************************************************/
- (void)add:(id)sender {

    // Create the popover controller (if one isn't already being shown
    if (self.addPopover == nil) {
        AddViewController *avc = [[[AddViewController alloc] init] autorelease];
        self.addPopover = [[[UIPopoverController alloc] initWithContentViewController:avc] autorelease];               
    }
    
    // Show the controller
    [self.addPopover presentPopoverFromBarButtonItem:sender 
                                    permittedArrowDirections:UIPopoverArrowDirectionAny 
                                                    animated:YES];
}

@end
