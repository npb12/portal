//
//  MyProfileViewController.h
//  portal
//
//  Created by Neil Ballard on 11/1/15.
//  Copyright © 2015 Neil_appworld. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <linkedin-sdk/LISDK.h>


@interface MyProfileViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>


@property (nonatomic, strong) NSString *linkedinId;

@end
