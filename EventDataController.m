//
//  EventDataController.m
//  ScanAPP
//
//  Created by Dmitriy Starodubtsev on 19.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EventDataController.h"
#import "ScanAppDelegate.h"

@implementation EventDataController

@synthesize managedObjectContext;  
@synthesize eventListArray = _eventListArray;
@synthesize scanAppDelegate = _scanAppDelegate;

- (id)init
{
    self = [super init];
    if (self) {
        self.eventListArray = [[NSMutableArray alloc]init];
        self.scanAppDelegate = [[ScanAppDelegate alloc]init];
    }
    return self;
}
+ (NSString *) getCurrentDate {
    NSDate* date = [NSDate date];
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init] ;//Create the dateformatter object
    [formatter setDateFormat:@"dd.MM.yyyy"];                     //Set the required date format
    NSString* str = [formatter stringFromDate:date];             //Get the string date
    return str;
}

- (void)saveDataFile:(NSMutableArray *)eventArray {
    
    if (self.scanAppDelegate.managedObjectContext == nil) {
        NSLog(@"NSManagedObjectContext is nil");
        NSManagedObjectModel *managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
        NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:
                                                     self.scanAppDelegate.managedObjectModel];
        if (coordinator != nil) {
             managedObjectContext = [[NSManagedObjectContext alloc] init];
             [managedObjectContext setPersistentStoreCoordinator: coordinator];
        }
    }
    
	event = (Event *)[NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:self.scanAppDelegate.managedObjectContext];
	[event setEventName:[EventDataController getCurrentDate]];
    [self.scanAppDelegate.managedObjectContext save:nil];
}

- (unsigned)countOfList {
    return [_eventListArray count];
}

- (id)objectInListAtIndex:(unsigned)theIndex {
    Event * event = [self.eventListArray objectAtIndex:theIndex];
    return  [event eventName];
}

- (void)removeDataAtIndex:(unsigned)theIndex {
    [self.eventListArray removeObjectAtIndex:theIndex];
}

- (void)addData:(NSString*)data {
    [self.eventListArray addObject:data];
}

- (void)setList:(NSMutableArray *)newList {
    if (eventListArray != newList) {
        eventListArray = [newList mutableCopy];
    }
}

@end
