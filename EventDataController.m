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
@synthesize managedObjectContext = _managedObjectContex;
@synthesize eventListArray = _eventListArray;  

- (id)init
{
    self = [super init];
    if (self) {
        _eventListArray = [[NSMutableArray alloc]init];
        _managedObjectContex = [[NSManagedObjectContext alloc]init];
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
    
    if (self.managedObjectContext == nil) {
        NSLog(@"NSManagedObjectContext is nil");
        NSManagedObjectModel *managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
        NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:
                                                     managedObjectModel];
        if (coordinator != nil) {
            managedObjectContext = [[NSManagedObjectContext alloc] init];
            [managedObjectContext setPersistentStoreCoordinator: coordinator];
        }
    }    
    event = (Event *)[NSEntityDescription insertNewObjectForEntityForName:@"Event" 
                                                   inManagedObjectContext:managedObjectContext];
	[event setCode:[EventDataController getCurrentDate]];
	
	//NSError *error;
	//if (![managedObjectContext save:&error]) {
		// This is a serious error saying the record could not be saved.
		// Advise the user to restart the application
	//}
    [eventListArray insertObject:event atIndex:0];
}

- (unsigned)countOfList {
    return [eventListArray count];
}

- (id)objectInListAtIndex:(unsigned)theIndex {
    return [eventListArray objectAtIndex:theIndex];
}

- (void)removeDataAtIndex:(unsigned)theIndex {
    [eventListArray removeObjectAtIndex:theIndex];
}

- (void)addData:(NSString*)data {
    [eventListArray addObject:data];
}

- (void)setList:(NSMutableArray *)newList {
    if (eventListArray != newList) {
        eventListArray = [newList mutableCopy];
    }
}

@end
