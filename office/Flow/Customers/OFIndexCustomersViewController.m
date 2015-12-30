//
//  OFCustomersViewController.m
//  office
//
//  Created by Xavier Tristancho Bordoy on 28/12/15.
//  Copyright © 2015 Xavier Tristancho Bordoy. All rights reserved.
//

#import "OFIndexCustomersViewController.h"
#import "APLFontAwesome.h"
#import "OFCustomersService.h"
#import "OFCustomer.h"

@interface OFIndexCustomersViewController () <UITableViewDataSource, UISearchBarDelegate, UISearchResultsUpdating>

//Connections
@property (strong, nonatomic) IBOutlet UITableView *tableView;


@property (strong, nonatomic) UISearchController *searchController;
@property (strong, nonatomic) NSArray *customers;
@property (strong, nonatomic) NSArray *filteredCustomers;

@end

@implementation OFIndexCustomersViewController

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        UIImage *icon = [APLFontAwesome imageFromIcon:@"\uf0c0"
                                                 size:25.0f
                                                color:[UIColor blackColor]
                                                frame:CGRectMake(0, 0, 25, 25)];
        
        [[self tabBarItem] setImage:icon];
        [[self tabBarItem] setTitle:@"Clientes"];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    _searchController.searchResultsUpdater = self;
    _searchController.dimsBackgroundDuringPresentation = false;
    _searchController.definesPresentationContext = true;
    _tableView.tableHeaderView = _searchController.searchBar;
    
    [_tableView setDataSource:self];
    [self getAllCustomers];
}

- (void)getAllCustomers
{
    __weak typeof(self)weakSelf = self;
    
    OFCustomersService *customersService = [OFCustomersService new];
    [customersService getAllWithCompletion:^(NSArray *customers)
    {
        [weakSelf setCustomers:customers];
        [weakSelf setFilteredCustomers:customers];
        [[weakSelf tableView] reloadData];
    }];
}

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
    NSPredicate *namePredicate = [NSPredicate predicateWithFormat:@"(SELF.getFullName contains[cd] %@)", searchText];
    
    _filteredCustomers = [_customers filteredArrayUsingPredicate:namePredicate];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    if (_searchController.active && ![_searchController.searchBar.text isEqual:@""])
    {
        return [_filteredCustomers count];
    }
    else
    {
        return [_customers count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    OFCustomer *customer;
    
    if (_searchController.active && ![_searchController.searchBar.text isEqual:@""])
    {
        customer = _filteredCustomers[indexPath.row];
    }
    else
    {
        customer = _customers[indexPath.row];
    }
    
    [[cell textLabel] setText:[customer getFullName]];
    
    return cell;
}

@end
