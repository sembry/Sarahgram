//
//  Post.m
//  Sarahgram
//
//  Created by Sarah Embry on 7/10/18.
//  Copyright © 2018 skembry. All rights reserved.
//

#import "Post.h"

@implementation Post

@dynamic image, postId, userId, user, caption, likeCount, commentCount;

+ (nonnull NSString *)parseClassName {
    return @"Post";
}

+ (void) postUserImage: ( UIImage * _Nullable )image withCaption: ( NSString * _Nullable )caption withCompletion: (PFBooleanResultBlock  _Nullable)completion {
    
    Post *newPost = [Post new]; 
    newPost.image = [self getPFFileFromImage:image];
    newPost.user = [PFUser currentUser];
    newPost.caption = caption;
    newPost.likeCount = @(0);
    newPost.commentCount = @(0);
    
    [newPost saveInBackgroundWithBlock: completion];
}

+ (PFFile *)getPFFileFromImage: (UIImage * _Nullable)image {
    
    // check if image is not nil
    if (!image) {
        return nil;
    }
    
    NSData *imageData = UIImagePNGRepresentation(image);
    // get image data and check if that is not nil
    if (!imageData) {
        return nil;
    }
    
    return [PFFile fileWithName:@"image.png" data:imageData];
}

@end
