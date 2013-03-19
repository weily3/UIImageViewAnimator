//
//  UIImageViewAnimatorSampleViewController.m
//  UIImageViewAnimatorSample
//

#import "UIImageViewAnimatorSampleViewController.h"
#import "UIImageViewAnimator.h"

@implementation UIImageViewAnimatorSampleViewController


- (void)dealloc 
{
	[animator release];
    [super dealloc];
}

- (void) viewDidLoad
{
	NSMutableArray * dataSet = [NSMutableArray arrayWithCapacity:5];
	for ( int i=1; i<127; i++ )
	{
		NSString * name = [NSString stringWithFormat:@"fire_ani_%04d.png", i];
		[dataSet addObject:name];
	}
	
	[animator setImageNames:dataSet];
	[animator setDuration:5];
	
	//test notification!	
	[animator setCacheImages:YES];
	[animator setDelegate:self];
	[animator setStartSelector:@selector(start:)];
	[animator setStopSelector:@selector(stop:)];
}

-(void)start:(id)_context
{
	NSLog( @"Animation playback has been triggered" );
}

- (void) stop:(id)_context
{
	NSLog( @"Animation playback has finished" );
    
	if ( ![animator isAnimating] )
	{
		[animator setIndex:108];
		[animator startAnimating];
	}
}

- (IBAction) startAnimation:(id)_sender
{
	if ( ![animator isAnimating] )
	{
		[animator setIndex:0];
		[animator startAnimating];
	}
}

@end
