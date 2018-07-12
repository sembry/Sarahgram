//
//  Post.h
//  Sarahgram
//
//  Created by Sarah Embry on 7/10/18.
//  Copyright © 2018 skembry. All rights reserved.
//

#import "PFObject.h"
#import "Parse.h"

@interface Post : PFObject <PFSubclassing>

@property(strong, nonatomic) PFFile *image;

@property (strong, nonatomic) PFUser *user;
@property (strong, nonatomic) NSString *userId;
@property (strong, nonatomic) NSString *postId;

@property (strong, nonatomic) NSString *caption;
@property (strong, nonatomic) NSNumber *likeCount;
@property (strong, nonatomic) NSNumber *commentCount;



+ (void) postUserImage: ( UIImage * _Nullable )image withCaption: ( NSString * _Nullable )caption withCompletion: (PFBooleanResultBlock  _Nullable)completion;
+ (PFFile *)getPFFileFromImage: (UIImage * _Nullable)image;

@end
