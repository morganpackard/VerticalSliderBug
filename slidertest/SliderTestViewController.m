//
//  SpoonicopterViewController.m
//  slidertest
//
//  Created by Morgan Packard on 6/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SliderTestViewController.h"

@interface SliderTestViewController (){
  UISlider* slider;
  NSTimer* timer;
  float val;
}
-(void)sliderMoved;
-(void)setSliderValue;

@end

@implementation SliderTestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  
    slider = [[UISlider alloc] initWithFrame:CGRectMake(10, 200, 400, 20)];
    CGAffineTransform trans = CGAffineTransformMakeRotation(M_PI * 1.5);
    slider.transform = trans;
    
    [slider addTarget:self action:@selector(sliderMoved) forControlEvents:UIControlEventTouchDragInside];
    [self.view addSubview:slider];
  
}


-(void)sliderMoved{
  val = slider.value;
  if(timer != nil){
    [timer invalidate];
  }
  timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(setSliderValue) userInfo:nil repeats:NO];
}


-(void)setSliderValue{
  NSLog(@"setting slider value");
  slider.value = val;
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
      return YES;
  }
}

@end
