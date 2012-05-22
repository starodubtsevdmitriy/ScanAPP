//
//  EventDataController.h
//  ScanAPP
//
//  Created by Dmitriy Starodubtsev on 19.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"
#include "ScanAppDelegate.h"

@interface EventDataController : NSObject <UIApplicationDelegate> {
    Event *event;
    NSMutableArray * eventListArray;
    NSManagedObjectContext *managedObjectContext;  
}   

@property (nonatomic, strong) NSMutableArray *eventListArray;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) ScanAppDelegate *scanAppDelegate;
 
- (unsigned)countOfList; // Returns number of elements in list    
- (id)objectInListAtIndex:(unsigned)theIndex; // Returns object at given index
- (void)addData:(NSString *)data; // Adds data to the list 
- (void)removeDataAtIndex:(unsigned)theIndex; // Remove data from the list
- (void) fetchRecords;
- (void)saveDataFile:(NSMutableArray *)eventArray;

@end
