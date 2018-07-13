//
//  PostCollectionCell.h
//  Sarahgram
//
//  Created by Sarah Embry on 7/12/18.
//  Copyright © 2018 skembry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Parse.h"
#import "ParseUI.h"
#import "Post.h"

@interface PostCollectionCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet PFImageView *postImage;
-(void) configureCell:(Post *)post; 
@end
