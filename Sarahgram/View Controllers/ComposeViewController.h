//
//  ComposeViewController.h
//  Sarahgram
//
//  Created by Sarah Embry on 7/10/18.
//  Copyright © 2018 skembry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComposeViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
-(void) takePicture;
-(void) selectPicture;
@end
