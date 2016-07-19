//
//  HomeVCViewController.h
//  portal
//
//  Created by Neil Ballard on 2/24/16.
//  Copyright © 2016 Neil_appworld. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EncountersViewController.h"
#import "ConnectionsViewController.h"
#import "AccountViewController.h"
#import "BlankViewController.h"

@interface HomeVCViewController : UITabBarController<UITabBarControllerDelegate>

@property (strong, nonatomic) UITabBarController *tabBarController;


@property (strong, nonatomic) EncountersViewController *firstViewController;
@property (strong, nonatomic) BlankViewController *secondViewController;
@property (strong, nonatomic) ConnectionsViewController *thirdViewController;
@property (strong, nonatomic) AccountViewController *fourthViewController;


@end
