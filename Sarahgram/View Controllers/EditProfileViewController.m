//
//  EditProfileViewController.m
//  Sarahgram
//
//  Created by Sarah Embry on 7/12/18.
//  Copyright © 2018 skembry. All rights reserved.
//

#import "EditProfileViewController.h"

@interface EditProfileViewController ()
- (IBAction)didTapSave:(id)sender;
- (IBAction)didTapCancel:(id)sender;
- (IBAction)didTapPic:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *bio;
@property (weak, nonatomic) IBOutlet UIImageView *profilePic;
@property (strong, nonatomic) UIImage *resizedImage;

@property (strong, nonatomic) PFUser *user;


@end

@implementation EditProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.user = PFUser.currentUser;
    // Do any additional setup after loading the view.
    [self setProperties];

}

- (void) setProperties{
    if(self.user[@"profileImage"] != nil){
        PFFile *profile = self.user[@"profileImage"];
        NSURL *profileURL = [NSURL URLWithString:profile.url];
        [self.profilePic setImageWithURL:profileURL];
        self.resizedImage = self.profilePic.image;
    }
    if (![self.user[@"name"] isEqualToString:@""]) {
        self.name.text = self.user[@"name"];
    }
    if (![self.user[@"bio"] isEqualToString:@""]) {
        self.bio.text = self.user[@"bio"];
    }
    self.username.text = self.user.username;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Get the image captured by the UIImagePickerController
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];
    
    // Do something with the images (based on your use case)
    CGSize size = CGSizeMake(450, 450);
    self.resizedImage = [self resizeImage:editedImage withSize:size];
    self.profilePic.image = self.resizedImage;
    
    
    
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void) selectPicture{
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:imagePickerVC animated:YES completion:nil];
    
}

- (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size {
    UIImageView *resizeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    resizeImageView.contentMode = UIViewContentModeScaleAspectFill;
    resizeImageView.image = image;
    
    UIGraphicsBeginImageContext(size);
    [resizeImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (IBAction)didTapSave:(id)sender {
    PFUser.currentUser.username = self.username.text;
    PFUser.currentUser[@"name"] = self.name.text;
    PFUser.currentUser[@"bio"] = self.bio.text;
    
    //change profile image
    PFUser.currentUser[@"profileImage"] = [Post getPFFileFromImage:self.profilePic.image];

    [PFUser.currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if(error){
            NSLog(error.localizedDescription);
        }
        else{
            
            [self.delegate didFinishEditing];
        }
    }];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)didTapCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)didTapPic:(id)sender {
    [self selectPicture];
}
@end
