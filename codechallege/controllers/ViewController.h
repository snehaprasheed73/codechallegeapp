//
//  ViewController.h
//  codechallege
//
//  Created by Sneha Mohan on 2018-04-12.
//  Copyright © 2018 Sneha Mohan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *UsernameTextfield;
@property (weak, nonatomic) IBOutlet UITextField *PasswordTextfield;
@property (weak, nonatomic) IBOutlet UIButton *SubmitButton;
- (IBAction)SubmitAction:(id)sender;

@end

