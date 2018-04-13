//
//  SecondViewController.h
//  codechallege
//
//  Created by Sneha Mohan on 2018-04-12.
//  Copyright © 2018 Sneha Mohan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *backbutton;
- (IBAction)backbuttonaction:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *Userimageview;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end
