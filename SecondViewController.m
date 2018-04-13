//
//  SecondViewController.m
//  codechallege
//
//  Created by Sneha Mohan on 2018-04-12.
//  Copyright © 2018 Sneha Mohan. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
@synthesize Userimageview,nameLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    Userimageview.image=[UIImage imageNamed:@"usericon_id76rb.png"];
    [nameLabel setHidden:YES];
    
    // add tapgesture to UIimageview
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imagePressed)];
    tapGesture.numberOfTapsRequired=1;
    [Userimageview setUserInteractionEnabled:YES];
    [Userimageview addGestureRecognizer:tapGesture];
    // Do any additional setup after loading the view.
}
//Tap function
-(void)imagePressed{
    [Userimageview setHidden:YES];
    [nameLabel setHidden:NO];
    NSUserDefaults *applogin=[NSUserDefaults standardUserDefaults]; //retrieve username
    NSString *messagestring=@"Hello ";
    messagestring=[messagestring stringByAppendingString:[applogin objectForKey:@"Username"]];
    nameLabel.text=messagestring;
    //do what ever you want here
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//fuction to navigate back to previous page
- (IBAction)backbuttonaction:(id)sender {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"Username"];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
