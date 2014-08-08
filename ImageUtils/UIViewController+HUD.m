
#import "UIViewController+HUD.h"
#import "MBProgressHUD.h"

@implementation UIViewController (HUD)

- (void) showMessage:(NSString*)message onView:(UIView*)view removeAfter:(NSTimeInterval)delay{
    [self showMessage:message withTitle:@"" onView:view removeAfter:delay];
}

- (void) showMessage:(NSString*)message withTitle:(NSString*)title onView:(UIView*)view removeAfter:(NSTimeInterval)delay{
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        // Configure for text only and offset down
        hud.mode = MBProgressHUDModeText;
        hud.labelText = title;
        
        hud.detailsLabelText = message;
        hud.margin = 10.f;
        hud.yOffset = 0.0f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:delay];
    });
}

- (void)showHudOnView:(UIView*)onView{
    [MBProgressHUD showHUDAddedTo:onView animated:YES];
}

- (void) showSpinnerOnView:(UIView*)view withOffset:(CGFloat)offset{
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        // Configure for text only and offset down
        hud.mode = MBProgressHUDModeIndeterminate;
        hud.labelText = nil;        
        hud.detailsLabelText = nil;
        hud.margin = 10.f;
        hud.yOffset = 40.0f;
    });
}


- (void)removeHudFromView:(UIView*)onView{
    [MBProgressHUD hideHUDForView:onView animated:YES];
}

-(void) removeAllHuds:(UIView*)onView{
    [MBProgressHUD hideAllHUDsForView:onView animated:YES];
}

-(NSUInteger) hudCount:(UIView*)onView{
    return [[MBProgressHUD allHUDsForView:onView] count];
}


@end
