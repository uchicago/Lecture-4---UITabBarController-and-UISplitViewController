//
//  HomeViewController_iPhone.m
//  Lecture4-DemoA
//
//  Created by T. Andrew Binkowski on 10/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "HomeViewController_iPhone.h"
#import "GreenViewController_iPhone.h"

@implementation HomeViewController_iPhone

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // Custom initialization for the tab bar
        self.title = @"Home Screen iPhone";
        self.tabBarItem = [[UITabBarItem alloc] 
                           initWithTabBarSystemItem:UITabBarSystemItemTopRated
                           tag:1];
         
        // Create the "+" button
        // Create a share button for homework
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd 
                                                                             target:self 
                                                                             action:@selector(addStuff:)];
        self.navigationItem.rightBarButtonItem = bbi;
        //[[self navigationItem] setRightBarButtonItem:bbi];
        [bbi release];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}
- (void)addStuff:(id)sender {
    GreenViewController_iPhone *gvc = [[[GreenViewController_iPhone alloc] init] autorelease];
    [self.navigationController pushViewController:gvc animated:YES];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
