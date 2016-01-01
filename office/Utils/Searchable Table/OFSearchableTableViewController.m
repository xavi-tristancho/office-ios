//
//  OFSearchableTableViewController.m
//  office
//
//  Created by Xavier Tristancho Bordoy on 1/1/16.
//  Copyright © 2016 Xavier Tristancho Bordoy. All rights reserved.
//

#import "OFSearchableTableViewController.h"

@interface OFSearchableTableViewController () <UITableViewDataSource, UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating, UITableViewDelegate>

@end

@implementation OFSearchableTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setUpSearchController];
}

- (void)setUpSearchController
{
    _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    _searchController.searchResultsUpdater = self;
    _searchController.delegate = self;
    _searchController.searchBar.delegate = self;
    self.definesPresentationContext = true;
    _searchController.dimsBackgroundDuringPresentation = false;
    // Setup the Scope Bar
    
    self.tableView.tableHeaderView = _searchController.searchBar;
}

#pragma mark - Search Bar Methods

- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope
{
    [self updateSearchResultsForSearchController:self.searchController];
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    NSString *searchString = searchController.searchBar.text;
    [self filterContentForSearchText:searchString scope:nil];
    
    [self.tableView reloadData];
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *namePredicate = [NSPredicate predicateWithFormat:@"(SELF.name contains[cd] %@)", searchText];
    
    _filteredItems = [_items filteredArrayUsingPredicate:namePredicate];
}

#pragma mark - Table View Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    if (_searchController.active && ![_searchController.searchBar.text isEqual:@""])
    {
        return [_filteredItems count];
    }
    else
    {
        return [_items count];
    }
}

@end
