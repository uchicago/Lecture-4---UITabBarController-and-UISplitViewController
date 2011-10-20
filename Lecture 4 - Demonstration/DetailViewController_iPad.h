//
//  DetailViewController_iPad.h
//  Lecture4-DemoA
//
//  Created by T. Andrew Binkowski on 10/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MasterDetailDelegate.h"

@interface DetailViewController_iPad : UIViewController 
                            <UISplitViewControllerDelegate,MasterDetailDelegate>

@property (nonatomic, retain) UIPopoverController *popover;
@property (nonatomic, retain) UIPopoverController *addPopover;
@end
