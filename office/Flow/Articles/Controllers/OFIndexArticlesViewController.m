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

#import "OFIndexInventoryViewController.h"
#import "OFInventoryService.h"

#import "APLFontAwesome.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface OFIndexArticlesViewController ()

@property (nonatomic) BOOL firstTimeAppearing;

@end

@implementation OFIndexArticlesViewController

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        self.firstTimeAppearing = YES;
        UIImage *icon = [APLFontAwesome imageFromIcon:@"\uf290"
                                                 size:20.0f
                                                color:[UIColor blackColor]
                                                frame:CGRectMake(0, 0, 20, 20)];
        
        [[self tabBarItem] setImage:icon];
        [[self tabBarItem] setTitle:NSLocalizedString(@"Articles", @"")];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setLeftNavigationBarButton];
    
    [self setUpRefreshControl];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self setTitle:NSLocalizedString(@"Articles", @"")];
    
    [self getAllArticles];
}

- (void)setUpRefreshControl
{
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.backgroundColor = [UIColor clearColor];
    self.refreshControl.tintColor = [UIColor blackColor];
    [self.refreshControl addTarget:self
                            action:@selector(getAllArticles)
                  forControlEvents:UIControlEventValueChanged];

}

- (void)getAllArticles
{
    __weak typeof(self)weakSelf = self;
    
    if(self.firstTimeAppearing)[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    OFArticlesService *articlesService = [OFArticlesService new];
    [articlesService getAllWithCompletion:^(NSArray *articles)
     {
         [weakSelf.refreshControl endRefreshing];
         if(weakSelf.firstTimeAppearing)[MBProgressHUD hideHUDForView:weakSelf.view animated:YES];
         [weakSelf setUpItems:articles];
         weakSelf.firstTimeAppearing = NO;
     }];
}

- (void)setUpItems:(NSArray *)articles
{
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    NSArray *sortedArticles = [articles sortedArrayUsingDescriptors:@[sort]];
    self.items = sortedArticles;
    self.filteredItems = sortedArticles;
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"articleCell"];
    
    OFArticle *article = [self getArticleFromIndexPath:indexPath];
    
    [[cell textLabel] setText:[article name]];
    [cell.detailTextLabel setText:NSLocalizedString([article lastModified], @"")];
    
    return cell;
}

- (OFArticle *)getArticleFromIndexPath:(NSIndexPath *)indexPath
{
    OFArticle *article;
    
    if (self.searchController.active && ![self.searchController.searchBar.text isEqual:@""])
    {
        article = self.filteredItems[indexPath.row];
    }
    else
    {
        article = self.items[indexPath.row];
    }
    
    return article;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    __weak typeof(self)weakSelf = self;
    
    OFArticle *article = [self getArticleFromIndexPath:indexPath];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    OFArticlesService *articleService = [OFArticlesService new];
    
    [articleService find:article
          withCompletion:^(OFArticle *article)
    {
        [MBProgressHUD hideHUDForView:weakSelf.view animated:YES];
        OFShowArticlesViewController *controller = [[OFShowArticlesViewController alloc] initWithArticle:article];
        [[self navigationController] pushViewController:controller animated:YES];
    }];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)setLeftNavigationBarButton
{
    UIImage *menuIcon = [APLFontAwesome imageFromIcon:@"\uf1b3"
                                                 size:20
                                                color:[UIColor blackColor]
                                                frame:CGRectMake(0, 0, 30, 30)];
    
    UIBarButtonItem *menu = [[UIBarButtonItem alloc] initWithImage: menuIcon
                                                             style: UIBarButtonItemStylePlain
                                                            target: self
                                                            action: @selector(presentInventory)];
    [menu setTintColor:[UIColor blackColor]];
    [self.navigationItem setLeftBarButtonItem:menu animated:YES];
}

- (void)presentInventory
{
    OFIndexInventoryViewController *inventoryController = [OFIndexInventoryViewController new];
    UINavigationController *inventoryNav = [[UINavigationController alloc] initWithRootViewController:inventoryController];
    
    [[self navigationController] presentViewController:inventoryNav
                                              animated:YES
                                            completion:nil];
}

@end
