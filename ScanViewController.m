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

- (id)init
{
    self = [super init];
    if (self) {
        eventTableControll = [[EventDataController alloc]init];
    }
    return self;
}

- (IBAction)newEventButtonPressed:(id)sender {
    NewChangeEvantViewController *sceen = [[NewChangeEvantViewController alloc]initWithNibName:nil bundle:nil];
    sceen.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentModalViewController:sceen animated:YES];
}

- (IBAction)deleteButtonPressed:(id)sender {
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView 
 numberOfRowsInSection:(NSInteger)section {
    return [eventTableControll countOfList] + 1;  // Only one section so return the number of items in the list
}

- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];// Try to get rusable cell
    if (cell == nil)  {                            // If not possible create a new cell
        cell = [[UITableViewCell alloc] initWithFrame:CGRectMake(0,0,0,0) reuseIdentifier:@"CellIdentifier"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if(indexPath.row == 0) {                        // Get the string to display and set the value in the cell
        cell.text  = @"Add New Item...";            // The first (or zeroth cell) contains a New Item string and is used to add elements to list
    }
    else {                                          // Retreive text from datasource, the -1 accounts for the first element being hardcoded to say new Item
        NSString* itemText = [eventTableControll objectInListAtIndex:indexPath.row - 1]; 
        cell.text = itemText;
    }
    return cell;
}
// Disable reorder the first row
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return NO;
    }
    else {
        return YES;
    }
}
// Reordering of list
-  (void)tableView:(UITableView *)tableView        
moveRowAtIndexPath:(NSIndexPath *)fromIndexPath
       toIndexPath:(NSIndexPath *)toIndexPath {
    if (fromIndexPath.row  != 0) {
        NSString *item = [eventTableControll.eventListArray objectAtIndex:fromIndexPath.row-1];
        [eventTableControll.eventListArray removeObject:item];
        if (toIndexPath.row > [eventTableControll countOfList]) {
            [eventTableControll.eventListArray insertObject:item atIndex:[eventTableControll countOfList]];
        }
        else if (toIndexPath.row < 1) {
            [eventTableControll.eventListArray insertObject:item atIndex:0];
        }
        else {
            [eventTableControll.eventListArray insertObject:item atIndex:toIndexPath.row-1];
        }
        
    }
    [tableView reloadData];
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
        [eventTableControll removeDataAtIndex:indexPath.row-1];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]withRowAnimation:UITableViewRowAnimationFade];
    }
    else if(editingStyle == UITableViewCellEditingStyleInsert) {
        NSString *newItem = [NSString stringWithFormat:@"New item %d", [eventTableControll countOfList]+1];
        [eventTableControll addData:newItem];
        [tableView reloadData];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}



@end
