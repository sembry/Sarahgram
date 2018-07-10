//
//  PostCell.h
//  Sarahgram
//
//  Created by Sarah Embry on 7/10/18.
//  Copyright © 2018 skembry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "ParseUI.h"

@interface PostCell : UITableViewCell
@property (weak, nonatomic) IBOutlet PFImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (strong, nonatomic) IBOutlet UILabel *caption;
@property (strong, nonatomic) Post *post;
- (void) configureCell:(Post *) post;
@end
