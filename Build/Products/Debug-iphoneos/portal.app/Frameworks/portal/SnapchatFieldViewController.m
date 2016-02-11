//
//  SnapchatFieldViewController.m
//  portal
//
//  Created by Neil Ballard on 10/29/15.
//  Copyright © 2015 Neil_appworld. All rights reserved.
//

#import "SnapchatFieldViewController.h"
#import "DataAccess.h"

@interface SnapchatFieldViewController ()

@property (nonatomic, retain) UIView * background;
@property (nonatomic, retain) UIView * Line;
@property (nonatomic, retain) UIView * firstLine;
@property (nonatomic, retain) UIImageView * background_image;
@property (nonatomic,unsafe_unretained) CGRect mainScreenBounds;
@property (nonatomic, retain) UIImageView * checkbox;
@property (nonatomic, retain) UILabel *optionLabel;
@property (nonatomic, retain) UINavigationBar * navBar;


@end

@implementation SnapchatFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mainScreenBounds = [[UIScreen mainScreen]bounds];
    
    
    self.background = [[UIView alloc] initWithFrame:self.mainScreenBounds];
    self.background.hidden = NO;
    self.background.backgroundColor = [self grayColor];
    self.background.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:self.background];
    
    
    [self styleNavBar];
    [self initViewItems];
    //   [self addLogo];
    
    //   [self setupTopLabel];
    [self setupnetworkLabel];
    [self addFirstLine];
    [self setupnetworkTextField];
    [self addBox];
    [self setupoptionLabel];
    [self addLine];
}

- (void)initViewItems {
    self.networkTextField = [[UITextField alloc] init];
    [self.view addSubview:self.networkTextField];
    
    
    self.Line = [[UIView alloc] init];
    [self.view addSubview:self.Line];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupnetworkLabel {
    UIFont *font;
    
    CGFloat height = 0;
    
    self.networksLabel = [[UILabel alloc] init];
    
    self.networksLabel.font = [UIFont systemFontOfSize:5];
    height = 15;
    
    
    
    [self.networksLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.networksLabel invalidateIntrinsicContentSize];
    self.networksLabel.font = font;
    self.networksLabel.textColor = [UIColor lightGrayColor];
    
    self.networksLabel.text = @"Snapchat";
    
    [self.view addSubview:self.networksLabel];
    
    NSDictionary *viewsDictionary = @{@"top":self.navBar, @"label" : self.networksLabel};
    NSArray *constraint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-17-[label]" options:0 metrics:nil views:viewsDictionary];
    [self.view addConstraints:constraint1];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[top]-6-[label]" options:0 metrics:nil views:viewsDictionary];
    [self.view addConstraints:constraint2];
    
}


- (void)addFirstLine{
    
    self.firstLine = [[UIView alloc]init];
    
    self.firstLine.backgroundColor = [self lineColor];
    CGFloat width = CGRectGetWidth([[UIScreen mainScreen] bounds]);
    self.firstLine.translatesAutoresizingMaskIntoConstraints = NO;
    [self.firstLine invalidateIntrinsicContentSize];
    
    
    
    [self.view addSubview:self.firstLine];
    
    CGFloat pad = 0, height = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        pad = 2;
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
    
    
    
    NSDictionary *viewsDictionary = @{@"top":self.networksLabel, @"line": self.firstLine};
    NSLayoutConstraint *constraint1 = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.firstLine attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[top]-pad-[line]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    [self.view addConstraint:constraint1];
    [self.view addConstraints:constraint2];
    
    NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:self.firstLine attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height];
    [self.view addConstraint:constraint3];
    
    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.firstLine attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width];
    [self.view addConstraint:constraint4];
    
}



-(void)addLine{
    
    
    self.Line.backgroundColor = [self lineColor];
    
    CGFloat width = self.mainScreenBounds.size.width - 20;
    CGFloat height = 0;
    
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        height = 1;
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6Screen])
    {
        height = 1;
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6PlusScreen])
    {
        height = 1;
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone4Screen] || [[DeviceManager sharedInstance] getIsIPad])
    {
        height = 1;
    }
    
    [self.Line setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.Line invalidateIntrinsicContentSize];
    
    UIImageView *top = self.checkbox;
    NSDictionary *viewsDictionary = @{@"top":top, @"line" : self.Line};
    NSArray *constraint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[line(width)]"
                                                                   options:0 metrics:@{@"width":[NSNumber numberWithFloat:width]} views:viewsDictionary];
    [self.view addConstraints:constraint1];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[top]-25-[line]" options:0 metrics:nil views:viewsDictionary];
    [self.view addConstraints:constraint2];
    
    /*
     [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.Line attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width]];
     */
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.Line attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height]];
}




- (void)setupnetworkTextField {
    self.networkTextField.delegate = self;
    self.networkTextField.layer.cornerRadius = 7.0;
    self.networkTextField.translatesAutoresizingMaskIntoConstraints = NO;
    [self.networkTextField invalidateIntrinsicContentSize];
    
    if ([[DataAccess singletonInstance] getSnapchat] != nil) {
        self.networkTextField.text = [[DataAccess singletonInstance] getSnapchat];
    }
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    CGFloat height = 0, width = 0, xpad = 0, ypad = 0;
    width = screen.size.width - 30;
    
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        self.networkTextField.font = [UIFont fontWithName:@"HelveticaNeue" size:ceilf(32/2)];
        height = 40;
        xpad = 15;
        ypad = 8;
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6Screen])
    {
        self.networkTextField.font = [UIFont fontWithName:@"HelveticaNeue" size:ceilf(38/2)];
        height = 35;
        xpad = 15;
        ypad = 10;
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6PlusScreen])
    {
        self.networkTextField.font = [UIFont fontWithName:@"HelveticaNeue" size:ceilf(62/3)];
        height = 45;
        xpad = 15;
        ypad = 10;
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone4Screen] || [[DeviceManager sharedInstance] getIsIPad])
    {
        self.networkTextField.font = [UIFont fontWithName:@"HelveticaNeue" size:ceilf(28/2)];
        height = 30;
        xpad = 15;
        ypad = 0;
    }
    
    self.networkTextField.backgroundColor = [UIColor whiteColor];
    self.networkTextField.layer.borderColor = [UIColor blackColor].CGColor;
    self.networkTextField.layer.borderWidth = 1;
    self.networkTextField.layer.masksToBounds = true;
    
    NSMutableDictionary *viewsDictionary = [[NSMutableDictionary alloc] init];
    [viewsDictionary setObject:self.networkTextField forKey:@"textField"];
    [viewsDictionary setObject:self.firstLine forKey:@"label"];
    
    NSArray *hConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-xpad-[textField]" options:0 metrics:@{@"xpad" : [NSNumber numberWithFloat:xpad], @"width" : [NSNumber numberWithFloat:width]} views:viewsDictionary];
    NSArray *vConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-pad-[textField(height)]" options:0 metrics:@{@"height" : [NSNumber numberWithFloat:height], @"pad" : [NSNumber numberWithFloat:ypad]} views:viewsDictionary];
    
    [self.view addConstraints:hConstraints];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.networkTextField attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width]];
    
    [self.view addConstraints:vConstraints];
    
}


- (void)addBox {
    
    
    self.checkbox = [[UIImageView alloc] init];
    self.checkbox.translatesAutoresizingMaskIntoConstraints = NO;
    [self.checkbox invalidateIntrinsicContentSize];
    
    self.checkbox.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(boxPressed:)];
    [self.checkbox addGestureRecognizer:tapGesture];
    
    if([[DataAccess singletonInstance] snapchatIsPublic]){
        
        self.checkbox.image = [UIImage imageNamed:@"checkedbox.png"];
        
        
    }else{
        self.checkbox.image = [UIImage imageNamed:@"checkbox.png"];
    }
    
    
    CGFloat pad, pad1 = 0, pad2, height = 0, width = 0;
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        pad1 = 10;
        pad = 20;
        pad2 = 25;
        height = 20;
        width = 20;
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6Screen])
    {
        pad = 20;
        height = 25;
        width = 25;
        pad2 = 25;
        pad1 = 10;
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6PlusScreen])
    {
        pad = 20;
        height = 25;
        width = 25;
        pad2 = 25;
        
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone4Screen] || [[DeviceManager sharedInstance] getIsIPad]) {
        pad = 20;
        height = 25;
        width = 25;
        pad2 = 25;
        pad1 = 10;
        
    }
    
    
    [self.view addSubview:self.checkbox];
    
    
    NSDictionary *viewsDictionary = @{@"box":self.checkbox, @"top": self.networkTextField};
    NSArray *constraint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-pad-[box]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad2]} views:viewsDictionary];
    NSArray *constraint5 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[top]-pad1-[box]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad], @"pad1":[NSNumber numberWithFloat:pad1]} views:viewsDictionary];
    [self.view addConstraints:constraint1];
    [self.view addConstraints:constraint5];
    
    NSLayoutConstraint *constraint6 = [NSLayoutConstraint constraintWithItem:self.checkbox attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height];
    [self.view addConstraint:constraint6];
    
    NSLayoutConstraint *constraint7 = [NSLayoutConstraint constraintWithItem:self.checkbox attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width];
    [self.view addConstraint:constraint7];
    
    
    
}

- (void)setupoptionLabel {
    UIFont *font;
    CGFloat height = 0;
    
    self.optionLabel = [[UILabel alloc] init];
    
    CGFloat pad = 10, pad2 = 8;
    
    self.optionLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:13];
    height = 15;
    
    
    
    [self.optionLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.optionLabel invalidateIntrinsicContentSize];
    self.optionLabel.font = font;
    self.optionLabel.textColor = [UIColor blackColor];
    
    self.optionLabel.text = @"public";
    
    [self.view addSubview:self.optionLabel];
    
    
    NSDictionary *viewsDictionary = @{@"label":self.optionLabel, @"image" : self.checkbox, @"textField": self.networkTextField};
    NSLayoutConstraint *constraint1 = [NSLayoutConstraint constraintWithItem:self.optionLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.checkbox attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:pad2];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[textField]-pad-[label]" options:0 metrics:@{@"pad":[NSNumber numberWithFloat:pad]} views:viewsDictionary];
    [self.view addConstraint:constraint1];
    [self.view addConstraints:constraint2];
    
}

- (void)boxPressed:(id)sender {
    
    if([[DataAccess singletonInstance] snapchatIsPublic]){
        self.checkbox.image = [UIImage imageNamed:@"checkbox.png"];
        [[DataAccess singletonInstance] setsnapchatPublicStatus:NO];
        
    }else{
        self.checkbox.image = [UIImage imageNamed:@"checkedbox.png"];
        [[DataAccess singletonInstance] setsnapchatPublicStatus:YES];
    }
    
}



- (void)textFieldDidChange {
    //
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [textField setReturnKeyType:UIReturnKeyDone];
    return TRUE;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.networkTextField resignFirstResponder];
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    [[DataAccess singletonInstance] setSnapchat:self.networkTextField.text];
    [self.networkTextField resignFirstResponder];
    [self.networkTextField endEditing:YES];
}


- (void)touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
    NSArray *subviews = [self.view subviews];
    for (id objects in subviews) {
        if ([objects isKindOfClass:[UITextField class]]) {
            UITextField *theTextField = objects;
            if ([objects isFirstResponder]) {
                [theTextField resignFirstResponder];
            }
        }
    }
}

- (void)styleNavBar {
    
    CGFloat height = 0, ypad = 0;
    
    height = 64;
    ypad = 36;
    
    if([[DeviceManager sharedInstance] getIsIPhone5Screen])
    {
        height = 64;
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6Screen])
    {
        height = 70;
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone6PlusScreen])
    {
        height = 80;
    }
    else if ([[DeviceManager sharedInstance] getIsIPhone4Screen] || [[DeviceManager sharedInstance] getIsIPad]) {
        height = 55;
    }
    
    // 1. hide the existing nav bar
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    // 2. create a new nav bar and style it
    self.navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), height)];
    self.navBar.translucent = YES;
    // 3. add a new navigation item w/title to the new nav bar
    UINavigationItem *newItem = [[UINavigationItem alloc] init];
    self.navBar.backgroundColor = [UIColor whiteColor];
    
    
    UIImage *image = [[UIImage imageNamed:@"back_button"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(goback)];
    
    
    newItem.leftBarButtonItem = leftBtn;
    
    
 /*
    UIButton *titleView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    [titleView setUserInteractionEnabled:NO];
    
    UIImage *connections_image = [[UIImage imageNamed:@"connections"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [titleView setBackgroundImage:connections_image forState:UIControlStateNormal];
    //    NSString *titleText = @"Name";
    //    [titleView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    //    [titleView setTitle:titleText forState:UIControlStateNormal];
    
    
    newItem.titleView = titleView;
    
    */
    
    
    
    
    // newItem.titleView = backView;
    // 4. add the nav bar to the main view
    [self.navBar setItems:@[newItem]];
    [self.view addSubview:self.navBar];
    
    
}

-(void)goback{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(UIColor*)grayColor{
    
    return [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.0];
}

-(UIColor*)lineColor{
    
    return [UIColor colorWithRed:0.91 green:0.91 blue:0.91 alpha:1.0];
    
    
}

@end
