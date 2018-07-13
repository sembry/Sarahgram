//
//  EditProfileViewController.h
//  Sarahgram
//
//  Created by Sarah Embry on 7/12/18.
//  Copyright © 2018 skembry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Parse.h"
#import "ParseUI.h"
#import "Post.h"
#import "UIImageView+AFNetworking.h"

@protocol EditProfileViewControllerDelegate
- (void) didFinishEditing;
@end

@interface EditProfileViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) id<EditProfileViewControllerDelegate> delegate;
@end
