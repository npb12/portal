//
//  SwipeViewController.h
//  portal
//
//  Created by Neil Ballard on 12/13/15.
//  Copyright © 2015 Neil_appworld. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DeviceManager.h"
#import "EncounterTableViewCell.h"


@interface EncountersViewController : UIViewController<UITableViewDataSource,UITableViewDelegate, UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *searchTextField;

@property (nonatomic, strong) UINavigationBar *navBar;

-(void) pushDetailView:(id)sender;


@end
