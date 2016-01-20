//
//  OFRootViewController.m
//  office
//
//  Created by Xavier Tristancho Bordoy on 28/12/15.
//  Copyright © 2015 Xavier Tristancho Bordoy. All rights reserved.
//

#import "OFRootViewController.h"
#import "OFIndexCustomersViewController.h"
#import "OFIndexArticlesViewController.h"
#import "OFIndexOptionsViewController.h"

@interface OFRootViewController ()

@end

@implementation OFRootViewController

- (instancetype)init
{
    self = [super init];

    if (self)
    {
        [self.tabBar setTintColor:[UIColor blackColor]];
        
        OFIndexArticlesViewController *articlesViewController = [OFIndexArticlesViewController new];
        
        [self setViewControllers:[self instantiateTabBarControllers:@[articlesViewController]]];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSArray *)instantiateTabBarControllers:(NSArray *)controllers
{
    NSMutableArray *tabBarControllers = [NSMutableArray new];
    
    for (UIViewController *controller in controllers)
    {
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
        [tabBarControllers addObject:navController];
    }
    
    return tabBarControllers;
}

@end
