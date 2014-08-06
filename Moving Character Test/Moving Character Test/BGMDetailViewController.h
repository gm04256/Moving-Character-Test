//
//  BGMDetailViewController.h
//  Moving Character Test
//
//  Created by 馬 岩 on 14-8-6.
//  Copyright (c) 2014年 馬 岩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BGMDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
