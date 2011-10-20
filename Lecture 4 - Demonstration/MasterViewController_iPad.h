//
//  MasterViewController_iPad.h
//  Lecture4-DemoA
//
//  Created by T. Andrew Binkowski on 10/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MasterDetailDelegate.h"

@interface MasterViewController_iPad : UIViewController {
    id<MasterDetailDelegate> _delegate;
}
@property (nonatomic, assign) id <MasterDetailDelegate> delegate;
- (IBAction)masterTouchEvent:(id)sender;
@end
