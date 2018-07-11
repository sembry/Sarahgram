//
//  DetailsViewController.m
//  Sarahgram
//
//  Created by Sarah Embry on 7/11/18.
//  Copyright © 2018 skembry. All rights reserved.
//

#import "DetailsViewController.h"
#import "Post.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet PFImageView *postImage;
@property (weak, nonatomic) IBOutlet UILabel *caption;

@property (weak, nonatomic) IBOutlet UILabel *date;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureDetails:self.post];
}

- (void) configureDetails:(Post *)post {
    self.post = post;
    self.username.text = post.userId;
    self.caption.text = post.caption;
    
    //get date and format it
    NSDate *createdAt = post.createdAt;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"E MMM d HH:mm:ss Z y";
    // Configure output format
    formatter.dateStyle = NSDateFormatterShortStyle;
    formatter.timeStyle = NSDateFormatterNoStyle;
    // Convert Date to String
    self.date.text = [formatter stringFromDate:createdAt];
    
    //set image
    self.postImage.file = post[@"image"];
    [self.postImage loadInBackground];
    
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

@end
