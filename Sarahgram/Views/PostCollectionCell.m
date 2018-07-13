//
//  PostCollectionCell.m
//  Sarahgram
//
//  Created by Sarah Embry on 7/12/18.
//  Copyright © 2018 skembry. All rights reserved.
//

#import "PostCollectionCell.h"

@implementation PostCollectionCell
-(void) configureCell:(Post *)post{
    self.post = post;
    self.postImage.file = post[@"image"];
    [self.postImage loadInBackground];
}
@end
