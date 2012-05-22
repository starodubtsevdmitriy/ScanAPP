//
//  ScanViewController.m
//  ScanAPP
//
//  Created by Dmitriy Starodubtsev on 18.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ScanViewController.h"

@interface ScanViewController ()

@end

@implementation ScanViewController

@synthesize eventTableControll = _eventTableControll;
@synthesize scanAppDelegate = _scanAppDelegate;

- (void)viewDidLoad {
    _scanAppDelegate = [[ScanAppDelegate alloc]init];
    _eventTableControll = [[EventDataController alloc]init];
    eventOverVievList = [[UITableView alloc]init];
    [self fetchRecords];
    [super viewDidLoad];
}

- (IBAction)newEventButtonPressed:(id)sender {
    NewChangeEvantViewController *sceen = [[NewChangeEvantViewController alloc]initWithNibName:nil bundle:nil];
    sceen.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentModalViewController:sceen animated:YES];
}

- (IBAction)deleteButtonPressed:(id)sender {
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return  1;
}

- (NSInteger)tableView:(UITableView *)tableView 
 numberOfRowsInSection:(NSInteger)section {
   NSInteger counter = [self.eventTableControll countOfList]; 
    return counter;// Only one section so return the number of items in the list
}

- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero];
    }
    // Set up the cell... 
    
    cell.font = [UIFont systemFontOfSize:14];
    NSString* itemText = [self.eventTableControll objectInListAtIndex:indexPath.row];
    cell.text = itemText;
    
    return cell;

}
// Set style of cells      
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView 
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellAccessoryDetailDisclosureButton;
}
// Add and delete cells
- (void) tableView:(UITableView *)tableView 
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle 
 forRowAtIndexPath:(NSIndexPath *)indexPath {       // If row is deleted, remove it from the list. 
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.eventTableControll removeDataAtIndex:indexPath.row-1];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]withRowAnimation:UITableViewRowAnimationFade];
    }
    else if(editingStyle == UITableViewCellEditingStyleInsert) {
        NSString *newItem = [NSString stringWithFormat:@"New item %d", [self.eventTableControll countOfList]+1];
        [self.eventTableControll addData:newItem];
        [tableView reloadData];
    }
}

- (void)fetchRecords {
	
	// Define our table/entity to use
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"Event" inManagedObjectContext: self.scanAppDelegate.managedObjectContext];
	
	// Setup the fetch request
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	[request setEntity:entity];
	
	// Define how we will sort the records
	NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"code" ascending:NO];
	NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
	
	[request setSortDescriptors:sortDescriptors];
	
	// Fetch the records and handle an error
	NSError *error;
	NSMutableArray *mutableFetchResults = [[self.scanAppDelegate.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
	
	if (!mutableFetchResults) {
		// Handle the error.
		// This is a serious error and should advise the user to restart the application
	}
	
	// Save our fetched data to an array
	[self.eventTableControll setEventListArray: mutableFetchResults];
	
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}



@end
