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


@property (weak, nonatomic) IBOutlet UIButton *editButton;

@property (strong, nonatomic) NSArray *posts;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.postView.delegate = self;
    self.postView.dataSource = self;
    
    //edit profile button only shows/works if viewing the profile of the user currently signed in
    if(self.user == nil || [self.user.objectId isEqualToString: PFUser.currentUser.objectId]){
        self.user = PFUser.currentUser;
        self.editButton.hidden = NO;
        self.editButton.enabled = YES;
    }
    //logged in user can't edit other users' profiles
    else{
        self.editButton.hidden = YES;
        self.editButton.enabled = NO;
    }
    [self fetchUserPosts];
    [self configureProfile:self.user];
}

- (void) fetchUserPosts{
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    [query includeKey:@"user"];
    [query whereKey:@"user" equalTo:self.user];
    [query orderByDescending:@"createdAt"];
    
    // fetch data asynchronously
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            //the array of objects returned by the call
            self.posts = posts;
            [self.postView reloadData];
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
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
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    PostCollectionCell *cell = [self.postView dequeueReusableCellWithReuseIdentifier:@"PostCollectionCell" forIndexPath:indexPath]; 
    Post *post = self.posts[indexPath.item];
    [cell configureCell:post];
    return cell;
    
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.posts.count;
}


@end
