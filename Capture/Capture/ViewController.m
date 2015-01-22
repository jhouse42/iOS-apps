//
//  ViewController.m
//  Capture
//
//  Created by Jeanie House on 1/20/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

#import "ViewController.h"
#import "FilterViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic) UIImagePickerController *cameraPickerController;
@property (nonatomic) UIImagePickerController *libraryPickerController;
@property (weak, nonatomic) IBOutlet UIButton *openPhotoLibraryButton;
@property (weak, nonatomic) IBOutlet UIButton *takeMediaButton;
@property (weak, nonatomic) IBOutlet UIView *cameraView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *mediaChoiceButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *frontRearChoiceButton;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.openPhotoLibraryButton addTarget:self action:@selector(openPhotoLibrary) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.cameraPickerController = [[UIImagePickerController alloc] init];
    
    self.cameraPickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    self.cameraPickerController.cameraDevice = UIImagePickerControllerCameraDeviceRear;
                                        
    
                                        
    self.cameraPickerController.showsCameraControls = NO;
    self.cameraPickerController.delegate = self;
    
    self.cameraPickerController.mediaTypes = @[(NSString *)kUTTypeImage,
                                               (NSString *)kUTTypeMovie];
    
    self.cameraPickerController.view.frame = self.cameraView.bounds;
    
    [self.cameraView addSubview:self.cameraPickerController.view];
    
    [self.takeMediaButton addTarget:self.cameraPickerController action:@selector(takePicture) forControlEvents:UIControlEventTouchUpInside];
    
//    [self.takeMediaButton addTarget:self.cameraPickerController action:@selector(takeVideo) forControlEvents:UIControlEventTouchUpInside];
    
    [self.mediaChoiceButton addTarget:self action:@selector(changeMediaType) forControlEvents:UIControlEventValueChanged];
    
    [self.frontRearChoiceButton addTarget:self action:@selector(frontRearChoice) forControlEvents:UIControlEventValueChanged];
    
}


- (void)changeMediaType {
    
    self.cameraPickerController.cameraCaptureMode = (self.mediaChoiceButton.selectedSegmentIndex == 0)  ? UIImagePickerControllerCameraCaptureModePhoto:UIImagePickerControllerCameraCaptureModeVideo;
    
    switch (self.mediaChoiceButton.selectedSegmentIndex) {
        case 0://photo
            
            [self.mediaChoiceButton addTarget:self action:@selector(changeMediaType) forControlEvents:UIControlEventValueChanged];
            
            break;
            
        case 1: //video
                [self.takeMediaButton removeTarget:self.cameraPickerController action:@selector(takePicture) forControlEvents:UIControlEventTouchUpInside];
            
            break;
            
        default:
            break;
    }
    

    
    
}

- (void)frontRearChoice {
    
    self.cameraPickerController.cameraDevice = (self.frontRearChoiceButton.selectedSegmentIndex ==0)  ? UIImagePickerControllerCameraDeviceRear:UIImagePickerControllerCameraDeviceFront;
    
    
}



//- (void)takeMedia {
//    
//    [self.cameraPickerController takePicture];
//    
//}

- (void)openPhotoLibrary {
    
    self.libraryPickerController = [[UIImagePickerController alloc] init];
    
    self.libraryPickerController.delegate = self;
    
    [self presentViewController:self.libraryPickerController animated:YES completion:nil];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    NSLog(@"%@", info);
    
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    [self gotoFilterWithImage:image];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}


- (void)gotoFilterWithImage:(UIImage *)image {
    
    //push filter view controller
    
    FilterViewController *filterVC = [self.storyboard instantiateViewControllerWithIdentifier:@"filterVC"];
    
    
    filterVC.originalImage = image;
    
    [self.navigationController pushViewController:filterVC animated:YES];
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
