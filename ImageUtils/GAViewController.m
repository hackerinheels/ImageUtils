//
//  GAViewController.m
//  ImageUtils
//
//  Created by Garima Agarwal on 8/4/14.
//  Copyright (c) 2014 Garima Agarwal. All rights reserved.
//

#import "GAViewController.h"
#import "UIImage+ImageEffects.h"

@interface GAViewController ()

@end

@implementation GAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self addShadowToView];
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self blurBackground];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addShadowToView
{
    CAGradientLayer *gradientTop = [CAGradientLayer layer];
    gradientTop.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 10);
    gradientTop.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:(0.0) green:(0.0) blue:(0.0) alpha:.7] CGColor], (id)[[UIColor colorWithRed:(0) green:(0) blue:(0) alpha:0.0] CGColor], nil];
    self.view.layer.borderWidth=1.0f;
    [self.view.layer insertSublayer:gradientTop atIndex:0];
}

-(UIImage*) snapshotImageInRect:(CGRect)rect{
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 1);
    //Now grab the snapshot of the screen's content
    [self.view drawViewHierarchyInRect:rect afterScreenUpdates:NO];
    UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImage *lightImage = [snapshotImage applyBlurWithRadius:1.3 tintColor:nil saturationDeltaFactor:0.7 maskImage:nil];
    return lightImage;
}

-(UIImage *)cropImage:(UIImage *)image rect:(CGRect)cropRect
{
    UIGraphicsBeginImageContextWithOptions(cropRect.size, NO, 1);
    [image drawAtPoint:(CGPoint){-cropRect.origin.x, -cropRect.origin.y}];
    UIImage *croppedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return croppedImage;
}

-(void) blurBackground{
    UIImage *image = [self snapshotImageInRect:self.view.frame];
    UIImage *cropped = [self cropImage:image rect:self.iv2.frame];
    [self.iv2 setImage:cropped];
    [self.view insertSubview:self.iv2 aboveSubview:self.iv1];
    self.iv1.hidden = YES;
}


@end
