//
//  ParticipantOverviewViewController.h
//  ScanAPP
//
//  Created by Dmitriy Starodubtsev on 18.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "ScanViewController.h"
#include "ScanSceenViewController.h"

@interface ParticipantOverviewViewController : UIViewController

- (IBAction)scanButtonPressed:(id)sender;
- (IBAction)deleteButtonPressed:(id)sender;
- (IBAction)homeButtonPressed:(id)sender;
- (IBAction)goBackButtonPressed:(id)sender;

@end
