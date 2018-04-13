//
//  ViewController.m
//  codechallege
//
//  Created by Sneha Mohan on 2018-04-12.
//  Copyright © 2018 Sneha Mohan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize PasswordTextfield,UsernameTextfield,SubmitButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    PasswordTextfield.delegate=self;
    UsernameTextfield.delegate=self;
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    //clear all data
    UsernameTextfield.text = @"";
    PasswordTextfield.text=@"";

}

-(void)viewdown;
{
    //make the view to original position
    CGRect returnframe =self.view.frame;
    returnframe.origin.y = 0;
    [UIView animateWithDuration:0.3 animations:^{self.view.frame = returnframe;}];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
  //make view position up
    CGRect frame=CGRectMake(0,-80,self.view.frame.size.width,self.view.frame.size.height);
    [UIView animateWithDuration:0.3 animations:^{self.view.frame = frame;}];
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [self viewdown];
    [textField resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self viewdown];
    [textField resignFirstResponder];
    return YES;
}


// username and password validation function
- (BOOL)isValid {
    UIAlertController *alertController;
    NSString *myegex = @"^[A-Za-z]+$";
    NSPredicate *usernameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",myegex];
    if(UsernameTextfield.text.length < 8)
    {
       alertController = [UIAlertController alertControllerWithTitle:@"Username should be atleast 8 characters" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alertController animated:YES completion:nil];
        return FALSE;
    }
    else if (![usernameTest evaluateWithObject:self.UsernameTextfield.text]) //check if username is alphabetic
    {
        alertController = [UIAlertController alertControllerWithTitle:@"Username should be alphabetic" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alertController animated:YES completion:nil];
        NSLog(@"nnnnnn");
        return FALSE;
    }
    else if(PasswordTextfield.text.length < 8) //check password length
    {
        alertController = [UIAlertController alertControllerWithTitle:@"Password should be atleast 8 characters" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alertController animated:YES completion:nil];
        return FALSE;
    }
        
        return TRUE;
    }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
}

// Submit button action
- (IBAction)SubmitAction:(id)sender {
   if( [self isValid])
   {
       NSUserDefaults *applogin=[NSUserDefaults standardUserDefaults]; // save username details
       [applogin setObject:UsernameTextfield.text forKey:@"Username"];
       [self performSegueWithIdentifier:@"segueidentifier" sender:self];
   }
}
@end
