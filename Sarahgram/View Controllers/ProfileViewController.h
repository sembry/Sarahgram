//
//  ProfileViewController.h
//  Sarahgram
//
//  Created by Sarah Embry on 7/12/18.
//  Copyright © 2018 skembry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Parse.h"
#import "ParseUI.h"
#import "EditProfileViewController.h"
#import "Post.h"
#import "PostCollectionCell.h"
#import "DetailsViewController.h"

@interface ProfileViewController : UIViewController <EditProfileViewControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource>
@property (strong, nonatomic) PFUser *user;
@end
