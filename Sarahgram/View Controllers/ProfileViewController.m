//
//  ProfileViewController.m
//  Sarahgram
//
//  Created by Sarah Embry on 7/12/18.
//  Copyright © 2018 skembry. All rights reserved.
//

#import "ProfileViewController.h"



@interface ProfileViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *postView;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet PFImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *bio;
//- (IBAction)didTapEdit:(id)sender;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureProfile:PFUser.currentUser];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"editSegue"]){
        UINavigationController *navVC = (UINavigationController *)[segue destinationViewController];
        EditProfileViewController *editVC = (EditProfileViewController *)navVC.topViewController;
        editVC.delegate = self;
    }
}


- (void) configureProfile:(PFUser *) user{
    self.username.text = [@"@" stringByAppendingString:user.username];
    self.name.text = user[@"name"];
    self.bio.text = user[@"bio"];
    [self.bio sizeToFit];
    
    //IMAGE STUFF
    self.profileImage.file = user[@"profileImage"];
    [self.profileImage loadInBackground];
}

-(void) didFinishEditing{
    [self configureProfile:PFUser.currentUser];
}
@end
