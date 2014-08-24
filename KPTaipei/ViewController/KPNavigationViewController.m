//
//  KPNavigationViewController.m
//  KPTaipei
//
//  Created by leo.chang on 2014/8/24.
//  Copyright (c) 2014年 Good-idea Consulgint Inc. All rights reserved.
//

#import "KPNavigationViewController.h"
#import "MenuViewController.h"

@interface KPNavigationViewController ()

@property (retain, readwrite, nonatomic) MenuViewController *menuViewController;

@end

@implementation KPNavigationViewController

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
    self.menuViewController = [[MenuViewController alloc] init];
    self.menuViewController.navigationController = self;
    [self.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognized:)]];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showMenu
{
    [self.menuViewController presentFromViewController:self animated:YES completion:nil];
}

#pragma mark -
#pragma mark Rotation handling

- (BOOL)shouldAutorotate
{
    return self.menuViewController.hidden;
}

#pragma mark -
#pragma mark Gesture recognizer

- (void)panGestureRecognized:(UIPanGestureRecognizer *)sender
{
    [self.menuViewController presentFromViewController:self panGestureRecognizer:sender];
}

@end
