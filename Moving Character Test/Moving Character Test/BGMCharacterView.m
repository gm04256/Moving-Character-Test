//
//  BGMCharacterView.m
//  Moving Character Test
//
//  Created by 馬 岩 on 14-8-7.
//  Copyright (c) 2014年 馬 岩. All rights reserved.
//

#import "BGMCharacterView.h"

@interface BGMCharacterView ()
@property UIImageView* characterImageView;
@property CharacterStatus status;
@end

@implementation BGMCharacterView

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	
	if(self)
	{
        // Initialization code
		[self setCharacterToStatus:characterStatusWating];
		
		// Adjust scale mode
		//		[self setContentMode:UIViewContentModeScaleAspectFit];
		//		self.autoresizesSubviews = YES;
		
		[self.characterImageView setContentMode:UIViewContentModeScaleAspectFit];
		//		self.characterImageView.autoresizesSubviews = YES;
		
		[self.characterImageView setFrame:self.bounds];
		[self addSubview:self.characterImageView];
	}
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
	NSLog(@"%@", NSStringFromSelector(_cmd));
    self = [super initWithFrame:frame];
    if (self)
	{
        // Initialization code
		[self setCharacterToStatus:characterStatusDragged];
		
		// Adjust scale mode
//		[self setContentMode:UIViewContentModeScaleAspectFit];
//		self.autoresizesSubviews = YES;
		
		[self.characterImageView setContentMode:UIViewContentModeScaleAspectFit];
//		self.characterImageView.autoresizesSubviews = YES;
		
		[self.characterImageView setFrame:self.bounds];
		[self addSubview:self.characterImageView];
    }
    return self;
}

- (void)setCharacterToStatus:(CharacterStatus)status
{
	self.status = status;
	
	[self updateCharacter];
}

- (void)updateCharacter
{
	UIImage* characterImage;
	
	switch (self.status) {
		case characterStatusWating:
			characterImage = [UIImage imageNamed:@"images/test1.jpg"];
			break;
			
		case characterStatusMoving:
			characterImage = [UIImage imageNamed:@"images/test2.jpg"];
			break;
			
		case characterStatusSpeaking:
			characterImage = [UIImage imageNamed:@"images/test3.jpg"];
			break;
			
		case characterStatusDragged:
			characterImage = [UIImage imageNamed:@"images/test4.jpg"];
			break;
			
		default:
			break;
	}
	
	if (self.characterImageView == Nil)
	{
		self.characterImageView = [[UIImageView alloc] initWithImage:characterImage];
	}
	else
	{
		[self.characterImageView setImage:characterImage];
	}
	
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
	[super drawRect:rect];
    // Drawing code
}
*/

@end
