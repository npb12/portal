//
//  UserAlbumsViewController.m
//  portal
//
//  Created by Neil Ballard on 1/4/16.
//  Copyright © 2016 Neil_appworld. All rights reserved.
//

#import "UserAlbumsViewController.h"
#import "DataAccess.h"
#import "DeviceManager.h"
#import "WebViewController.h"

@interface UserAlbumsViewController ()

@property (nonatomic, assign) CGPoint offset;
@property (strong, nonatomic)  UIImageView *propic;
@property (strong, nonatomic)  UIImageView *background;
@property (strong, nonatomic)  UIView *pickbackground;

@end

@implementation UserAlbumsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBarHidden = YES;
    [self.navigationItem setHidesBackButton:YES];
    CGRect fullScreenRect=[[UIScreen mainScreen] bounds];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goBack:)];
    [self.view addGestureRecognizer:tapGesture];
    
    self.facebook = [[DataAccess singletonInstance] getFacebook];
    self.instagram = [[DataAccess singletonInstance] getInstagram];
    self.linkedinId = [[DataAccess singletonInstance] getLinkedin];
    self.snapchat = [[DataAccess singletonInstance] getSnapchat];
    
    self.view.backgroundColor = [UIColor clearColor];
    
    [self addBackground];
    [self addProfileBackground];
    [self addProPhoto];
    
    [self addSocialBackground1];
    
    
    [self addFacebookIcon];
    [self setupFacebookLabel];
    [self setupFacebookSubLabel];
  
    [self addSocialBackground2];
    
    [self addInstagramIcon];
    [self setupInstagramLabel];
    [self setupInstagramSubLabel];
    
    
    [self addSocialBackground3];

    
    [self addLinkedinIcon];
    [self setupLinkedinLabel];
    [self setupLinkedinSubLabel];
   

    
    
    /*    [self setupFBLabel];
     [self setupFBSubLabel];
     
     [self addInstagramIcon];
     [self setupInstagramLabel];
     [self setupInstagramSubLabel];
     
     [self addLinkedinIcon];
     [self setupLinkedinLabel];
     [self setupLinkedinSubLabel];
     
     */
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addBackground{
    
    self.background = [[UIImageView alloc]init];
    
    self.background.image = [[DataAccess singletonInstance]getScreenShot2];
    
    //   self.background.backgroundColor = [UIColor clearColor];
    self.background.translatesAutoresizingMaskIntoConstraints = NO;
    [self.background invalidateIntrinsicContentSize];
    
    
    //  self.background.alpha = 0.95f;
    
    self.background.userInteractionEnabled = YES;
    
    
    
    
    
    [self.view addSubview:self.background];
    
    self.background.layer.masksToBounds = YES;
    self.background.layer.shadowOffset = CGSizeMake(-.1, .2);
    self.background.layer.shadowRadius = .5;
    self.background.layer.shadowOpacity = 0.5;
    
    CGFloat pad = 0, Offset = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        pad = 1.5f;
        Offset = 3;
        //   self.background.layer.cornerRadius = 40;
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6Screen])
    {
        pad = 2;
        Offset = 4;
        //    self.background.layer.cornerRadius = 105;
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6PlusScreen])
    {
        pad = 2.5f;
        Offset = 5;
        //    self.background.layer.cornerRadius = 105;
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone4Screen] || [[DeviceManager sharedInstance] getIsIPad]) {
        pad = 1;
        Offset = 2;
        //    self.background.layer.cornerRadius = 105;
    }
    
    CGFloat width = CGRectGetWidth([[UIScreen mainScreen] bounds]) - Offset;
    CGFloat height = CGRectGetHeight([[UIScreen mainScreen] bounds]) - Offset;
    
    
    
    
    NSDictionary *viewsDictionary = @{@"back":self.background};
    NSLayoutConstraint *constraint1 = [NSLayoutConstraint constraintWithItem:self.background attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-pad-[back]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    [self.view addConstraint:constraint1];
    [self.view addConstraints:constraint2];
    
    NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:self.background attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height];
    [self.view addConstraint:constraint3];
    
    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.background attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width];
    [self.view addConstraint:constraint4];
    
    
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:effect];
    blurView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.background addSubview:blurView];
    
}

- (void)addProfileBackground {
    
    self.pickbackground = [[UIView alloc]initWithFrame:self.view.frame];
    
    self.pickbackground.backgroundColor = [UIColor whiteColor];
    self.pickbackground.translatesAutoresizingMaskIntoConstraints = NO;
    [self.pickbackground invalidateIntrinsicContentSize];
    
    self.pickbackground.layer.masksToBounds = NO;
    self.pickbackground.layer.shadowOffset = CGSizeMake(-.1, .2);
    self.pickbackground.layer.shadowRadius = .5;
    self.pickbackground.layer.shadowOpacity = 0.5;
    
    self.pickbackground.userInteractionEnabled = YES;
    
    
    [self.view addSubview:self.pickbackground];
    
    CGFloat pad = 0, height = 0;
    CGFloat width = 0, pad2 = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        pad = 40;
        height = 88;
        width = 92;
        pad2 = 20;
        self.pickbackground.layer.cornerRadius = 45;
        
        
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
    
    
    
    NSDictionary *viewsDictionary = @{@"back":self.pickbackground};
    NSLayoutConstraint *constraint1 = [NSLayoutConstraint constraintWithItem:self.pickbackground attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    //    NSArray *constraint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-pad-[back]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-pad-[back]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    //  [self addConstraints:constraint1];
    [self.view addConstraint:constraint1];
    [self.view addConstraints:constraint2];
    
    NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:self.pickbackground attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:height];
    [self.view addConstraint:constraint3];
    
    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.pickbackground attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:width];
    [self.view addConstraint:constraint4];
    
}

-(void)addProPhoto{
    
    self.propic = [[UIImageView alloc]init];
    
    self.propic.backgroundColor = [UIColor blueColor];
    self.propic.translatesAutoresizingMaskIntoConstraints = NO;
    [self.propic invalidateIntrinsicContentSize];
    
    NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"ProfileImage"];
    UIImage* image = [UIImage imageWithData:imageData];
    
    
    if (image != nil) {
        self.propic.image = [[DataAccess singletonInstance] getProfileImage];
    }else{
        self.propic.image = [UIImage imageNamed:@"image_placeholder.png"];
    }
    
    self.propic.alpha = 2.0;
    self.propic.clipsToBounds = YES;
    
    
    
    [self.pickbackground addSubview:self.propic];
    
    CGFloat width = 0, height = 0, v_pad = 0, h_pad = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        width = 84;
        height = 80;
        v_pad = 4;
        h_pad = 20;
        self.propic.layer.cornerRadius = 41;
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6Screen])
    {
        width = 35;
        v_pad = 8;
        h_pad = 24;
        self.propic.layer.cornerRadius = 18;
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6PlusScreen])
    {
        width = 38;
        v_pad = 9;
        h_pad = 27;
        self.propic.layer.cornerRadius = 20;
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone4Screen] || [[DeviceManager sharedInstance] getIsIPad]) {
        
        width = 25;
        v_pad = 3;
        h_pad = 20;
        self.propic.layer.cornerRadius = 14;
    }
    
    
    
    NSDictionary *viewsDictionary = @{@"image":self.propic};
    
    NSLayoutConstraint *constraint1 = [NSLayoutConstraint constraintWithItem:self.propic attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-pad-[image]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:v_pad]} views:viewsDictionary];
    [self.view addConstraint:constraint1];
    [self.view addConstraints:constraint2];
    
    NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:self.propic attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height];
    [self.view addConstraint:constraint3];
    
    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.propic attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width];
    [self.view addConstraint:constraint4];
    
}


- (void)setupNameLabel {
    
    
    self.nameLabel = [[UILabel alloc] init];
    [self.nameLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.nameLabel invalidateIntrinsicContentSize];
    self.nameLabel.textColor = [UIColor whiteColor];
    
    NSString *fname = [[[DataAccess singletonInstance] getName] stringByAppendingString:@" "];
    self.nameLabel.text = [fname stringByAppendingString:[[DataAccess singletonInstance] getLName]];
    
    
    self.nameLabel.layer.shadowRadius = 3.0;
    self.nameLabel.layer.shadowOpacity = 0.5;
    
    self.nameLabel.layer.masksToBounds = NO;
    
    self.nameLabel.layer.shouldRasterize = YES;
    
    CGFloat pad = 0, pad2 = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        self.nameLabel.font = [UIFont systemFontOfSize:17];
        pad = 10;
        pad2 = 8;
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6Screen])
    {
        self.nameLabel.font = [UIFont systemFontOfSize:20];
        pad = 12;
        pad2 = 4;
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6PlusScreen])
    {
        pad = 14;
        pad2 = 5;
        self.nameLabel.font = [UIFont systemFontOfSize:22];
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone4Screen] || [[DeviceManager sharedInstance] getIsIPad]) {
        pad = 10;
        pad2 = 3;
        self.nameLabel.font = [UIFont systemFontOfSize:16];
        
    }
    
    self.nameLabel.alpha = 100.0;
    
    [self.view addSubview:self.nameLabel];
    
    NSDictionary *viewsDictionary = @{@"label" : self.nameLabel, @"photo": self.propic};
    NSArray *constraint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[photo]-pad-[label]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    [self.view addConstraints:constraint1];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-pad-|" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad2]} views:viewsDictionary];
    [self.view addConstraints:constraint2];
    
}




- (void)addSocialBackground1 {
    
    self.socialbackground1 = [[UIView alloc]initWithFrame:self.view.frame];
    
    self.socialbackground1.backgroundColor = [UIColor clearColor];
    self.socialbackground1.translatesAutoresizingMaskIntoConstraints = NO;
    [self.socialbackground1 invalidateIntrinsicContentSize];
    
    CGFloat width = CGRectGetWidth([[UIScreen mainScreen] bounds]);
    
    self.socialbackground1.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fbclicked:)];
    [self.socialbackground1 addGestureRecognizer:tapGesture];
    
    [self.view addSubview:self.socialbackground1];
    
    CGFloat pad = 0, height = 0;
    CGFloat pad2 = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        pad = 20;
        height = 90;
        pad2 = 20;
        
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6Screen])
    {
        pad = 8;
        height = 68;
        pad2 = 22;
        
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6PlusScreen])
    {
        pad = 8;
        height = 74;
        pad2 = 23;
        
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone4Screen] || [[DeviceManager sharedInstance] getIsIPad]) {
        pad = 6;
        height = 58;
        pad2 = 19;
    }
    
    
    
    NSDictionary *viewsDictionary = @{@"back":self.socialbackground1, @"top": self.pickbackground};
    NSLayoutConstraint *constraint1 = [NSLayoutConstraint constraintWithItem:self.socialbackground1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[top]-pad-[back]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    //  [self addConstraints:constraint1];
    [self.view addConstraint:constraint1];
    [self.view addConstraints:constraint2];
    
    NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:self.socialbackground1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:height];
    [self.view addConstraint:constraint3];
    
    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.socialbackground1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:width];
    [self.view addConstraint:constraint4];
    
}

-(void)addFacebookIcon{
    
    self.fbIcon = [[UIImageView alloc]init];
    
    self.fbIcon.backgroundColor = [UIColor clearColor];
    self.fbIcon.translatesAutoresizingMaskIntoConstraints = NO;
    [self.fbIcon invalidateIntrinsicContentSize];
    self.fbIcon.image = [UIImage imageNamed:@"facebook"];
    
    
    //    self.fbIcon.image = [[DataAccess singletonInstance] getProfileImage];
    
    self.fbIcon.alpha = 2.0;
    
    
    
    [self.socialbackground1 addSubview:self.fbIcon];
    
    CGFloat width = 0, height = 0, v_pad = 0, h_pad = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        width = 55;
        height = 55;
        v_pad = 4;
        h_pad = 20;
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6Screen])
    {
        width = 35;
        v_pad = 8;
        h_pad = 24;
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6PlusScreen])
    {
        width = 38;
        v_pad = 9;
        h_pad = 27;
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone4Screen] || [[DeviceManager sharedInstance] getIsIPad]) {
        width = 25;
        v_pad = 3;
        h_pad = 20;
    }
    
    
    
    NSDictionary *viewsDictionary = @{@"image":self.fbIcon};
    
    NSLayoutConstraint *constraint1 = [NSLayoutConstraint constraintWithItem:self.fbIcon attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.socialbackground1 attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-pad-[image]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:h_pad]} views:viewsDictionary];
    [self.view addConstraint:constraint1];
    [self.view addConstraints:constraint2];
    
    NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:self.fbIcon attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height];
    [self.view addConstraint:constraint3];
    
    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.fbIcon attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width];
    [self.view addConstraint:constraint4];
    
}

- (void)setupFacebookLabel {
    
    self.fbText = [[UILabel alloc] init];
    
    [self.fbText setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.fbText invalidateIntrinsicContentSize];
    self.fbText.textColor = [UIColor whiteColor];
    
    NSString *fname = [[[DataAccess singletonInstance] getName] stringByAppendingString:@" "];
    self.fbText.text = [fname stringByAppendingString:[[DataAccess singletonInstance] getLName]];
    
    self.fbText.layer.shadowRadius = 3.0;
    self.fbText.layer.shadowOpacity = 0.5;
    
    self.fbText.layer.masksToBounds = NO;
    self.fbText.layer.shouldRasterize = YES;
    
    CGFloat pad = 0, pad2 = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        self.fbText.font = [UIFont fontWithName:@"Arial-BoldMT" size:23];
        pad = 26;
        pad2 = 14;
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
        self.fbText.font = [UIFont systemFontOfSize:20];
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone4Screen] || [[DeviceManager sharedInstance] getIsIPad]) {
        pad = 31;
        pad2 = 1;
        //    self.nameLabel.font = [UIFont systemFontOfSize:4];
        
    }
    
    [self.socialbackground1 addSubview:self.fbText];
    
    NSDictionary *viewsDictionary = @{@"label" : self.fbText, @"side": self.fbIcon};
    NSArray *constraint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[side]-pad-[label]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad2]} views:viewsDictionary];
    [self.view addConstraints:constraint1];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-pad-[label]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    [self.view addConstraints:constraint2];
    
}


- (void)setupFacebookSubLabel {
    
    self.fbSubtext = [[UILabel alloc] init];
    
    [self.fbSubtext setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.fbSubtext invalidateIntrinsicContentSize];
    self.fbSubtext.textColor = [UIColor lightTextColor];
    
    self.fbSubtext.text = @"7 mutual friends";
    self.fbSubtext.layer.shadowRadius = 3.0;
    self.fbSubtext.layer.shadowOpacity = 0.5;
    
    self.fbSubtext.layer.masksToBounds = NO;
    self.fbSubtext.layer.shouldRasterize = YES;
    
    CGFloat pad = 0, pad2 = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        self.fbSubtext.font = [UIFont fontWithName:@"AppleSDGothicNeo-Regular" size:15];
        pad = 1;
        pad2 = 14;
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6Screen])
    {
        pad = 40;
        pad2 = 2;
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6PlusScreen])
    {
        pad = 44;
        pad2 = 1;
        self.fbSubtext.font = [UIFont systemFontOfSize:20];
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone4Screen] || [[DeviceManager sharedInstance] getIsIPad]) {
        pad = 31;
        pad2 = 1;
        
    }
    
    [self.socialbackground1 addSubview:self.fbSubtext];
    
    NSDictionary *viewsDictionary = @{@"top":self.fbText, @"label" : self.fbSubtext, @"side": self.fbIcon};
    NSArray *constraint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[side]-pad-[label]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad2]} views:viewsDictionary];
    [self.view addConstraints:constraint1];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[top]-pad-[label]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    [self.view addConstraints:constraint2];
    
}


- (void)addSocialBackground2 {
    
    self.socialbackground2 = [[UIView alloc]initWithFrame:self.view.frame];
    
    self.socialbackground2.backgroundColor = [UIColor clearColor];
    self.socialbackground2.translatesAutoresizingMaskIntoConstraints = NO;
    [self.socialbackground2 invalidateIntrinsicContentSize];
    
    CGFloat width = CGRectGetWidth([[UIScreen mainScreen] bounds]);
    
    self.socialbackground2.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(instaclicked:)];
    [self.socialbackground2 addGestureRecognizer:tapGesture];
    
    [self.view addSubview:self.socialbackground2];
    
    CGFloat pad = 0, height = 0;
    CGFloat pad2 = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        pad = 0;
        height = 90;
        pad2 = 20;
        
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6Screen])
    {
        pad = 0;
        height = 68;
        pad2 = 22;
        
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6PlusScreen])
    {
        pad = 8;
        height = 74;
        pad2 = 23;
        
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone4Screen] || [[DeviceManager sharedInstance] getIsIPad]) {
        pad = 6;
        height = 58;
        pad2 = 19;
    }
    
    
    
    NSDictionary *viewsDictionary = @{@"back":self.socialbackground2, @"top": self.socialbackground1};
    NSLayoutConstraint *constraint1 = [NSLayoutConstraint constraintWithItem:self.socialbackground2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[top]-pad-[back]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    //  [self addConstraints:constraint1];
    [self.view addConstraint:constraint1];
    [self.view addConstraints:constraint2];
    
    NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:self.socialbackground2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:height];
    [self.view addConstraint:constraint3];
    
    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.socialbackground2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:width];
    [self.view addConstraint:constraint4];
    
}

-(void)addInstagramIcon{
    
    self.instaIcon = [[UIImageView alloc]init];
    
    self.instaIcon.backgroundColor = [UIColor clearColor];
    self.instaIcon.translatesAutoresizingMaskIntoConstraints = NO;
    [self.instaIcon invalidateIntrinsicContentSize];
    self.instaIcon.image = [UIImage imageNamed:@"instagram"];
    
    
    //    self.fbIcon.image = [[DataAccess singletonInstance] getProfileImage];
    
    self.instaIcon.alpha = 2.0;
    
    
    
    [self.socialbackground2 addSubview:self.instaIcon];
    
    CGFloat width = 0, height = 0, v_pad = 0, h_pad = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        width = 55;
        height = 55;
        v_pad = 4;
        h_pad = 20;
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6Screen])
    {
        width = 35;
        v_pad = 8;
        h_pad = 24;
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6PlusScreen])
    {
        width = 38;
        v_pad = 9;
        h_pad = 27;
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone4Screen] || [[DeviceManager sharedInstance] getIsIPad]) {
        width = 25;
        v_pad = 3;
        h_pad = 20;
    }
    
    
    
    NSDictionary *viewsDictionary = @{@"image":self.instaIcon};
    
    NSLayoutConstraint *constraint1 = [NSLayoutConstraint constraintWithItem:self.instaIcon attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.socialbackground2 attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-pad-[image]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:h_pad]} views:viewsDictionary];
    [self.view addConstraint:constraint1];
    [self.view addConstraints:constraint2];
    
    NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:self.instaIcon attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height];
    [self.view addConstraint:constraint3];
    
    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.instaIcon attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width];
    [self.view addConstraint:constraint4];
    
}

- (void)setupInstagramLabel {
    
    self.instaText = [[UILabel alloc] init];
    
    [self.instaText setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.instaText invalidateIntrinsicContentSize];
    self.instaText.textColor = [UIColor whiteColor];
    
    self.instaText.text = @"@_ryanpowers_";
    self.instaText.layer.shadowRadius = 3.0;
    self.instaText.layer.shadowOpacity = 0.5;
    
    self.instaText.layer.masksToBounds = NO;
    self.instaText.layer.shouldRasterize = YES;
    
    CGFloat pad = 0, pad2 = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        self.instaText.font = [UIFont fontWithName:@"Arial-BoldMT" size:23];
        pad = 26;
        pad2 = 14;
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
        self.instaText.font = [UIFont systemFontOfSize:20];
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone4Screen] || [[DeviceManager sharedInstance] getIsIPad]) {
        pad = 31;
        pad2 = 1;
        //    self.nameLabel.font = [UIFont systemFontOfSize:4];
        
    }
    
    [self.socialbackground2 addSubview:self.instaText];
    
    NSDictionary *viewsDictionary = @{@"label" : self.instaText, @"side": self.instaIcon};
    NSArray *constraint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[side]-pad-[label]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad2]} views:viewsDictionary];
    [self.view addConstraints:constraint1];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-pad-[label]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    [self.view addConstraints:constraint2];
    
}


- (void)setupInstagramSubLabel {
    
    self.instaSubtext = [[UILabel alloc] init];
    
    [self.instaSubtext setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.instaSubtext invalidateIntrinsicContentSize];
    self.instaSubtext.textColor = [UIColor lightTextColor];
    
    self.instaSubtext.text = @"322 Followers | Following 153";
    self.instaSubtext.layer.shadowRadius = 3.0;
    self.instaSubtext.layer.shadowOpacity = 0.5;
    
    self.instaSubtext.layer.masksToBounds = NO;
    self.instaSubtext.layer.shouldRasterize = YES;
    
    CGFloat pad = 0, pad2 = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        self.instaSubtext.font = [UIFont fontWithName:@"AppleSDGothicNeo-Regular" size:15];
        pad = 2;
        pad2 = 14;
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6Screen])
    {
        pad = 40;
        pad2 = 2;
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6PlusScreen])
    {
        pad = 44;
        pad2 = 1;
        self.instaSubtext.font = [UIFont systemFontOfSize:20];
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone4Screen] || [[DeviceManager sharedInstance] getIsIPad]) {
        pad = 31;
        pad2 = 1;
        
    }
    
    [self.socialbackground2 addSubview:self.instaSubtext];
    
    NSDictionary *viewsDictionary = @{@"top":self.instaText, @"label" : self.instaSubtext, @"side": self.instaIcon};
    NSArray *constraint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[side]-pad-[label]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad2]} views:viewsDictionary];
    [self.view addConstraints:constraint1];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[top]-pad-[label]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    [self.view addConstraints:constraint2];
    
}


- (void)addSocialBackground3 {
    
    self.socialbackground3 = [[UIView alloc]initWithFrame:self.view.frame];
    
    self.socialbackground3.backgroundColor = [UIColor clearColor];
    self.socialbackground3.translatesAutoresizingMaskIntoConstraints = NO;
    [self.socialbackground3 invalidateIntrinsicContentSize];
    
    CGFloat width = CGRectGetWidth([[UIScreen mainScreen] bounds]);
    
    self.socialbackground3.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(linkclicked:)];
    [self.socialbackground3 addGestureRecognizer:tapGesture];
    
    [self.view addSubview:self.socialbackground3];
    
    CGFloat pad = 0, height = 0;
    CGFloat pad2 = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        pad = 0;
        height = 90;
        pad2 = 20;
        
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6Screen])
    {
        pad = 0;
        height = 68;
        pad2 = 22;
        
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6PlusScreen])
    {
        pad = 8;
        height = 74;
        pad2 = 23;
        
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone4Screen] || [[DeviceManager sharedInstance] getIsIPad]) {
        pad = 6;
        height = 58;
        pad2 = 19;
    }
    
    
    
    NSDictionary *viewsDictionary = @{@"back":self.socialbackground3, @"top": self.socialbackground2};
    NSLayoutConstraint *constraint1 = [NSLayoutConstraint constraintWithItem:self.socialbackground3 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[top]-pad-[back]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    //  [self addConstraints:constraint1];
    [self.view addConstraint:constraint1];
    [self.view addConstraints:constraint2];
    
    NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:self.socialbackground3 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:height];
    [self.view addConstraint:constraint3];
    
    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.socialbackground3 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:width];
    [self.view addConstraint:constraint4];
    
}



-(void)addLinkedinIcon{
    
    self.linkedinIcon = [[UIImageView alloc]init];
    
    self.linkedinIcon.backgroundColor = [UIColor clearColor];
    self.linkedinIcon.translatesAutoresizingMaskIntoConstraints = NO;
    [self.linkedinIcon invalidateIntrinsicContentSize];
    self.linkedinIcon.image = [UIImage imageNamed:@"linkedin"];
    
    
    //    self.fbIcon.image = [[DataAccess singletonInstance] getProfileImage];
    
    self.linkedinIcon.alpha = 2.0;
    
    
    
    [self.socialbackground3 addSubview:self.linkedinIcon];
    
    CGFloat width = 0, height = 0, v_pad = 0, h_pad = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        width = 55;
        height = 55;
        v_pad = 4;
        h_pad = 20;
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6Screen])
    {
        width = 35;
        v_pad = 8;
        h_pad = 24;
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6PlusScreen])
    {
        width = 38;
        v_pad = 9;
        h_pad = 27;
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone4Screen] || [[DeviceManager sharedInstance] getIsIPad]) {
        width = 25;
        v_pad = 3;
        h_pad = 20;
    }
    
    
    
    NSDictionary *viewsDictionary = @{@"image":self.linkedinIcon};
    
    NSLayoutConstraint *constraint1 = [NSLayoutConstraint constraintWithItem:self.linkedinIcon attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.socialbackground3 attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-pad-[image]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:h_pad]} views:viewsDictionary];
    [self.view addConstraint:constraint1];
    [self.view addConstraints:constraint2];
    
    NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:self.linkedinIcon attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height];
    [self.view addConstraint:constraint3];
    
    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.linkedinIcon attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width];
    [self.view addConstraint:constraint4];
    
}

- (void)setupLinkedinLabel {
    
    self.linkedinText = [[UILabel alloc] init];
    
    [self.linkedinText setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.linkedinText invalidateIntrinsicContentSize];
    self.linkedinText.textColor = [UIColor whiteColor];
    
    NSString *fname = [[[DataAccess singletonInstance] getName] stringByAppendingString:@" "];
    self.linkedinText.text = [fname stringByAppendingString:[[DataAccess singletonInstance] getLName]];
    self.linkedinText.layer.shadowRadius = 3.0;
    self.linkedinText.layer.shadowOpacity = 0.5;
    
    self.linkedinText.layer.masksToBounds = NO;
    self.linkedinText.layer.shouldRasterize = YES;
    
    CGFloat pad = 0, pad2 = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        self.linkedinText.font = [UIFont fontWithName:@"Arial-BoldMT" size:23];
        pad = 26;
        pad2 = 14;
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
        self.linkedinText.font = [UIFont systemFontOfSize:20];
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone4Screen] || [[DeviceManager sharedInstance] getIsIPad]) {
        pad = 31;
        pad2 = 1;
        //    self.nameLabel.font = [UIFont systemFontOfSize:4];
        
    }
    
    [self.socialbackground3 addSubview:self.linkedinText];
    
    NSDictionary *viewsDictionary = @{@"label" : self.linkedinText, @"side": self.linkedinIcon};
    NSArray *constraint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[side]-pad-[label]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad2]} views:viewsDictionary];
    [self.view addConstraints:constraint1];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-pad-[label]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    [self.view addConstraints:constraint2];
    
}


- (void)setupLinkedinSubLabel {
    
    self.linkedinSubtext = [[UILabel alloc] init];
    
    [self.linkedinSubtext setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.linkedinSubtext invalidateIntrinsicContentSize];
    self.linkedinSubtext.textColor = [UIColor lightTextColor];
    
    self.linkedinSubtext.text = @"Works at VMWare";
    self.linkedinSubtext.layer.shadowRadius = 3.0;
    self.linkedinSubtext.layer.shadowOpacity = 0.5;
    
    self.linkedinSubtext.layer.masksToBounds = NO;
    self.linkedinSubtext.layer.shouldRasterize = YES;
    
    CGFloat pad = 0, pad2 = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        self.linkedinSubtext.font = [UIFont fontWithName:@"AppleSDGothicNeo-Regular" size:15];
        pad = 1;
        pad2 = 14;
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6Screen])
    {
        pad = 40;
        pad2 = 2;
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6PlusScreen])
    {
        pad = 44;
        pad2 = 1;
        self.fbSubtext.font = [UIFont systemFontOfSize:20];
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone4Screen] || [[DeviceManager sharedInstance] getIsIPad]) {
        pad = 31;
        pad2 = 1;
        
    }
    
    [self.socialbackground3 addSubview:self.linkedinSubtext];
    
    NSDictionary *viewsDictionary = @{@"top":self.linkedinText, @"label" : self.linkedinSubtext, @"side": self.linkedinIcon};
    NSArray *constraint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[side]-pad-[label]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad2]} views:viewsDictionary];
    [self.view addConstraints:constraint1];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[top]-pad-[label]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    [self.view addConstraints:constraint2];
    
}


/*
 - (void)addFacebookIcon{
 
 self.facebookIcon = [[UIButton alloc]initWithFrame:self.pic.frame];
 UIImage *image = [UIImage imageNamed:@"facebook_icon"];
 
 self.facebookIcon.backgroundColor = [UIColor blackColor];
 //  CGFloat width = CGRectGetWidth([[UIScreen mainScreen] bounds]) - 8;
 self.facebookIcon.translatesAutoresizingMaskIntoConstraints = NO;
 [self.facebookIcon invalidateIntrinsicContentSize];
 
 [self.facebookIcon setBackgroundImage:image forState:UIControlStateNormal];
 
 if (self.facebook != nil && [[DataAccess singletonInstance] useFBOption]) {
 self.facebookIcon.userInteractionEnabled = YES;
 [self.facebookIcon
 addTarget:self
 action:@selector(FacebookButtonClicked) forControlEvents:UIControlEventTouchUpInside];
 self.facebookIcon.alpha = 100.0;
 self.facebookIcon.layer.shadowOffset = CGSizeMake(-.1, .2);
 self.facebookIcon.layer.shadowRadius = 4.0;
 self.facebookIcon.layer.shadowOpacity = 0.5;
 }else{
 self.facebookIcon.userInteractionEnabled = NO;
 self.facebookIcon.alpha = 0.2;
 }
 
 
 [self.facebookIcon setBackgroundColor:[UIColor  clearColor]];
 
 self.facebookIcon.layer.masksToBounds = YES;
 
 [self.view addSubview:self.facebookIcon];
 
 CGFloat pad = 0, height = 0, pad2 = 0;
 if([[DeviceManager sharedInstance] getIsIPhone5Screen])
 {
 pad = 60;
 height = 30;
 pad2 = 75;
 }
 else if ([[DeviceManager sharedInstance] getIsIPhone6Screen])
 {
 pad = 80;
 height = 34;
 pad2 = 100;
 }
 else if ([[DeviceManager sharedInstance] getIsIPhone6PlusScreen])
 {
 pad = 85;
 height = 36;
 pad2 = 115;
 }
 else if ([[DeviceManager sharedInstance] getIsIPhone4Screen] || [[DeviceManager sharedInstance] getIsIPad]) {
 pad = 60;
 pad2 = 85;
 height = 25;
 }
 
 
 
 NSDictionary *viewsDictionary = @{@"icon": self.facebookIcon};
 NSArray *constraint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-pad-[icon]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad2]} views:viewsDictionary];
 NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[icon]-pad-|" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
 [self.view addConstraints:constraint1];
 [self.view addConstraints:constraint2];
 
 NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:self.facebookIcon attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height];
 [self.view addConstraint:constraint3];
 
 NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.facebookIcon attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height];
 [self.view addConstraint:constraint4];
 
 }
 
 - (void)addInstagramIcon{
 
 self.instagramIcon = [[UIButton alloc]init];
 
 self.instagramIcon.backgroundColor = [UIColor blackColor];
 //  CGFloat width = CGRectGetWidth([[UIScreen mainScreen] bounds]) - 8;
 self.instagramIcon.translatesAutoresizingMaskIntoConstraints = NO;
 [self.instagramIcon invalidateIntrinsicContentSize];
 
 UIImage *image = [UIImage imageNamed:@"instagram_icon"];
 
 [self.instagramIcon setBackgroundColor:[UIColor  clearColor]];
 [self.instagramIcon setBackgroundImage:image forState:UIControlStateNormal];
 
 
 
 if (self.instagram != nil) {
 
 self.instagramIcon.alpha =100.0;
 self.instagramIcon.userInteractionEnabled = YES;
 [self.instagramIcon
 addTarget:self
 action:@selector(InstagramButtonClicked) forControlEvents:UIControlEventTouchUpInside];
 self.instagramIcon.layer.shadowOffset = CGSizeMake(-.1, .2);
 self.instagramIcon.layer.shadowRadius = 4.0;
 self.instagramIcon.layer.shadowOpacity = 0.5;
 
 }else{
 self.instagramIcon.userInteractionEnabled = NO;
 self.instagramIcon.alpha = 0.2;
 }
 
 
 
 self.instagramIcon.layer.masksToBounds = NO;
 //    self.socialbackground.layer.shadowOffset = CGSizeMake(-.1, .2);
 //    self.socialbackground.layer.shadowRadius = .5;
 //    self.socialbackground.layer.shadowOpacity = 0.5;
 
 [self.instagramIcon
 addTarget:self
 action:@selector(InstagramButtonClicked) forControlEvents:UIControlEventTouchUpInside];
 
 
 [self.view addSubview:self.instagramIcon];
 
 CGFloat pad = 0, pad2 = 0, height = 0;
 if([[DeviceManager sharedInstance] getIsIPhone5Screen])
 {
 pad = 60;
 height = 30;
 pad2 = 15;
 
 }
 else if ([[DeviceManager sharedInstance] getIsIPhone6Screen])
 {
 pad = 80;
 height = 34;
 pad2 = 17;
 
 }
 else if ([[DeviceManager sharedInstance] getIsIPhone6PlusScreen])
 {
 pad = 85;
 height = 36;
 pad2 = 19;
 
 }
 else if ([[DeviceManager sharedInstance] getIsIPhone4Screen] || [[DeviceManager sharedInstance] getIsIPad]) {
 
 height = 25;
 pad = 60;
 pad2 = 13;
 
 }
 
 
 
 NSDictionary *viewsDictionary = @{@"icon": self.instagramIcon, @"fb": self.facebookIcon};
 NSArray *constraint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[fb]-pad-[icon]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad2]} views:viewsDictionary];
 NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[icon]-pad-|" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
 [self.view addConstraints:constraint1];
 [self.view addConstraints:constraint2];
 
 NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:self.instagramIcon attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height];
 [self.view addConstraint:constraint3];
 
 NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.instagramIcon attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height];
 [self.view addConstraint:constraint4];
 
 }
 
 
 - (void)addLinkedinIcon{
 
 self.linkedinIcon = [[UIButton alloc]init];
 
 self.linkedinIcon.backgroundColor = [UIColor blackColor];
 //  CGFloat width = CGRectGetWidth([[UIScreen mainScreen] bounds]) - 8;
 self.linkedinIcon.translatesAutoresizingMaskIntoConstraints = NO;
 [self.linkedinIcon invalidateIntrinsicContentSize];
 
 UIImage *image = [UIImage imageNamed:@"linkedin_icon"];
 
 [self.linkedinIcon setBackgroundImage:image forState:UIControlStateNormal];
 
 [self.linkedinIcon setBackgroundColor:[UIColor  clearColor]];
 
 self.linkedinIcon.layer.masksToBounds = NO;
 
 
 if (self.linkedinId != nil && [[DataAccess singletonInstance] uselinkedinOption]) {
 
 self.linkedinIcon.alpha =100.0;
 self.linkedinIcon.userInteractionEnabled = YES;
 [self.linkedinIcon
 addTarget:self
 action:@selector(LinkedinButtonClicked) forControlEvents:UIControlEventTouchUpInside];
 
 self.linkedinIcon.layer.shadowOffset = CGSizeMake(-.1, .2);
 self.linkedinIcon.layer.shadowRadius = 4.0;
 self.linkedinIcon.layer.shadowOpacity = 0.5;
 
 }else{
 self.linkedinIcon.userInteractionEnabled = NO;
 self.linkedinIcon.alpha = 0.2;
 }
 
 
 [self.view addSubview:self.linkedinIcon];
 
 CGFloat pad = 0, pad2 = 0, height = 0;
 if([[DeviceManager sharedInstance] getIsIPhone5Screen])
 {
 pad = 60;
 height = 30;
 pad2 = 15;
 
 }
 else if ([[DeviceManager sharedInstance] getIsIPhone6Screen])
 {
 pad = 80;
 height = 34;
 pad2 = 17;
 
 }
 else if ([[DeviceManager sharedInstance] getIsIPhone6PlusScreen])
 {
 pad = 85;
 height = 36;
 pad2 = 19;
 
 }
 else if ([[DeviceManager sharedInstance] getIsIPhone4Screen] || [[DeviceManager sharedInstance] getIsIPad]) {
 
 height = 25;
 pad = 60;
 pad2 = 13;
 
 }
 
 
 
 NSDictionary *viewsDictionary = @{@"icon": self.instagramIcon, @"link": self.linkedinIcon};
 NSArray *constraint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[icon]-pad-[link]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad2]} views:viewsDictionary];
 NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[link]-pad-|" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
 [self.view addConstraints:constraint1];
 [self.view addConstraints:constraint2];
 
 NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:self.linkedinIcon attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height];
 [self.view addConstraint:constraint3];
 
 NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.linkedinIcon attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height];
 [self.view addConstraint:constraint4];
 
 }
 
 
 
 
 
 - (void)addSnapchatIcon{
 
 self.snapchatIcon = [[UIButton alloc]init];
 
 self.snapchatIcon.backgroundColor = [UIColor blackColor];
 //  CGFloat width = CGRectGetWidth([[UIScreen mainScreen] bounds]) - 8;
 self.snapchatIcon.translatesAutoresizingMaskIntoConstraints = NO;
 [self.snapchatIcon invalidateIntrinsicContentSize];
 
 
 if (self.snapchat != nil) {
 
 self.snapchatIcon.alpha =100.0;
 self.snapchatIcon.userInteractionEnabled = YES;
 [self.snapchatIcon
 addTarget:self
 action:@selector(SnapchatButtonClicked) forControlEvents:UIControlEventTouchUpInside];
 self.snapchatIcon.layer.shadowOffset = CGSizeMake(-.1, .2);
 self.snapchatIcon.layer.shadowRadius = 4.0;
 self.snapchatIcon.layer.shadowOpacity = 0.5;
 
 }else{
 self.snapchatIcon.userInteractionEnabled = NO;
 self.snapchatIcon.alpha = 0.2;
 }
 
 
 
 UIImage *image = [UIImage imageNamed:@"snapchat_icon"];
 
 [self.snapchatIcon setBackgroundImage:image forState:UIControlStateNormal];
 
 [self.snapchatIcon setBackgroundColor:[UIColor  clearColor]];
 
 
 
 self.snapchatIcon.layer.masksToBounds = NO;
 //    self.socialbackground.layer.shadowOffset = CGSizeMake(-.1, .2);
 //    self.socialbackground.layer.shadowRadius = .5;
 //    self.socialbackground.layer.shadowOpacity = 0.5;
 
 
 [self.view addSubview:self.snapchatIcon];
 
 CGFloat pad = 0, pad2 = 0, height = 0;
 if([[DeviceManager sharedInstance] getIsIPhone5Screen])
 {
 pad = 60;
 height = 30;
 pad2 = 15;
 
 }
 else if ([[DeviceManager sharedInstance] getIsIPhone6Screen])
 {
 pad = 80;
 height = 34;
 pad2 = 17;
 
 }
 else if ([[DeviceManager sharedInstance] getIsIPhone6PlusScreen])
 {
 pad = 85;
 height = 36;
 pad2 = 19;
 
 }
 else if ([[DeviceManager sharedInstance] getIsIPhone4Screen] || [[DeviceManager sharedInstance] getIsIPad]) {
 
 height = 25;
 pad = 60;
 pad2 = 13;
 
 }
 
 
 
 NSDictionary *viewsDictionary = @{@"icon": self.linkedinIcon, @"snap": self.snapchatIcon};
 NSArray *constraint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[icon]-pad-[snap]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad2]} views:viewsDictionary];
 NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[snap]-pad-|" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
 [self.view addConstraints:constraint1];
 [self.view addConstraints:constraint2];
 
 NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:self.snapchatIcon attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height];
 [self.view addConstraint:constraint3];
 
 NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.snapchatIcon attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height];
 [self.view addConstraint:constraint4];
 
 }
 */






-(IBAction)goBack:(id)sender{
    [self dismissViewControllerAnimated:NO completion:nil];
}

-(IBAction)fbclicked:(id)sender{
    
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
        
        WebViewController *album = [[WebViewController alloc] init];
        [self.navigationItem setHidesBackButton:NO];
        [self.navigationController setNavigationBarHidden:NO animated:NO];
        [self.navigationController pushViewController:album animated:NO];
        
    }
}


-(IBAction)linkclicked:(id)sender{
    
    NSString *url = @"linkedin://";
    NSURL *linkedinOpenURL = [NSURL URLWithString:url];
    
    
    if ([[UIApplication sharedApplication] openURL:linkedinOpenURL]) {
        
        [[LISDKDeeplinkHelper sharedInstance] viewOtherProfile:self.linkedinId withState:self.linkedinId showGoToAppStoreDialog:YES success:nil error:nil];
        
    }else{
        
        WebViewController *album = [[WebViewController alloc] init];
        [self.navigationItem setHidesBackButton:NO];
        [self.navigationController setNavigationBarHidden:NO animated:NO];
        [self.navigationController pushViewController:album animated:NO];
        
    } 
}

-(IBAction)instaclicked:(id)sender{
    
    NSString *insta =  @"_ryanpowers_"; //[[DataAccess singletonInstance] getInstagram];
    NSString *url = @"instagram://user?username=";
    NSString *bURL = [url stringByAppendingString:insta];
    NSURL *instagramURL = [NSURL URLWithString:bURL];
    //NSURL *instagramURL = [bUrl URLByAppendingPathComponent:insta];
    
    NSLog(@"%@", instagramURL);
    NSLog(@"%@", insta);
    
    if ([[UIApplication sharedApplication] openURL:instagramURL]) {
        NSLog(@"trying to open");
        [[UIApplication sharedApplication] openURL:instagramURL];
    }else{
        
        WebViewController *album = [[WebViewController alloc] init];
        [self.navigationItem setHidesBackButton:NO];
        [self.navigationController setNavigationBarHidden:NO animated:NO];
        [self.navigationController pushViewController:album animated:NO];
        
        
    }
}

@end
