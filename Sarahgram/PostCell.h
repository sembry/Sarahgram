//
//  PostCell.h
//  Sarahgram
//
//  Created by Sarah Embry on 7/10/18.
//  Copyright © 2018 skembry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

@interface PostCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UIButton *username;
@property (strong, nonatomic) IBOutlet UILabel *caption;
- (void) configureCell:(Post *) post;
@end
