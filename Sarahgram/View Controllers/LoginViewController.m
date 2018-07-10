//
//  LoginViewController.m
//  Sarahgram
//
//  Created by Sarah Embry on 7/9/18.
//  Copyright © 2018 skembry. All rights reserved.
//

#import "LoginViewController.h"
#import "Parse/Parse.h"

@interface LoginViewController ()
@property (strong, nonatomic) IBOutlet UITextField *usernameField;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;
- (IBAction)didTapSignUp:(id)sender;
- (IBAction)didTapLogin:(id)sender;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) registerUser {
    PFUser *newUser = [PFUser user];

    newUser.username = self.usernameField.text;
    newUser.password = self.passwordField.text;
    
    //call signup
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
        } else {
            NSLog(@"User registered successfully");
            
            // manually segue to logged in view:
            [self performSegueWithIdentifier:@"loginSegue" sender:nil];
        }
    }];
}

-(void) loginUser {
    NSString *username = self.usernameField.text;
    NSString *password = self.passwordField.text;
    
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
        if (error != nil) {
            NSLog(@"User log in failed: %@", error.localizedDescription);
        } else {
            NSLog(@"User logged in successfully");
            
            // display home timeline (view controllower that needs to shown after successful login)
            [self performSegueWithIdentifier:@"loginSegue" sender:nil];
        }
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)didTapSignUp:(id)sender {
    [self registerUser];
}

- (IBAction)didTapLogin:(id)sender {
    [self loginUser];
    
}
@end
