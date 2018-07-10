//
//  PostCell.m
//  Sarahgram
//
//  Created by Sarah Embry on 7/10/18.
//  Copyright © 2018 skembry. All rights reserved.
//

#import "PostCell.h"
#import "Post.h"
#import "UIImageView+AFNetworking.h"
#import "ParseUI.h"

@implementation PostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) configureCell:(Post *) post{
    self.caption.text = post.caption;
    self.post = post;
    self.image.file = post[@"image"];
    [self.image loadInBackground];
    //get image URL from PFFile
//    NSURL *imageURL = [NSURL URLWithString:post.image.url];
//    [self.image setImageWithURL:imageURL];
    self.username.text = post.userId;
}

@end
