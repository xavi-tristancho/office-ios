//
//  OFSearchableTableViewController.h
//  office
//
//  Created by Xavier Tristancho Bordoy on 1/1/16.
//  Copyright © 2016 Xavier Tristancho Bordoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OFSearchableTableViewController : UITableViewController

@property (strong, nonatomic) UISearchController *searchController;
@property (strong, nonatomic) NSArray *items;
@property (strong, nonatomic) NSArray *filteredItems;

@end
