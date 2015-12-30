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
        [self setViewControllers:@[articlesViewController]];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
