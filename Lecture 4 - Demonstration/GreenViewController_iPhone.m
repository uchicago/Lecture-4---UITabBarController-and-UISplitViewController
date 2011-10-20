//
//  GreenViewController_iPhone.m
//  Lecture4-DemoA
//
//  Created by T. Andrew Binkowski on 10/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "GreenViewController_iPhone.h"

@implementation GreenViewController_iPhone

/*******************************************************************************
 * @method
 * @abstract
 * @description
 ******************************************************************************/
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Green View Controller";
        self.tabBarItem = [[UITabBarItem alloc] 
                           initWithTitle:@"Custom text"
                                  image:[UIImage imageNamed:@"GoldStar"]
                                    tag:3];
        self.tabBarItem = [[UITabBarItem alloc] 
                           initWithTabBarSystemItem:UITabBarSystemItemHistory
                                                tag:3];
        [self setTabBarBadge:@"Ding"];
    }
    return self;
}

/*******************************************************************************
 * @method          setTabBarBadge
 * @abstract        <# Abstract #>
 * @description     <# Description #>
 ******************************************************************************/
- (void)setTabBarBadge:(NSString*)theString {
    self.tabBarItem.badgeValue = theString;
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
