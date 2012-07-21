//
//  ViewController.m
//  PiitriSelectionTask
//
//  Created by LSR Marketing Service on 20/07/12.
//  Copyright (c) 2012 LSR Marketing Service. All rights reserved.
//

#import "ViewController.h"
#import "Facebook+Singleton.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize cajaTextoLogin;
@synthesize loginFBButton;

int numero = 1;

- (id)init {
    if ((self = [super init])) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(requestFacebookData) name:@"FBDidLogin" object:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setLoginFBButton:nil];
    [self setCajaTextoLogin:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"FBDidLogin" object:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (IBAction)connectWithFB:(id)sender {
    //Code to Log in with Facebook
    NSMutableString * textoDeCaja = [[NSMutableString alloc] initWithString:@"Let's Login With Facebook "];
    NSString * numeroString = [NSString stringWithFormat:@"%i", numero];
    [textoDeCaja appendString:numeroString];
    self.cajaTextoLogin.text = textoDeCaja;
    [self requestFacebookData];
    numero=numero+1;
    /*self.cajaTextoLogin.text = @"En Login El Token es %@ y el expiration date es %@", [[Facebook shared]  objec kFBAccessTokenKey], [[Facebook shared] FBAccessTokenKey];*/
    /*NSLog(@"Los datos del usuario son %@", [[Facebook shared] result]);*/
    
}
//**********************************

- (void)requestFacebookData {
    [[Facebook shared] requestWithGraphPath:@"me?fields=id,email,name,picture,birthday,location" andDelegate:self];
    
}

- (void)request:(FBRequest *)request didLoad:(id)result {
    NSLog(@"FB request OK");
    NSLog(@"FB el request result es: %@", result);
    // Access Token an Expiration Day asignation
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString * AccessTokenClave = [defaults objectForKey:kFBAccessTokenKey]; 
    NSDate * datoExpirationDate = [defaults objectForKey:kFBExpirationDateKey];
    
    NSMutableString * textoDeCaja = [[NSMutableString alloc] init];
    [textoDeCaja appendString:@"The AccessToken is: \n"];
    [textoDeCaja appendString:AccessTokenClave];
    [textoDeCaja appendString:@" \nand the Expiration Date is : "];
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    
    NSString * textoExpirationDate = [dateFormatter stringFromDate:datoExpirationDate];

    [textoDeCaja appendString:textoExpirationDate];
    
    self.cajaTextoLogin.text = textoDeCaja;
}


@end
