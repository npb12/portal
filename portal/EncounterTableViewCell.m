//
//  EncounterTableViewCell.m
//  portal
//
//  Created by Neil Ballard on 2/7/16.
//  Copyright © 2016 Neil_appworld. All rights reserved.
//

#import "EncounterTableViewCell.h"

@implementation EncounterTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // configure control(s)
        self.backgroundColor = [UIColor clearColor];
        self.backgroundColor =[UIColor clearColor];
        [self addCellBackground];
    
        [self addBlurredBackground];
        [self addAdBackground];
        [self addProfileBackground];
        [self addProfileImage];
        [self setupNameLabel];
        [self setupDateLabel];
        [self setupNetworksLabel];
        
        [self addLine];
        
        [self addBox1];
        [self addBox2];
        [self addBox3];
        
        [self addIcon1];
        [self addLabel1];
        
        [self addIcon2];
        [self addLabel2];
        
        [self addLabel3];
        [self addIcon3];
        [self addAdButton];

        
    }
    return self;
}

-(void)addCellBackground{

    self.backgroundView = [[UIView alloc] initWithFrame:self.frame];
    self.backgroundView.backgroundColor = [UIColor whiteColor];
    
    self.backgroundView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.backgroundView invalidateIntrinsicContentSize];
    
    
    
    self.backgroundView.layer.masksToBounds = NO;
    self.backgroundView.layer.shadowOffset = CGSizeMake(-0.5, -1.0);
    self.backgroundView.layer.shadowRadius = 1.5;
    self.backgroundView.layer.shadowOpacity = 1.0;
    
    self.backgroundView.userInteractionEnabled = YES;
    
    
    [self addSubview:self.backgroundView];
    
    CGFloat pad = 0, height = 250;
    CGFloat width = self.frame.size.width - 20; CGFloat pad2 = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        pad = 10;
      //  height = 85;
      //  width = 85;
        pad2 = 20;

        
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6Screen])
    {
        pad = 8;
        height = 68;
        width = 68;
        pad2 = 22;

        
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6PlusScreen])
    {
        pad = 8;
        height = 74;
        width = 76;
        pad2 = 23;
        
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone4Screen] || [[DeviceManager sharedInstance] getIsIPad]) {
        pad = 6;
        height = 58;
        width = 58;
        pad2 = 19;

        
    }
    
    
    
    NSDictionary *viewsDictionary = @{@"back":self.backgroundView, @"blur": self};
    NSLayoutConstraint *constraint1 = [NSLayoutConstraint constraintWithItem:self.backgroundView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-pad-[back]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    //  [self addConstraints:constraint1];
    [self addConstraint:constraint1];
    [self addConstraints:constraint2];
    
    NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:self.backgroundView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:height];
    [self addConstraint:constraint3];
    
    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.backgroundView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:width];
    [self addConstraint:constraint4];

    
    
    
    
    
}

- (void)addBlurredBackground {
    

    
    
    self.blurredBackground = [[UIImageView alloc]initWithFrame:self.backgroundView.frame];
    
    self.blurredBackground.backgroundColor = [self titleColor];
    self.blurredBackground.translatesAutoresizingMaskIntoConstraints = NO;
    [self.blurredBackground invalidateIntrinsicContentSize];
    
    
    self.blurredBackground.layer.masksToBounds = NO;
    self.blurredBackground.layer.shadowOffset = CGSizeMake(-.1, .2);
    self.blurredBackground.layer.shadowRadius = .5;
    self.blurredBackground.layer.shadowOpacity = 0.5;
    
    self.blurredBackground.userInteractionEnabled = YES;
    
    
    [self.backgroundView addSubview:self.blurredBackground];

    
    CGFloat pad = 0, height = 0;
    CGFloat width = 0, pad2 = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        pad = 7;
    //    height = 58;
  //      width = 58;
        pad2 = 0;
        self.pickbackground.layer.cornerRadius = 28;
        
        height = 170;

    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6Screen])
    {
        pad = 0;
   //     height = 68;
   //     width = 68;
        pad2 = 0;
        self.pickbackground.layer.cornerRadius = 32;
        height = 200;
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6PlusScreen])
    {
        pad = 0;
  //      height = 74;
 //       width = 76;
        pad2 = 0;
        self.pickbackground.layer.cornerRadius = 35;
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone4Screen] || [[DeviceManager sharedInstance] getIsIPad]) {
        pad = 0;
  //      height = 58;
 //       width = 58;
        pad2 = 0;
        self.pickbackground.layer.cornerRadius = 28;
        
    }
    
    width = self.frame.size.width - 40;

    
    NSDictionary *viewsDictionary = @{@"back":self.blurredBackground, @"top": self};
    NSLayoutConstraint *constraint1 = [NSLayoutConstraint constraintWithItem:self.blurredBackground attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.backgroundView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-pad-[back]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    [self addConstraint:constraint1];
    [self addConstraints:constraint2];
     
    NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:self.blurredBackground attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height];
    [self addConstraint:constraint3];
    
    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.blurredBackground attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width];
    [self addConstraint:constraint4];
    
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:effect];
    blurView.frame = CGRectMake(0, 0, self.frame.size.width - 40, 170);
    [self.blurredBackground addSubview:blurView];
    
}


- (void)addAdBackground {
    
    
    
    
    self.adBackground = [[UIImageView alloc]initWithFrame:self.backgroundView.frame];
    
    self.adBackground.backgroundColor = [self titleColor];
    self.adBackground.translatesAutoresizingMaskIntoConstraints = NO;
    [self.adBackground invalidateIntrinsicContentSize];
    
    
    self.adBackground.layer.masksToBounds = NO;
    self.adBackground.layer.shadowOffset = CGSizeMake(-.1, .2);
    self.adBackground.layer.shadowRadius = .5;
    self.adBackground.layer.shadowOpacity = 0.5;
    
    self.adBackground.userInteractionEnabled = YES;
    
    
    [self.backgroundView addSubview:self.adBackground];
    
    
    CGFloat pad = 0, height = 0;
    CGFloat width = 0, pad2 = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        pad = 7;
        //    height = 58;
        //      width = 58;
        pad2 = 0;
        self.pickbackground.layer.cornerRadius = 28;
        
        height = 170;
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6Screen])
    {
        pad = 0;
        //     height = 68;
        //     width = 68;
        pad2 = 0;
        self.pickbackground.layer.cornerRadius = 32;
        height = 200;
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6PlusScreen])
    {
        pad = 0;
        //      height = 74;
        //       width = 76;
        pad2 = 0;
        self.pickbackground.layer.cornerRadius = 35;
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone4Screen] || [[DeviceManager sharedInstance] getIsIPad]) {
        pad = 0;
        //      height = 58;
        //       width = 58;
        pad2 = 0;
        self.pickbackground.layer.cornerRadius = 28;
        
    }
    
    width = self.frame.size.width - 40;
    
    
    NSDictionary *viewsDictionary = @{@"back":self.adBackground, @"top": self};
    NSLayoutConstraint *constraint1 = [NSLayoutConstraint constraintWithItem:self.adBackground attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.backgroundView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-pad-[back]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    [self addConstraint:constraint1];
    [self addConstraints:constraint2];
    
    NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:self.adBackground attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height];
    [self addConstraint:constraint3];
    
    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.adBackground attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width];
    [self addConstraint:constraint4];

    
}


- (void)addProfileBackground {
    
    self.pickbackground = [[UIView alloc]initWithFrame:self.blurredBackground.frame];
    
    self.pickbackground.backgroundColor = [UIColor whiteColor];
    self.pickbackground.translatesAutoresizingMaskIntoConstraints = NO;
    [self.pickbackground invalidateIntrinsicContentSize];
    
    //  self.pickbackground.alpha = 2.0;
    
    
    self.pickbackground.layer.masksToBounds = NO;
    self.pickbackground.layer.shadowOffset = CGSizeMake(-.1, .2);
    self.pickbackground.layer.shadowRadius = .5;
    self.pickbackground.layer.shadowOpacity = 0.5;
    
    self.pickbackground.userInteractionEnabled = YES;
    
    
    [self.blurredBackground addSubview:self.pickbackground];
    
    CGFloat pad = 0, height = 0;
    CGFloat width = 0, pad2 = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        pad = 25;
        height = 91;
        width = 95;
        pad2 = 20;
        self.pickbackground.layer.cornerRadius = 46;
        
        
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
    
    
    
    NSDictionary *viewsDictionary = @{@"back":self.pickbackground, @"blur": self.blurredBackground};
    NSLayoutConstraint *constraint1 = [NSLayoutConstraint constraintWithItem:self.pickbackground attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.blurredBackground attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
//    NSArray *constraint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-pad-[back]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-pad-[back]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
  //  [self addConstraints:constraint1];
    [self addConstraint:constraint1];
    [self addConstraints:constraint2];
    
    NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:self.pickbackground attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:height];
    [self addConstraint:constraint3];
    
    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.pickbackground attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:width];
    [self addConstraint:constraint4];
    
}

- (void)addProfileImage {
    
    self.pic = [[UIImageView alloc]initWithFrame:self.pickbackground.frame];
    
    self.pic.backgroundColor = [UIColor blueColor];
    self.pic.translatesAutoresizingMaskIntoConstraints = NO;
    [self.pic invalidateIntrinsicContentSize];
    

    
    self.pic.layer.masksToBounds = YES;
    
 //   self.pic.layer.masksToBounds = NO;
    self.pic.layer.shadowOffset = CGSizeMake(-.1, .2);
    self.pic.layer.shadowRadius = .5;
    self.pic.layer.shadowOpacity = 0.5;
    
    

    self.pic.alpha = 2.0;
    
    
    
    self.pic.userInteractionEnabled = YES;
    
    
    
    
    [self.pickbackground addSubview:self.pic];
    
    CGFloat pad = 0, height = 0, width = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        pad = 3;
        height = 84;
        width = 86;
        self.pic.layer.cornerRadius = 42;
        
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
    
    NSLayoutConstraint *constraint1 = [NSLayoutConstraint constraintWithItem:self.pic attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.pickbackground attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSLayoutConstraint *constraint2 = [NSLayoutConstraint constraintWithItem:self.pic attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.pickbackground attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    
    [self.pickbackground addConstraint:constraint1];
    [self.pickbackground addConstraint:constraint2];
    
    NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:self.pic attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height];
    [self.pickbackground addConstraint:constraint3];
    
    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.pic attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width];
    [self.pickbackground addConstraint:constraint4];
    
}

- (void)addSocialBackground {
    
    self.socialbackground = [[UIView alloc]initWithFrame:self.pic.frame];
    
    self.socialbackground.backgroundColor = [self grayColor];
    //  CGFloat width = CGRectGetWidth([[UIScreen mainScreen] bounds]) - 8;
    self.socialbackground.translatesAutoresizingMaskIntoConstraints = NO;
    [self.socialbackground invalidateIntrinsicContentSize];
    
    self.socialbackground.alpha = 0.5;
    self.socialbackground.layer.cornerRadius = 20;
    
    self.socialbackground.userInteractionEnabled = YES;
    
    self.socialbackground.hidden = NO;
    
    
    
    self.socialbackground.layer.masksToBounds = NO;
    self.socialbackground.layer.shadowOffset = CGSizeMake(-.1, .2);
    self.socialbackground.layer.shadowRadius = .5;
    self.socialbackground.layer.shadowOpacity = 0.5;
    
    
    [self addSubview:self.socialbackground];
    
    CGFloat pad = 0, height = 0, pad2 = 0, width = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        pad = 10;
        height = 60;
        pad2 = 20;
        width = 200;
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6Screen])
    {
        pad = 13;
        height = 65;
        pad2 = 30;
        width = 230;
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6PlusScreen])
    {
        pad = 13;
        height = 76;
        pad2 = 30;
        width = 250;
        
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone4Screen] || [[DeviceManager sharedInstance] getIsIPad]) {
        pad = 12;
        height = 55;
        pad2 = 25;
        width = 195;
        
    }
    
    
    
    NSDictionary *viewsDictionary = @{@"back":self.socialbackground, @"top": self.backgroundView, @"pickback": self.pickbackground};
    NSArray *constraint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[back]-pad-|" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad2]} views:viewsDictionary];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-pad-[back]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    [self addConstraints:constraint1];
    [self addConstraints:constraint2];
    
    NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:self.socialbackground attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height];
    [self addConstraint:constraint3];
    
    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.socialbackground attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width];
    [self addConstraint:constraint4];
    
}

- (void)setupNameLabel {
    
    
    self.nameLabel = [[UILabel alloc] init];
    
    [self.nameLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.nameLabel invalidateIntrinsicContentSize];
    self.nameLabel.textColor = [UIColor whiteColor];
    
    
    self.nameLabel.layer.shadowRadius = 3.0;
    self.nameLabel.layer.shadowOpacity = 0.5;
    
    self.nameLabel.layer.masksToBounds = NO;
    self.nameLabel.layer.shouldRasterize = YES;
    
    CGFloat pad = 0, pad2 = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        self.nameLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:20];
        pad = 34;
        pad2 = 2;
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
    
    NSDictionary *viewsDictionary = @{@"top":self.pickbackground, @"label" : self.nameLabel};
    NSLayoutConstraint *constraint1 = [NSLayoutConstraint constraintWithItem:self.nameLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    [self addConstraint:constraint1];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[top]-pad-[label]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad2]} views:viewsDictionary];
    [self addConstraints:constraint2];
    
}

- (void)setupDateLabel {
    
    
    self.dateLabel = [[UILabel alloc] init];
    
    [self.dateLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.dateLabel invalidateIntrinsicContentSize];
    self.dateLabel.textColor = [UIColor lightTextColor];

    self.dateLabel.layer.shadowRadius = 3.0;
    self.dateLabel.layer.shadowOpacity = 0.5;
    
    self.dateLabel.layer.masksToBounds = NO;
    self.dateLabel.layer.shouldRasterize = YES;
    
    CGFloat pad = 0, pad2 = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        self.dateLabel.font = [UIFont fontWithName:@"AppleSDGothicNeo-Regular" size:13];
        pad = 34;
        pad2 = 2;
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
    
    NSDictionary *viewsDictionary = @{@"top":self.nameLabel, @"label" : self.dateLabel};
    NSLayoutConstraint *constraint1 = [NSLayoutConstraint constraintWithItem:self.dateLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    [self addConstraint:constraint1];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[top]-pad-[label]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad2]} views:viewsDictionary];
    [self addConstraints:constraint2];
    
}


- (void)setupNetworksLabel {
    
    
    self.networksLabel = [[UILabel alloc] init];
    
    [self.networksLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.networksLabel invalidateIntrinsicContentSize];
    self.networksLabel.textColor = [UIColor lightTextColor];
    
    self.networksLabel.layer.shadowRadius = 0.05;
    self.networksLabel.layer.shadowOpacity = 0.05;
    
    self.networksLabel.layer.masksToBounds = NO;
    
    CGFloat pad = 0, pad2 = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        self.networksLabel.font = [UIFont fontWithName:@"AppleSDGothicNeo-Regular" size:12];
        pad = 13;
        pad2 = 9;
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
    
    [self.backgroundView addSubview:self.networksLabel];
    
    NSDictionary *viewsDictionary = @{@"top":self.blurredBackground, @"label" : self.networksLabel};
    NSArray *constraint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-pad-[label]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    [self addConstraints:constraint1];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[top]-pad-[label]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad2]} views:viewsDictionary];
    [self addConstraints:constraint2];
    
}

- (void)addLine{
    
    self.Line = [[UIView alloc]init];
    
    self.Line.backgroundColor = [self grayColor];
    CGFloat width = 0;
    self.Line.translatesAutoresizingMaskIntoConstraints = NO;
    [self.Line invalidateIntrinsicContentSize];
    width = self.frame.size.width - 50;

    self.Line.hidden = NO;
    
    [self.backgroundView addSubview:self.Line];
    
    CGFloat pad = 0, height = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        pad = 5;
        height = 1;
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6Screen])
    {
        pad = 2;
        height = 1;
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6PlusScreen])
    {
        pad = 2;
        height = 1;
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone4Screen] || [[DeviceManager sharedInstance] getIsIPad]) {
        pad = 2;
        height = 1;
    }
    
    
    
    NSDictionary *viewsDictionary = @{@"top":self.networksLabel, @"line": self.Line};
    NSLayoutConstraint *constraint1 = [NSLayoutConstraint constraintWithItem:self.Line attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.backgroundView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[top]-pad-[line]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    [self addConstraint:constraint1];
    [self addConstraints:constraint2];
    
    NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:self.Line attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height];
    [self addConstraint:constraint3];
    
    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.Line attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width];
    [self addConstraint:constraint4];
    
}


- (void)addBox1 {
    
    self.box1 = [[UIView alloc]initWithFrame:self.backgroundView.frame];
    
    self.box1.backgroundColor = [UIColor clearColor];
    self.box1.translatesAutoresizingMaskIntoConstraints = NO;
    [self.box1 invalidateIntrinsicContentSize];
    
    self.box1.alpha = 0.5;
    
    self.box1.userInteractionEnabled = YES;
    
    [self.backgroundView addSubview:self.box1];
    
    CGFloat pad = 0, height = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        pad = 8;
        height = 40;
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
    
    CGFloat width = self.backgroundView.frame.size.width / 3 - 5;
    
    
    NSDictionary *viewsDictionary = @{@"back":self.box1};
    NSArray *constraint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[back]-0-|" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[back]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    [self addConstraints:constraint1];
    [self addConstraints:constraint2];
    
    NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:self.box1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height];
    [self addConstraint:constraint3];
    
    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.box1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width];
    [self addConstraint:constraint4];
    
}


- (void)addBox2 {
    
    self.box2 = [[UIView alloc]initWithFrame:self.backgroundView.frame];
    
    self.box2.backgroundColor = [UIColor clearColor];
    self.box2.translatesAutoresizingMaskIntoConstraints = NO;
    [self.box2 invalidateIntrinsicContentSize];
    
    self.box2.alpha = 0.5;
    
    self.box2.userInteractionEnabled = YES;
    
    [self.backgroundView addSubview:self.box2];
    
    CGFloat pad = 0, height = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        pad = 8;
        height = 40;
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
    
    CGFloat width = self.backgroundView.frame.size.width / 3 - 5;
    
    
    NSDictionary *viewsDictionary = @{@"back":self.box2};
    NSArray *constraint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[back]-0-|" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    NSLayoutConstraint *constraint2 = [NSLayoutConstraint constraintWithItem:self.box2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    [self addConstraints:constraint1];
    [self addConstraint:constraint2];
    
    NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:self.box2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height];
    [self addConstraint:constraint3];
    
    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.box2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width];
    [self addConstraint:constraint4];
    
}

- (void)addBox3 {
    
    self.box3 = [[UIView alloc]initWithFrame:self.backgroundView.frame];
    
    self.box3.backgroundColor = [UIColor clearColor];
    self.box3.translatesAutoresizingMaskIntoConstraints = NO;
    [self.box3 invalidateIntrinsicContentSize];
    
    self.box3.alpha = 0.5;
    
    self.box3.userInteractionEnabled = YES;
    
    [self.backgroundView addSubview:self.box3];
    
    CGFloat pad = 0, height = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        pad = 8;
        height = 40;
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
    
    CGFloat width = self.backgroundView.frame.size.width / 3 - 5;
    
    
    NSDictionary *viewsDictionary = @{@"back":self.box3};
    NSArray *constraint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[back]-0-|" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[back]-0-|" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    [self addConstraints:constraint1];
    [self addConstraints:constraint2];
    
    NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:self.box3 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height];
    [self addConstraint:constraint3];
    
    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.box3 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width];
    [self addConstraint:constraint4];
    
}


- (void)addIcon1 {
    
    self.icon1 = [[UIImageView alloc]initWithFrame:self.box1.frame];
    
    self.icon1.backgroundColor = [UIColor clearColor];
    self.icon1.translatesAutoresizingMaskIntoConstraints = NO;
    [self.icon1 invalidateIntrinsicContentSize];
    
    self.icon1.alpha = 0.5;
    self.icon1.image = [UIImage imageNamed:@"logo"];
    
    self.icon1.userInteractionEnabled = YES;
    
    [self.box1 addSubview:self.icon1];
    
    CGFloat pad = 0, pad2 = 0, height = 0, width = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        pad = 0;
        pad2 = 3;
        height = 25;
        width = 25;
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
    
    
    
    NSDictionary *viewsDictionary = @{@"icon":self.icon1};
    NSArray *constraint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[icon]-7-|" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-24-[icon]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    [self addConstraints:constraint1];
    [self addConstraints:constraint2];
    
    NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:self.icon1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height];
    [self addConstraint:constraint3];
    
    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.icon1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width];
    [self addConstraint:constraint4];
    
}

- (void)addLabel1{
    
    
    self.Label1 = [[UILabel alloc] init];
    
    [self.Label1 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.Label1 invalidateIntrinsicContentSize];
    self.Label1.textColor = [UIColor lightGrayColor];
    
    self.Label1.text = @"Add";
    
    self.Label1.layer.shadowRadius = 0.05;
    self.Label1.layer.shadowOpacity = 0.05;
    
    self.Label1.layer.masksToBounds = NO;
    
    CGFloat pad = 0, pad2 = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
       self.Label1.font = [UIFont fontWithName:@"ArialHebrew-Light " size:12];

        pad = 13;
        pad2 = 5;
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
    
    [self.box1 addSubview:self.Label1];
    
    NSDictionary *viewsDictionary = @{@"side":self.icon1, @"label" : self.Label1};
    NSArray *constraint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-6-|" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    [self addConstraints:constraint1];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[side]-2-[label]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad2]} views:viewsDictionary];
    [self addConstraints:constraint2];
    
}


- (void)addIcon2 {
    
    self.icon2 = [[UIImageView alloc]initWithFrame:self.box1.frame];
    
    self.icon2.backgroundColor = [UIColor clearColor];
    self.icon2.translatesAutoresizingMaskIntoConstraints = NO;
    [self.icon2 invalidateIntrinsicContentSize];
    
    self.icon2.alpha = 0.5;
    self.icon2.image = [UIImage imageNamed:@"share_icon"];
    
    self.icon2.userInteractionEnabled = YES;
    
    [self.box2 addSubview:self.icon2];
    
    CGFloat pad = 0, pad2 = 0, height = 0, width = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        pad = 0;
        pad2 = 3;
        height = 25;
        width = 25;
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
    
    
    
    NSDictionary *viewsDictionary = @{@"icon":self.icon2};
    NSArray *constraint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[icon]-7-|" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[icon]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    [self addConstraints:constraint1];
    [self addConstraints:constraint2];
    
    NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:self.icon2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height];
    [self addConstraint:constraint3];
    
    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.icon2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width];
    [self addConstraint:constraint4];
    
}

- (void)addLabel2{
    
    
    self.Label2 = [[UILabel alloc] init];
    
    [self.Label2 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.Label2 invalidateIntrinsicContentSize];
    self.Label2.textColor = [UIColor lightGrayColor];
    
    self.Label2.text = @"Share";
    
    self.Label2.layer.shadowRadius = 0.05;
    self.Label2.layer.shadowOpacity = 0.05;
    
    self.Label2.layer.masksToBounds = NO;
    
    CGFloat pad = 0, pad2 = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        self.Label1.font = [UIFont fontWithName:@"ArialHebrew-Light " size:12];
        
        pad = 13;
        pad2 = 5;
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
    
    [self.box2 addSubview:self.Label2];
    
    NSDictionary *viewsDictionary = @{@"side":self.icon2, @"label" : self.Label2};
    NSArray *constraint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-6-|" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    [self addConstraints:constraint1];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[side]-2-[label]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad2]} views:viewsDictionary];
    [self addConstraints:constraint2];
    
}

- (void)addIcon3 {
    
    self.icon3 = [[UIImageView alloc]initWithFrame:self.box1.frame];
    
    self.icon3.backgroundColor = [UIColor clearColor];
    self.icon3.translatesAutoresizingMaskIntoConstraints = NO;
    [self.icon3 invalidateIntrinsicContentSize];
    
    self.icon3.alpha = 0.5;
    self.icon3.image = [UIImage imageNamed:@"settings"];
    
    self.icon3.userInteractionEnabled = YES;
    
    [self.box3 addSubview:self.icon3];
    
    CGFloat pad = 0, pad2 = 0, height = 0, width = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        pad = 0;
        pad2 = 3;
        height = 25;
        width = 25;
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
    
    
    
    NSDictionary *viewsDictionary = @{@"icon":self.icon3, @"label" : self.Label3};
    NSArray *constraint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[icon]-7-|" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[icon]-5-[label]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    [self addConstraints:constraint1];
    [self addConstraints:constraint2];
    
    NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:self.icon3 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height];
    [self addConstraint:constraint3];
    
    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.icon3 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width];
    [self addConstraint:constraint4];
    
}

- (void)addLabel3{
    
    
    self.Label3 = [[UILabel alloc] init];
    
    [self.Label3 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.Label3 invalidateIntrinsicContentSize];
    self.Label3.textColor = [UIColor lightGrayColor];
    
    self.Label3.text = @"Edit";
    
    self.Label3.layer.shadowRadius = 0.05;
    self.Label3.layer.shadowOpacity = 0.05;
    
    self.Label3.layer.masksToBounds = NO;
    
    CGFloat pad = 0, pad2 = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        self.Label1.font = [UIFont fontWithName:@"ArialHebrew-Light " size:12];
        
        pad = 13;
        pad2 = 5;
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
    
    [self.box3 addSubview:self.Label3];
    
    NSDictionary *viewsDictionary = @{@"label" : self.Label3};
    NSArray *constraint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-6-|" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    [self addConstraints:constraint1];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[label]-34-|" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad2]} views:viewsDictionary];
    [self addConstraints:constraint2];
    
}


 - (void)addAdButton{
 
 self.adButton = [[UIButton alloc]init];
     
     self.adButton=[UIButton buttonWithType:UIButtonTypeCustom];

     self.adButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:18];
     
     self.adButton.layer.cornerRadius = 3.0;

     
     
     [self.adButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
     self.adButton.titleEdgeInsets = UIEdgeInsetsMake(15, 0, 15, 0);

 self.adButton.backgroundColor = [UIColor whiteColor];
     self.adButton.layer.borderColor = [UIColor blueColor].CGColor;
     self.adButton.layer.borderWidth = 1;
     
     [self.adButton setTitle:@"View Offer" forState:UIControlStateNormal];
 //  CGFloat width = CGRectGetWidth([[UIScreen mainScreen] bounds]) - 8;
 self.adButton.translatesAutoresizingMaskIntoConstraints = NO;
 [self.adButton invalidateIntrinsicContentSize];


 self.adButton.alpha = 100.0;
 self.adButton.layer.shadowOffset = CGSizeMake(-.1, .2);
 self.adButton.layer.shadowRadius = 0.4;
 self.adButton.layer.shadowOpacity = 0.5;


 //self.adButton.layer.masksToBounds = YES;
 
 [self.backgroundView addSubview:self.adButton];
 

 
 
 
     NSDictionary *viewsDictionary = @{@"icon": self.adButton, @"top": self.Line};
     NSLayoutConstraint *constraint1 = [NSLayoutConstraint constraintWithItem:self.adButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.backgroundView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
     NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[top]-pad-[icon]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:7]} views:viewsDictionary];
     [self addConstraint:constraint1];
     [self addConstraints:constraint2];
 
     NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:self.adButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30];
     [self addConstraint:constraint3];
 
     NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.adButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:135];
     [self addConstraint:constraint4];
 
}

-(UIColor*)lineColor{
 
    return [UIColor colorWithRed:0.91 green:0.91 blue:0.91 alpha:1.0];
 
 
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
