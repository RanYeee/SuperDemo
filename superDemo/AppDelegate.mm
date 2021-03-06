//
//  AppDelegate.m
//  SuperDemo
//
//  Created by IMac on 16/4/8.
//  Copyright © 2016年 Rany. All rights reserved.
//

#import "AppDelegate.h"
#import "KLFileManager.h"
#import "NSDate+DDAddition.h"
#import "AESEncrypt.h"
#import <QMUIKit/QMUIConfigurationManager.h>
#import <QMUIKit/QMUIConfigurationTemplate.h>
@interface AppDelegate ()
@property (nonatomic,strong) UIView *view;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
//    [AMapServices sharedServices].apiKey = @"354993461110dd5150b694c451d655b1";
    
    [QMUIConfigurationTemplate setupConfigurationTemplate];

    [QMUIConfigurationManager renderGlobalAppearances];
    
    
    UIViewController *viewController = [[UIStoryboard storyboardWithName:@"LaunchScreen" bundle:nil] instantiateViewControllerWithIdentifier:@"LaunchScreen"];
    
    UIView *launchView = viewController.view;
    UIWindow *mainWindow = [UIApplication sharedApplication].keyWindow;
    launchView.frame = [UIApplication sharedApplication].keyWindow.frame;
    [mainWindow addSubview:launchView];
    
    [UIView animateWithDuration:1.6f delay:0.5f options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        launchView.alpha = 0.0f;
        launchView.layer.transform = CATransform3DScale(CATransform3DIdentity, 1.5f, 1.5f, 1.0f);
    } completion:^(BOOL finished) {
        [launchView removeFromSuperview];
    }];
    

    return YES;
}

- (void)aesTest
{
    NSString *encyStr = [AESEncrypt encryptAES:@"xar1993" key:@"xar"];
    
    NSString *deEncyStr = [AESEncrypt decryptAES:encyStr key:@"xar"];
    
    NSLog(@">>>>>>encyStr = %@\n      deEncyStr = %@",encyStr,deEncyStr);
}

- (void)changeNavBarStyle
{
    
    //设置NavigationBar背景颜色
//    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithHexString:@"#03A9F4"]];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navBar"] forBarMetrics:UIBarMetricsDefault];
    //@{}代表Dictionary
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    //不设置这个无法修改状态栏字体颜色
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
    
    [[UITabBar appearance] setTintColor:[UIColor colorWithHexString:@"#269EBC"]];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
