//
//  LSIVersionsTableTableViewController.m
//  OSXVersions
//
//  Created by Julian A. Fordyce on 3/30/19.
//  Copyright © 2019 Julian A. Fordyce. All rights reserved.
//

#import "LSIVersionsTableTableViewController.h"
#import "LSIVersionsController.h"
#import "LSIOSXVersion.h"

@interface LSIVersionsTableTableViewController ()

@end

@implementation LSIVersionsTableTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LSIVersionsController *controller = [LSIVersionsController sharedController];
    [controller fetchVersionsWithCompletionBlock:^(NSError *error) {
        if (error == nil) {
            // DispatchQueue.main.async { self.tableView.reloadData() }
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        }
}];

}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[LSIVersionsController sharedController] versions] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VersionCell" forIndexPath:indexPath];
    
    NSArray *versions = [[LSIVersionsController sharedController] versions];
    LSIOSXVersion *version = versions[indexPath.row];
    cell.textLabel.text = version.codename;
    cell.detailTextLabel.text = version.releaseDate;
    
    return cell;
}


@end
