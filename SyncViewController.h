//
//  SyncViewController.h
//  ScanAPP
//
//  Created by Dmitriy Starodubtsev on 18.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScanViewController.h"
#import "SyncProtocolViewController.h"

@interface SyncViewController : UIViewController

- (IBAction)homeButtonPressed:(id)sender;
- (IBAction)syncProtocolButtonPressed:(id)sender;
- (IBAction)goBackButtonPressed:(id)sender;

@end
