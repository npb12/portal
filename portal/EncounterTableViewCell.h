//
//  EncounterTableViewCell.h
//  portal
//
//  Created by Neil Ballard on 2/7/16.
//  Copyright © 2016 Neil_appworld. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DeviceManager.h"
#import "DataAccess.h"
#import <linkedin-sdk/LISDK.h>

@interface EncounterTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *pic;
@property (strong, nonatomic) IBOutlet UIView *pickbackground;
@property (strong, nonatomic) IBOutlet UIImageView *blurredBackground;
@property (strong, nonatomic) IBOutlet UIImageView *adBackground;


@property (nonatomic, strong) NSString *linkedinId;
@property (nonatomic, strong) NSString *facebook;
@property (nonatomic, strong) NSString *instagram;
@property (nonatomic, strong) NSString *snapchat;

@property (strong, nonatomic) IBOutlet UIView *socialbackground;
@property (strong, nonatomic) IBOutlet UIView *snapchatbackground;
@property (strong, nonatomic) IBOutlet UITextView *snapchatlabel;

@property (strong, nonatomic) IBOutlet UIView *Line;


@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;


@property (strong, nonatomic) IBOutlet UIButton *adButton;
@property (strong, nonatomic) IBOutlet UIButton *instagramIcon;
@property (strong, nonatomic) IBOutlet UIButton *linkedinIcon;
@property (strong, nonatomic) IBOutlet UIButton *snapchatIcon;

@property (strong, nonatomic) IBOutlet UILabel *networksLabel;


@property (strong, nonatomic) IBOutlet UIView *box1;
@property (strong, nonatomic) IBOutlet UIView *box2;
@property (strong, nonatomic) IBOutlet UIView *box3;


@property (strong, nonatomic) IBOutlet UILabel *Label1;
@property (strong, nonatomic) IBOutlet UILabel *Label2;
@property (strong, nonatomic) IBOutlet UILabel *Label3;

@property (strong, nonatomic) IBOutlet UIImageView *icon1;
@property (strong, nonatomic) IBOutlet UIImageView *icon2;
@property (strong, nonatomic) IBOutlet UIImageView *icon3;



@end
