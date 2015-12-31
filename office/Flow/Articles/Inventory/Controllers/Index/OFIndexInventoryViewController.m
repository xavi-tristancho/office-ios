//
//  OFIndexInventory.m
//  office
//
//  Created by Xavier Tristancho Bordoy on 31/12/15.
//  Copyright © 2015 Xavier Tristancho Bordoy. All rights reserved.
//

#import "OFIndexInventoryViewController.h"
#import "OFInventoryService.h"

#import "APLFontAwesome.h"

@implementation OFIndexInventoryViewController

- (instancetype)init
{
    self = [super init];

    if (self)
    {
        self.formController.form = [OFInventoryForm new];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setLeftNavigationBarButton];
    
    __weak typeof(self)weakSelf = self;
    OFInventoryService *inventoryService = [OFInventoryService new];
    [inventoryService getInventory:^(OFInventoryForm *inventory)
     {
         weakSelf.formController.form = inventory;
         [[weakSelf tableView] reloadData];
     }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self setTitle:NSLocalizedString(@"Inventory", @"")];
}

- (void)setLeftNavigationBarButton
{
    UIImage *closeIcon = [APLFontAwesome imageFromIcon:@"\uf00d"
                                                  size:20
                                                 color:[UIColor blackColor]
                                                 frame:CGRectMake(0, 0, 20, 20)];
    
    UIBarButtonItem *menu = [[UIBarButtonItem alloc] initWithImage:closeIcon
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:@selector(dismissMe)];
    [menu setTintColor:[UIColor blackColor]];
    [self.navigationItem setLeftBarButtonItem:menu animated:YES];
}

- (void)dismissMe
{
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}

@end