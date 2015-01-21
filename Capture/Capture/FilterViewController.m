//
//  FilterViewController.m
//  Capture
//
//  Created by Jeanie House on 1/20/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

#import "FilterViewController.h"




// Add segment control for choosing front or rear camera (storyboard)
  // Add target method that changes camera device (code)

// Add methods to allow for video capture and stopping
  //record delegate method finish picking media

// Add a UICollectionView to filterVC (storyboard) at the bottom
  //take inspiration from instagram filter scroller (1 row of square filters)
// EXTRA : find out how to flip camera view when changing between front and rear - stack overflow


@interface FilterViewController ()


@property (weak, nonatomic) IBOutlet UIImageView *filterImageView;


@property (weak, nonatomic) IBOutlet UICollectionView *filterCollectionView;


@end

@implementation FilterViewController

- (void)setOriginalImage:(UIImage *)originalImage {
    
    
    NSLog(@"filter image view %@",self.filterImageView);
    
    self.filterImageView.image = originalImage;
    
    _originalImage = originalImage;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.filterImageView.image = self.originalImage;
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
