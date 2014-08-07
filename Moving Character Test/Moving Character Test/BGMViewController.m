//
//  BGMViewController.m
//  Moving Character Test
//
//  Created by 馬 岩 on 14-8-6.
//  Copyright (c) 2014年 馬 岩. All rights reserved.
//

#import "BGMViewController.h"

@interface BGMViewController ()
@property (weak, nonatomic) IBOutlet UIView *characterView;
@property (weak, nonatomic) IBOutlet UIWebView *myWebView;

@property CGRect keyboardRect;
@end

@implementation BGMViewController


#pragma mark - View Controller Callback

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	// Initialize status variables
	self.keyboardRect = CGRectMake(0, 0, 0, 0);
	
	// Disable autoLayout control to the characterView
	[self.characterView setTranslatesAutoresizingMaskIntoConstraints:YES];
	
	// Start Loading Webpage
	[self.myWebView loadRequest:[NSURLRequest requestWithURL: [NSURL URLWithString:@"http://google.com"]]];
	
	// Bind orientation change event
	[[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
	[[NSNotificationCenter defaultCenter]
	 addObserver:self selector:@selector(orientationChanged:)
	 name:UIDeviceOrientationDidChangeNotification
	 object:[UIDevice currentDevice]];
	
	// Bind keyboard show event
	[[NSNotificationCenter defaultCenter]
	 addObserver:self selector:@selector(onKeyboardShow:)
	 name:UIKeyboardDidShowNotification
	 object:nil];
	
	// Bind keyboard hide event
	[[NSNotificationCenter defaultCenter]
	 addObserver:self selector:@selector(onKeyboardHide:)
	 name:UIKeyboardDidHideNotification
	 object:nil];
	
	// Bind keyboard frame change event
	[[NSNotificationCenter defaultCenter]
	 addObserver:self selector:@selector(onKeyboardFrameChange:)
	 name:UIKeyboardDidChangeFrameNotification
	 object:nil];
	
	// Adjust character
	[self adjustCharacterPosition];
}

- (void)viewWillAppear:(BOOL)animated
{
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Orientation Change Handler

- (void)orientationChanged:(NSNotification *)notification
{
	NSLog(@"%@", NSStringFromSelector(_cmd));
	
	[self adjustCharacterPosition];
}


#pragma mark - Keyboard Event Handler

- (void)onKeyboardHide:(NSNotification *)notification
{
	NSLog(@"%@", NSStringFromSelector(_cmd));
	NSLog(@"Notification: %@", notification);
	
	self.keyboardRect = CGRectMake(0, 0, 0, 0);
	
//	[self performSelector:@selector(adjustCharacterPosition) withObject:nil afterDelay:2];
	[self adjustCharacterPosition];
}

- (void)onKeyboardShow:(NSNotification *)notification
{
	NSLog(@"%@", NSStringFromSelector(_cmd));
	NSLog(@"Notification: %@", notification);
	
	// Get the rect of the keyboard
	self.keyboardRect = [[[notification userInfo] objectForKey:UIKeyboardBoundsUserInfoKey] CGRectValue];
	
//	[self performSelector:@selector(adjustCharacterPosition) withObject:nil afterDelay:2];
	[self adjustCharacterPosition];
}

- (void)onKeyboardFrameChange:(NSNotification *)notification
{
	NSLog(@"%@", NSStringFromSelector(_cmd));
	NSLog(@"Notification: %@", notification);
	
	// Get the rect of the keyboard
	self.keyboardRect = [[[notification userInfo] objectForKey:UIKeyboardBoundsUserInfoKey] CGRectValue];
	
//	[self performSelector:@selector(adjustCharacterPosition) withObject:nil afterDelay:2];
	[self adjustCharacterPosition];
}


#pragma mark - Other Private Methods

- (void)adjustCharacterPosition
{
	NSLog(@"%@", NSStringFromSelector(_cmd));
	
	UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
	
	CGRect screenBounds = [[UIScreen mainScreen] bounds];
	CGRect screenFrame;
	
	if (UIDeviceOrientationIsLandscape(orientation))
	{
		screenFrame = CGRectMake(0, 0, screenBounds.size.height, screenBounds.size.width);
	}
	else if(UIDeviceOrientationIsPortrait(orientation))
	{
		screenFrame = CGRectMake(0, 0, screenBounds.size.width, screenBounds.size.height);
	}
	else
	{
//		screenFrame = CGRectMake(0, 0, screenBounds.size.width, screenBounds.size.height);
		NSLog(@"Error!!!");
	}
	
	// move the character to the bottom of the screen
	[UIView animateWithDuration:0.3 animations:^{
		
		[self.characterView setFrame:CGRectMake(0, screenFrame.size.height - self.keyboardRect.size.height - self.characterView.frame.size.height, self.characterView.frame.size.width, self.characterView.frame.size.height)];
	} completion:^(BOOL finished) {
		
	}];
}


#pragma mark - Webview Delegate
- (void)webViewDidStartLoad:(UIWebView *)webView
{
	
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
	
}


@end
