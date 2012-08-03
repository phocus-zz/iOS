//
//  ViewController.m
//  aula10
//
//  Created by Jean Fellipe Ferraz Campos on 8/1/12.
//  Copyright (c) 2012 Jean Fellipe Ferraz Campos. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)play:(id)sender{
    [audio play];
}

- (void)pause:(id)sender{
    [audio pause];
}

- (void)volume:(UISlider*)slider{
    audio.volume = slider.value;
    progress.progress = ((audio.currentTime*100)/audio.duration)/100;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //Jean
    
    NSString *caminho = [[NSBundle mainBundle] pathForResource:@"musica" ofType:@"mp3"];
    audio = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:caminho] error:NULL];
    audio.numberOfLoops = 10;
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(0, 0, 200, 10)];
    [slider setMaximumValue:1];
    [slider addTarget:self action:@selector(volume:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
    UIButton *bt1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 60, 40, 40)];
    bt1.backgroundColor = [UIColor blackColor];
    [bt1 addTarget:self action:@selector(play:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt1];
    
    UIButton *bt2 = [[UIButton alloc] initWithFrame:CGRectMake(40, 60, 40, 40)];
    bt2.backgroundColor = [UIColor grayColor];
    [bt2 addTarget:self action:@selector(pause:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt2];
    
    progress = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 30, 200, 10)];
    [self.view addSubview:progress];
    
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
