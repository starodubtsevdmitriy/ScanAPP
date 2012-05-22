//
//  SyncViewController.m
//  ScanAPP
//
//  Created by Dmitriy Starodubtsev on 18.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SyncViewController.h"

@interface SyncViewController ()

@end

@implementation SyncViewController

- (IBAction)homeButtonPressed:(id)sender {
    ScanViewController *sceen = [[ScanViewController alloc]initWithNibName:nil bundle:nil];
    sceen.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentModalViewController:sceen animated:YES];
}

- (IBAction)syncProtocolButtonPressed:(id)sender {
    SyncProtocolViewController *sceen = [[SyncProtocolViewController alloc]initWithNibName:nil bundle:nil];
    sceen.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentModalViewController:sceen animated:YES];
}

- (IBAction)goBackButtonPressed:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
