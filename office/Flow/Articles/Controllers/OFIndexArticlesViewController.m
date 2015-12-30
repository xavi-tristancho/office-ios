//
//  OFIndexArticlesViewController.m
//  office
//
//  Created by Xavier Tristancho Bordoy on 30/12/15.
//  Copyright © 2015 Xavier Tristancho Bordoy. All rights reserved.
//

#import "OFIndexArticlesViewController.h"
#import "OFShowArticlesViewController.h"
#import "OFArticlesService.h"
#import "OFArticle.h"

#import "APLFontAwesome.h"

@interface OFIndexArticlesViewController () <UITableViewDataSource, UISearchBarDelegate, UISearchResultsUpdating, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@property (strong, nonatomic) UISearchController *searchController;
@property (strong, nonatomic) NSArray *customers;
@property (strong, nonatomic) NSArray *filteredCustomers;

@end

@implementation OFIndexArticlesViewController

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        UIImage *icon = [APLFontAwesome imageFromIcon:@"\uf290"
                                                 size:25.0f
                                                color:[UIColor blackColor]
                                                frame:CGRectMake(0, 0, 25, 25)];
        
        [[self tabBarItem] setImage:icon];
        [[self tabBarItem] setTitle:@"Articulos"];
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
    [_tableView setDelegate:self];
    [self getAllCustomers];
}

- (void)getAllCustomers
{
    __weak typeof(self)weakSelf = self;
    
    OFArticlesService *articlesService = [OFArticlesService new];
    [articlesService getAllWithCompletion:^(NSArray *customers)
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
    NSPredicate *namePredicate = [NSPredicate predicateWithFormat:@"(SELF.name contains[cd] %@)", searchText];
    
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
    
    OFArticle *article = [self getArticleFromIndexPath:indexPath];
    
    [[cell textLabel] setText:[article name]];
    
    return cell;
}

- (OFArticle *)getArticleFromIndexPath:(NSIndexPath *)indexPath
{
    OFArticle *article;
    
    if (_searchController.active && ![_searchController.searchBar.text isEqual:@""])
    {
        article = _filteredCustomers[indexPath.row];
    }
    else
    {
        article = _customers[indexPath.row];
    }
    
    return article;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    OFArticle *article = [self getArticleFromIndexPath:indexPath];
    
    OFArticlesService *articleService = [OFArticlesService new];
    [articleService find:article
          withCompletion:^(OFArticle *article)
    {
        OFShowArticlesViewController *controller = [[OFShowArticlesViewController alloc] initWithArticle:article];
        [[self navigationController] pushViewController:controller animated:YES];
    }];
}

@end