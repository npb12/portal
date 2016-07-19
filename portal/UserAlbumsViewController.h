//
//  UserAlbumsViewController.h
//  portal
//
//  Created by Neil Ballard on 1/4/16.
//  Copyright © 2016 Neil_appworld. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <linkedin-sdk/LISDK.h>

@interface UserAlbumsViewController : UIViewController

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *contact_time;
@property (nonatomic, strong) UILabel *num_networks;

@property (nonatomic, strong) NSString *linkedinId;
@property (nonatomic, strong) NSString *facebook;
@property (nonatomic, strong) NSString *instagram;
@property (nonatomic, strong) NSString *snapchat;
@property (strong, nonatomic) IBOutlet UIView *socialbackground;



@property (strong, nonatomic) UIView *socialbackground1;
@property (strong, nonatomic) UIView *socialbackground2;
@property (strong, nonatomic) UIView *socialbackground3;
@property (strong, nonatomic) UIView *socialbackground4;
@property (strong, nonatomic) UIView *socialbackground5;


@property (strong, nonatomic) UIImageView *fbIcon;
@property (strong, nonatomic) UIImageView *instaIcon;
@property (strong, nonatomic) UIImageView *linkedinIcon;
@property (strong, nonatomic) UIImageView *twitterIcon;
@property (strong, nonatomic) UIImageView *snapchatIcon;

@property (strong, nonatomic) UILabel *fbText;
@property (strong, nonatomic) UILabel *instaText;
@property (strong, nonatomic) UILabel *linkedinText;
@property (strong, nonatomic) UILabel *twitterText;
@property (strong, nonatomic) UILabel *snapchatText;


@property (strong, nonatomic) UILabel *fbSubtext;
@property (strong, nonatomic) UILabel *instaSubtext;
@property (strong, nonatomic) UILabel *linkedinSubtext;
@property (strong, nonatomic) UILabel *twitterSubtext;
@property (strong, nonatomic) UILabel *snapchatSubtext;



@end
