//
//  FeedViewController.m
//  Sarahgram
//
//  Created by Sarah Embry on 7/9/18.
//  Copyright © 2018 skembry. All rights reserved.
//

#import "FeedViewController.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "PostCell.h"
#import "Post.h"
#import "Parse.h"

@interface FeedViewController ()

@property (strong, nonatomic) NSArray *posts;

- (IBAction)didTapLogout:(id)sender;

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)didTapLogout:(id)sender {
    
    //transition to the login view controller
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    appDelegate.window.rootViewController = loginViewController;
    
    //log out of parse
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        // PFUser.current() will now be nil
        if(!error){
            NSLog(@"Successfully logged out");
        }
    }];
}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    PostCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostCell" forIndexPath:indexPath];
    Post *post = self.posts [indexPath.row];
    //[cell ]
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts.count;
}




@end
