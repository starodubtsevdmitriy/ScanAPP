//
//  ScanViewController.h
//  ScanAPP
//
//  Created by Dmitriy Starodubtsev on 18.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewChangeEvantViewController.h"
#import "EventDetailViewController.h"
#import "EventDataController.h"

@interface ScanViewController : UIViewController {
    EventDataController *eventTableControll;
    IBOutlet UITableView *eventOverVievList;
}

- (IBAction)newEventButtonPressed:(id)sender;
- (IBAction)deleteButtonPressed:(id)sender;

@end
