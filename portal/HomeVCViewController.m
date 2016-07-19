//
//  HomeVCViewController.m
//  portal
//
//  Created by Neil Ballard on 2/24/16.
//  Copyright © 2016 Neil_appworld. All rights reserved.
//

#import "HomeVCViewController.h"

@interface HomeVCViewController ()

@end

@implementation HomeVCViewController

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    //   self.tabBar.translatesAutoresizingMaskIntoConstraints = NO;
  //  [self.tabBar invalidateIntrinsicContentSize];
  //  CGFloat tabSize = 65.0;
    
  //  CGRect tabFrame = self.tabBar.frame;
    
  //  tabFrame.size.height = tabSize;
    
  //  self.tabBar.frame = tabFrame;
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.delegate = self;
    
    EncountersViewController* ctrl1 = [[EncountersViewController alloc] init];
    BlankViewController* ctrl2 = [[BlankViewController alloc] init];
    ConnectionsViewController* ctrl3 = [[ConnectionsViewController alloc] init];
    AccountViewController* ctrl4 = [[AccountViewController alloc] init];
    
    ctrl1.title = @"Encounters";
    ctrl2.title = @"Messages";
    ctrl3.title = @"Connections";
    ctrl4.title = @"Me";
        
    ctrl1.tabBarItem.image = [UIImage imageNamed:@"encounter"];
    ctrl2.tabBarItem.image = [UIImage imageNamed:@"message"];
    ctrl3.tabBarItem.image = [UIImage imageNamed:@"connection"];
    ctrl4.tabBarItem.image = [UIImage imageNamed:@"me"];

    [self setViewControllers: @[ctrl1, ctrl2, ctrl3, ctrl4]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
