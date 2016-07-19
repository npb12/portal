//
//  ConnectionsTableViewCell.m
//  portal
//
//  Created by Neil Ballard on 11/22/15.
//  Copyright © 2015 Neil_appworld. All rights reserved.
//

#import "ConnectionsTableViewCell.h"
#import "DeviceManager.h"
#import "DataAccess.h"
#import "UserProfileViewController.h"



@implementation ConnectionsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    //    self.imageView.frame = CGRectMake(0,0,34,34);
    
    //  self.backgroundView.frame = CGRectMake(0, 0, 40, 70);
    
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // configure control(s)
        self.backgroundView = [[UIView alloc] initWithFrame:self.frame];
        self.backgroundView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.backgroundView];
        
        [self addProfileBackground];
        [self addProfileImage];
        /*
        [self addSocialBackground];
        [self addFacebookIcon];
        [self addInstagramIcon];
        [self addLinkedinIcon];
        [self addSnapchatIcon]; */
   //     [self addSnapchatBackground];
        [self setupNameLabel];
        [self setupSubLabel];
        
        [self setupNetworksLabel];
        [self setupMessageLabel];
        
        [self addGlobe];
        [self setupDateLabel];
    }
    return self;
}


- (void)addProfileBackground {
    
    self.pickbackground = [[UIView alloc]initWithFrame:self.backgroundView.frame];
    
    self.pickbackground.backgroundColor = [UIColor whiteColor];//[self titleColor];
    self.pickbackground.translatesAutoresizingMaskIntoConstraints = NO;
    [self.pickbackground invalidateIntrinsicContentSize];
    
    //  self.pickbackground.alpha = 2.0;
    
    
    self.pickbackground.layer.masksToBounds = NO;
    self.pickbackground.layer.shadowOffset = CGSizeMake(-.1, .2);
    self.pickbackground.layer.shadowRadius = .5;
    self.pickbackground.layer.shadowOpacity = 0.5;
    
    self.pickbackground.userInteractionEnabled = YES;
    
    
    [self addSubview:self.pickbackground];
    
    CGFloat pad = 0, height = 0;
    CGFloat width = 0, pad2 = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        pad = 8;
        height = 73;
        width = 73;
        pad2 = 20;
        self.pickbackground.layer.cornerRadius = 36;


    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6Screen])
    {
        pad = 8;
        height = 68;
        width = 68;
        pad2 = 22;
        self.pickbackground.layer.cornerRadius = 32;


    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6PlusScreen])
    {
        pad = 8;
        height = 74;
        width = 76;
        pad2 = 23;
        self.pickbackground.layer.cornerRadius = 35;

        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone4Screen] || [[DeviceManager sharedInstance] getIsIPad]) {
        pad = 6;
        height = 58;
        width = 58;
        pad2 = 19;
        self.pickbackground.layer.cornerRadius = 28;

    }
    
    
    
    NSDictionary *viewsDictionary = @{@"back":self.pickbackground, @"top": self.backgroundView};
    NSArray *constraint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-pad-[back]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad2]} views:viewsDictionary];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-pad-[back]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    [self addConstraints:constraint1];
    [self addConstraints:constraint2];
    
    NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:self.pickbackground attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height];
    [self addConstraint:constraint3];
    
    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.pickbackground attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width];
    [self addConstraint:constraint4];
    
}

- (void)addProfileImage {
    
    self.pic = [[UIImageView alloc]initWithFrame:self.pickbackground.frame];
    
    self.pic.backgroundColor = [UIColor blueColor];
    self.pic.translatesAutoresizingMaskIntoConstraints = NO;
    [self.pic invalidateIntrinsicContentSize];
    
    
    self.pic.layer.masksToBounds = YES;

    
    self.pic.alpha = 2.0;
    

    
    self.pic.userInteractionEnabled = YES;
    
    
    
    
    [self.pickbackground addSubview:self.pic];
    
    CGFloat pad = 0, height = 0, width = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        pad = 3;
        height = 67;
        width = 69;
        self.pic.layer.cornerRadius = 32;

    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6Screen])
    {
        pad = 0;
        width = 63;
        height = 61;
        self.pic.layer.cornerRadius = 32;

    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6PlusScreen])
    {
        pad = 0;
        height = 68;
        width = 70;
        self.pic.layer.cornerRadius = 35;

    }
    else if ([[DeviceManager sharedInstance] getIsIPhone4Screen] || [[DeviceManager sharedInstance] getIsIPad]) {
        pad = 3;
        height = 52;
        width = 54;
        self.pic.layer.cornerRadius = 28;

    }
    
    
    
    
    
    NSLayoutConstraint *constraint1 = [NSLayoutConstraint constraintWithItem:self.pickbackground attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.pic attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
        NSLayoutConstraint *constraint2 = [NSLayoutConstraint constraintWithItem:self.pickbackground attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.pic attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];

    [self.pickbackground addConstraint:constraint1];
    [self.pickbackground addConstraint:constraint2];
    
    NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:self.pic attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height];
    [self.pickbackground addConstraint:constraint3];
    
    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.pic attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width];
    [self.pickbackground addConstraint:constraint4];
    
}



- (void)setupNameLabel {

    
    self.nameLabel = [[UILabel alloc] init];
    
    
    
    
    [self.nameLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.nameLabel invalidateIntrinsicContentSize];
    self.nameLabel.textColor = [UIColor blackColor];
    
    
    CGFloat pad = 0, pad2 = 0;
    self.nameLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:16];
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
     //   self.nameLabel.font = [UIFont systemFontOfSize:5];
        pad = 15;
        pad2 = 15;
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6Screen])
    {
    //    self.nameLabel.font = [UIFont systemFontOfSize:5];
        pad = 40;
        pad2 = 2;
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6PlusScreen])
    {
        pad = 44;
        pad2 = 1;
        self.nameLabel.font = [UIFont systemFontOfSize:20];

    }
    else if ([[DeviceManager sharedInstance] getIsIPhone4Screen] || [[DeviceManager sharedInstance] getIsIPad]) {
        pad = 31;
        pad2 = 1;
    //    self.nameLabel.font = [UIFont systemFontOfSize:4];

    }
    
    [self addSubview:self.nameLabel];
    
    NSDictionary *viewsDictionary = @{@"side":self.pickbackground, @"label" : self.nameLabel};
    NSArray *constraint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[side]-pad-[label]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    [self addConstraints:constraint1];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-pad-[label]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad2]} views:viewsDictionary];
    [self addConstraints:constraint2];
    
}


- (void)setupSubLabel {
    
    
    self.subLabel = [[UILabel alloc] init];
    
    
    
    
    [self.subLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.subLabel invalidateIntrinsicContentSize];
    self.subLabel.textColor = [self cdBlue];//[UIColor lightGrayColor];
    
    
    CGFloat pad = 0, pad2 = 0;
    self.subLabel.font = [UIFont fontWithName:@"AppleSDGothicNeo-Regular" size:13];
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        //   self.nameLabel.font = [UIFont systemFontOfSize:5];
        pad = 15;
        pad2 = 3;
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6Screen])
    {
        //    self.nameLabel.font = [UIFont systemFontOfSize:5];
        pad = 40;
        pad2 = 2;
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6PlusScreen])
    {
        pad = 44;
        pad2 = 1;
        self.nameLabel.font = [UIFont systemFontOfSize:20];
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone4Screen] || [[DeviceManager sharedInstance] getIsIPad]) {
        pad = 31;
        pad2 = 1;
        //    self.nameLabel.font = [UIFont systemFontOfSize:4];
        
    }
    
    [self addSubview:self.subLabel];
    
    NSDictionary *viewsDictionary = @{@"label":self.subLabel, @"top" : self.nameLabel, @"side": self.pickbackground};
    NSArray *constraint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[side]-pad-[label]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    [self addConstraints:constraint1];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[top]-pad-[label]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad2]} views:viewsDictionary];
    [self addConstraints:constraint2];
    
}


- (void)addGlobe {
    
    self.globe = [[UIImageView alloc]init];
    
    self.globe.backgroundColor = [UIColor clearColor];
    self.globe.translatesAutoresizingMaskIntoConstraints = NO;
    [self.globe invalidateIntrinsicContentSize];
    
    self.globe.alpha = 0.5;
    self.globe.image = [UIImage imageNamed:@"globe"];
    
    self.globe.userInteractionEnabled = YES;
    
    [self addSubview:self.globe];
    
    CGFloat pad = 0, pad2 = 0, height = 0, width = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        pad = 0;
        pad2 = 3;
        height = 13;
        width = 13;
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6Screen])
    {
        pad = 8;
        height = 60;
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6PlusScreen])
    {
        pad = 8;
        height = 60;
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone4Screen] || [[DeviceManager sharedInstance] getIsIPad]) {
        pad = 8;
        height = 60;
    }
    
    
    
    NSDictionary *viewsDictionary = @{@"icon":self.globe};
    NSArray *constraint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[icon]-10-|" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[icon]-15-|" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    [self addConstraints:constraint1];
    [self addConstraints:constraint2];
    
    NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:self.globe attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height];
    [self addConstraint:constraint3];
    
    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.globe attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width];
    [self addConstraint:constraint4];
    
}


- (void)setupDateLabel {
    
    
    self.dateLabel = [[UILabel alloc] init];
    
    
    
    
    [self.dateLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.dateLabel invalidateIntrinsicContentSize];
    self.dateLabel.textColor = [UIColor lightGrayColor];
    
    
    CGFloat pad = 0, pad2 = 0;
    self.dateLabel.font = [UIFont fontWithName:@"AppleSDGothicNeo-Regular" size:11];
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        //   self.nameLabel.font = [UIFont systemFontOfSize:5];
        pad = 15;
        pad2 = 3;
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6Screen])
    {
        //    self.nameLabel.font = [UIFont systemFontOfSize:5];
        pad = 40;
        pad2 = 2;
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6PlusScreen])
    {
        pad = 44;
        pad2 = 1;
        self.nameLabel.font = [UIFont systemFontOfSize:20];
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone4Screen] || [[DeviceManager sharedInstance] getIsIPad]) {
        pad = 31;
        pad2 = 1;
        //    self.nameLabel.font = [UIFont systemFontOfSize:4];
        
    }
    
    [self addSubview:self.dateLabel];
    
    NSDictionary *viewsDictionary = @{@"label":self.dateLabel, @"globe": self.globe};
    NSArray *constraint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[label]-5-[globe]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    [self addConstraints:constraint1];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-8-|" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad2]} views:viewsDictionary];
    [self addConstraints:constraint2];
    
}

- (void)setupNetworksLabel {
    
    
    self.networksLabel = [[UILabel alloc] init];
    
    
    
    
    [self.networksLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.networksLabel invalidateIntrinsicContentSize];
    self.networksLabel.textColor = [UIColor lightGrayColor];
    
    self.networksLabel.text = @"Networks";
    
    CGFloat pad = 0, pad2 = 0;
    self.networksLabel.font = [UIFont fontWithName:@"Verdana" size:11.0f];
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        //   self.nameLabel.font = [UIFont systemFontOfSize:5];
        pad = 15;
        pad2 = 3;
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6Screen])
    {
        //    self.nameLabel.font = [UIFont systemFontOfSize:5];
        pad = 40;
        pad2 = 2;
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6PlusScreen])
    {
        pad = 44;
        pad2 = 1;
        self.nameLabel.font = [UIFont systemFontOfSize:20];
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone4Screen] || [[DeviceManager sharedInstance] getIsIPad]) {
        pad = 31;
        pad2 = 1;
        //    self.nameLabel.font = [UIFont systemFontOfSize:4];
        
    }
    
    [self addSubview:self.networksLabel];
    
    NSDictionary *viewsDictionary = @{@"label":self.networksLabel, @"side": self.pickbackground};
    NSArray *constraint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[side]-15-[label]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    [self addConstraints:constraint1];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-10-|" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad2]} views:viewsDictionary];
    [self addConstraints:constraint2];
    
}

- (void)setupMessageLabel {
    
    
    self.messageLabel = [[UILabel alloc] init];
    
    
    
    
    [self.messageLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.messageLabel invalidateIntrinsicContentSize];
    self.messageLabel.textColor = [UIColor lightGrayColor];
    
    self.messageLabel.text = @"Message";
    
    CGFloat pad = 0, pad2 = 0;
    self.messageLabel.font = [UIFont fontWithName:@"Verdana" size:11.0f];
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        //   self.nameLabel.font = [UIFont systemFontOfSize:5];
        pad = 15;
        pad2 = 3;
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6Screen])
    {
        //    self.nameLabel.font = [UIFont systemFontOfSize:5];
        pad = 40;
        pad2 = 2;
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6PlusScreen])
    {
        pad = 44;
        pad2 = 1;
        self.nameLabel.font = [UIFont systemFontOfSize:20];
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone4Screen] || [[DeviceManager sharedInstance] getIsIPad]) {
        pad = 31;
        pad2 = 1;
        //    self.nameLabel.font = [UIFont systemFontOfSize:4];
        
    }
    
    [self addSubview:self.messageLabel];
    
    NSDictionary *viewsDictionary = @{@"label":self.messageLabel, @"side": self.networksLabel};
    NSArray *constraint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[side]-4-[label]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    [self addConstraints:constraint1];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-10-|" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad2]} views:viewsDictionary];
    [self addConstraints:constraint2];
    
}



-(void)FacebookButtonClicked{
    
    //    NSString *facebook =  [[DataAccess singletonInstance] getFacebook];
    
    NSString *url = @"fb://profile/";
    //  NSURL *bUrl = [NSURL URLWithString:url];
    //  NSURL *fbURL = [bUrl URLByAppendingPathComponent:facebook];
    
    NSURL *fbURL = [NSURL URLWithString:url];
    
    NSLog(@"%@", fbURL);
    
        if ([[UIApplication sharedApplication] openURL:fbURL]) {
    NSLog(@"trying to open");
    [[UIApplication sharedApplication] openURL:fbURL];
        }else{
            
        }
    
}


-(void)InstagramButtonClicked{
    
    NSString *insta =  [[DataAccess singletonInstance] getInstagram];
    
    NSString *url = @"instagram://user?username=";
    NSString *bURL = [url stringByAppendingString:insta];
    NSURL *instagramURL = [NSURL URLWithString:bURL];
    //NSURL *instagramURL = [bUrl URLByAppendingPathComponent:insta];
    
    NSLog(@"%@", instagramURL);
    
        if ([[UIApplication sharedApplication] openURL:instagramURL]) {
            NSLog(@"trying to open");
            [[UIApplication sharedApplication] openURL:instagramURL];
        }else{
            
        }
    
}



-(void)LinkedinButtonClicked{
    
    //    NSURL *linkURL = [NSURL URLWithString:@"linkedin://#profile/45b862b6"];
    //    [[UIApplication sharedApplication] openURL:linkURL];
    
    
    
    [[LISDKDeeplinkHelper sharedInstance] viewOtherProfile:self.linkedinId withState:self.linkedinId showGoToAppStoreDialog:YES success:nil error:nil];
    
}

-(void)SnapchatButtonClicked{
    
//    self.snapchatbackground.hidden = NO;
    
    
}


-(UIColor*)titleColor{
    
    return [UIColor colorWithRed:0.20 green:0.80 blue:1.00 alpha:1.0];
}

-(UIColor*)grayColor{
    
    return [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.0];
}

- (UIColor *) cdBlue {
    return [UIColor colorWithRed:0.00 green:0.59 blue:0.84 alpha:1.0];
}

- (UIColor *) cdNavBlue {
    return [UIColor colorWithRed:0.00 green:0.59 blue:0.85 alpha:1.0];
}


@end
