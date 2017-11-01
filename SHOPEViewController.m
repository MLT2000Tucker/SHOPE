//
//  SHOPEViewController.m
//  SHOPE
//
//  Created by Michael Tucker on 4/10/13.
//  Copyright (c) 2013 Insware Design Group. All rights reserved.
//

#import "SHOPEViewController.h"
#import "Categories.h"

#define kPickerColumns 1
#define kStatePickerTag 20
#define kCIncLevPickerTag 21
#define kJIncLevPickerTag 22
#define allTrim( object ) [object stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet] ]

@interface SHOPEViewController ()

@end

@implementation SHOPEViewController

@synthesize btnGoToCalc;
@synthesize btnPS, frmPS, lblJPS;
@synthesize frmCName, frmJName, lblName;
@synthesize btnSt, frmSt, lblSt;
@synthesize frmCDOB, frmJDOB, frmCAge, frmJAge, lblDOB, lblJAge;
@synthesize btnCGender, frmCGender, btnJGender, frmJGender;
@synthesize btnCRetAge, frmCRetAge, btnJRetAge, frmJRetAge;
@synthesize lblJMI;
@synthesize btnCIncLev, frmCIncLev, btnJIncLev;
@synthesize frmCPTA, frmJPTA;
@synthesize btnCERMI, frmCERMI, btnJERMI, frmJERMI;
@synthesize frmCMedInfRate;
@synthesize btnCIncMediGapIns, frmCIncMediGapIns, btnJIncMediGapIns, frmJIncMediGapIns;
@synthesize frmCMediGapPremInfRate, frmJMediGapPremInfRate;
@synthesize frmCExpOOPAmt, frmCExpOOPInfRate, frmJExpOOPAmt, frmJExpOOPInfRate,lblJExpOOPAmt, lblJExpOOPInfRate;
@synthesize btnCIncLTC, frmCIncLTC, btnJIncLTC, frmJIncLTC;
@synthesize btnCIncLTCIns, frmCIncLTCIns, btnJIncLTCIns, frmJIncLTCIns;
@synthesize frmCExpLTCPremInfRate, frmCExpLTCInfRate, frmCLTCPolAge;
@synthesize frmJExpLTCPremInfRate, frmJExpLTCInfRate, frmJLTCPolAge, lblCExpLTCInfRate, lblJExpLTCInfRate;
@synthesize activePickerView, cIncLevPickerView, statePicker, jIncLevPickerView;
@synthesize statesArray, lifeExpAgesArray, cIncLevArray, jIncLevArray, pickersArray, cIncArray, jIncArray;
@synthesize lblCExpLTC0, lblCExpLTC1,lblCExpLTC2, lblJExpLTC1, lblJExpLTC2;
@synthesize lblCHC0, lblCHC1, lblCHC2, lblCPV0, lblCPV1, lblCPV2, frmCHCYrs, frmCNHYrs, frmCPVAmt, frmCPVInfRte, frmCPVYN, btnCPVYN;
@synthesize lblJHC0, lblJHC1, lblJHC2, lblJPV0, lblJPV1, lblJPV2, frmJHCYrs, frmJNHYrs, frmJPVAmt, frmJPVInfRte, frmJPVYN, btnJPVYN;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    medInfoView.scrollEnabled = YES;
    
    //UIScrollView *medInfoView=(UIScrollView *)self.view;

    [medInfoView setContentSize:CGSizeMake(900,600)];
    
	// Do any additional setup after loading the view, typically from a nib.
    
    int cliverno = 0;
    
    NSString *dataURL = @"http://sophos.zenithmarketing.com/interchk/shope/";
    NSFileManager *filemgr;
    NSString *docsDir;
    NSArray *dirPaths;
    filemgr = [NSFileManager defaultManager];
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = [dirPaths objectAtIndex:0];
    
    NSString *urlString;
    NSURL *url;
//
//NSLog(@"dataURL: %@", dataURL);
//NSLog(@"filemgr: %@", filemgr);
//NSLog(@"docsDir: %@", docsDir);
    
    urlString = [self concatenateString:dataURL withString: @"AppVerNo.txt"];
    url = [[NSURL alloc] initWithString:urlString];
    
    NSString *appvernocsv = [[NSString alloc] initWithContentsOfURL:url encoding:(NSStringEncoding)NSUTF8StringEncoding error:nil];
//appvernocsv = @"1";
//NSLog(@"appvernocsv: %@",appvernocsv);
    int appverno = 0;
    if ([appvernocsv length] == 0)
    {
        // Can't find AppVerNo.txt Table or it is empty
        appvernocsv = @"0";
//NSLog(@"appvernocsv length == 0");
    }
    
    appverno = [appvernocsv intValue];
//NSLog(@"appverno: %d", appverno);
//NSLog(@"cliverno: %d | appverno: %d", cliverno, appverno);
    if (cliverno != appverno)
    {
//NSLog(@"cliverno is not equal to appverno");
        if (appverno != 0)
        {
//NSLog(@"appverno is not equal to 0");
//NSLog(@"Perform fnGetUpdatedTables");
            [self fnGetUpdatedTables];
        }
    }
//NSLog(@"Perform fnInitCVariables");
    [self fnInitCVariables];
//NSLog(@"Perform fnHideWorkField");
    [self fnHideWorkFields];
   
//NSFileManager *filemgr;
    NSString *dataFile;
//NSString *docsDir;
//NSArray *dirPaths;
    NSArray *workArray = [[NSArray alloc] init];
    NSArray *rowArray = [[NSArray alloc] init];
    filemgr = [NSFileManager defaultManager];
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = [dirPaths objectAtIndex:0];
    NSString *sRow;
    
//NSLog(@"Open States.txt");
    
    dataFile = [docsDir stringByAppendingPathComponent: @"States.txt"];
//NSLog(@"dataFile: %@",dataFile);
    NSData *databuffer = [filemgr contentsAtPath: dataFile];
    NSString *wcsv = [[NSString alloc] initWithData: databuffer encoding:NSASCIIStringEncoding];
//NSLog(@"wcsv: %@",wcsv);
    workArray = [wcsv componentsSeparatedByString: @"\n"];
//NSLog(@"State workArray count: %d", [workArray count]);
//NSLog(@"State workArray description: %@", [workArray description]);
    
    for (int ii = 0; ii <= 51; ii++)
    {
        if (ii >> 0)
        {
//NSLog(@"ii: %d",ii);
            rowArray = [[workArray objectAtIndex: ii] componentsSeparatedByString: @"~"];
//NSLog(@"rowArray description: %@",[rowArray description]);
            sRow = [rowArray objectAtIndex: 2];
            [statesArray addObject:[NSString stringWithFormat:@"%@", sRow]];
        }
    }
    
//NSLog([statesArray description]);

//NSLog(@"Open LifeExpAges.txt");
    
    dataFile = [docsDir stringByAppendingPathComponent: @"LifeExpAges.txt"];
    databuffer = [filemgr contentsAtPath: dataFile];
    wcsv = [[NSString alloc] initWithData: databuffer encoding:NSASCIIStringEncoding];
//NSLog(@"wcsv contents: %@", wcsv);
    workArray = [wcsv componentsSeparatedByString: @"\n"];
    
    lifeExpAgesArray = [[NSMutableArray alloc] initWithCapacity: 3];
//NSLog(@"LifeExpAges workArray count: %d", [workArray count]);
//NSLog(@"LifeExpAges workArray description: %@", [workArray description]);
    int c0 = 0;
    int c1 = 0;
    int c2 = 0;
    
    for (int ii = 0; ii <= 66; ii++)
    {
        if (ii >> 0)
        {
            rowArray = [[workArray objectAtIndex: ii] componentsSeparatedByString: @"~"];
//NSLog(@"ii: %d rowArray: %@",ii,[rowArray description]);
            c0 = [[rowArray objectAtIndex: 0]intValue];
            c1 = [[rowArray objectAtIndex: 1]intValue];
            c2 = [[rowArray objectAtIndex: 2]intValue];
//NSLog(@"c0: %d | c1: %d | c2: %d", c0, c1, c2);
            [lifeExpAgesArray addObject:[NSMutableArray arrayWithObjects: [NSString stringWithFormat: @"%d", c0], [NSString stringWithFormat: @"%d", c1], [NSString stringWithFormat: @"%d", c2], nil]];
        }
    }
    
//NSLog(@"lifeExpAgesArray: %@",[lifeExpAgesArray description]);

//NSLog(@"Open MedPartB.txt");
    
    dataFile = [docsDir stringByAppendingPathComponent: @"MedPartB.txt"];
    databuffer = [filemgr contentsAtPath: dataFile];
    wcsv = [[NSString alloc] initWithData: databuffer encoding:NSASCIIStringEncoding];
    
    workArray = [wcsv componentsSeparatedByString: @"\n"];
    //cIncLevArray = [[NSMutableArray alloc] init];
    
    rowArray = [[NSArray alloc] init];
    cIncArray = [[NSMutableArray alloc] init];
    NSString *sCRow;

    for (int ii = 1; ii < [workArray count] - 1; ii++)
    {
        rowArray = [[workArray objectAtIndex: ii] componentsSeparatedByString: @"~"];
        sCRow = [rowArray objectAtIndex: 4];
        [cIncArray addObject:[NSString stringWithFormat:@"%@",sCRow]];
    }
//NSLog(@"cIncArray: %@", [cIncArray description]);
    
    jIncArray = [[NSMutableArray alloc] init];
    NSString *sJRow;
    
    for (int ii = 1; ii < [workArray count] - 1; ii++)
    {
        rowArray = [[workArray objectAtIndex: ii] componentsSeparatedByString: @"~"];
        sJRow = [rowArray objectAtIndex: 5];
        [jIncArray addObject:[NSString stringWithFormat:@"%@",sJRow]];
    }
//NSLog(@"jIncArray: %@", [jIncArray description]);
    int ps = [frmPS.text intValue];
    
    
    [btnPS setTitle:@"Single" forState:UIControlStateNormal];
    btnPSToggled = NO;
    
    if (ps == 1)
    {
        frmPS.text = @"1";
        [btnPS setTitle:@"Single" forState:UIControlStateNormal];
        btnPSToggled = YES;
    }
    else
    {
        frmPS.text = @"2";
        [btnPS setTitle:@"w/Spouse or Partner" forState:UIControlStateNormal];
        btnPSToggled = NO;
    }
    
    int cermi = [frmCERMI.text intValue];
    [btnCERMI setTitle:@"Yes" forState:UIControlStateNormal];
    btnCERMIToggled = NO;
    
    if (cermi == 1)
    {
        frmCERMI.text = @"1";
        [btnCERMI setTitle:@"Yes" forState:UIControlStateNormal];
        btnCERMIToggled = YES;
    }
    else
    {
        frmCERMI.text = @"2";
        [btnCERMI setTitle:@"No" forState:UIControlStateNormal];
        btnCERMIToggled = NO;
    }
    int jermi = [frmJERMI.text intValue];
    [btnJERMI setTitle:@"Yes" forState:UIControlStateNormal];
    btnJERMIToggled = NO;
    
    if (jermi == 1)
    {
        frmJERMI.text = @"1";
        [btnJERMI setTitle:@"Yes" forState:UIControlStateNormal];
        btnJERMIToggled = YES;
    }
    else
    {
        frmJERMI.text = @"2";
        [btnJERMI setTitle:@"No" forState:UIControlStateNormal];
        btnJERMIToggled = NO;
    }
    
    int cincltc = [frmCIncLTC.text intValue];
    [btnCIncLTC setTitle:@"Yes" forState:UIControlStateNormal];
    btnCIncLTCToggled = NO;
    
    if (cincltc == 1)
    {
        frmCIncLTC.text = @"1";
        [btnCIncLTC setTitle:@"Yes" forState:UIControlStateNormal];
        btnCIncLTCToggled = YES;
    }
    else
    {
        frmCIncLTC.text = @"2";
        [btnCIncLTC setTitle:@"No" forState:UIControlStateNormal];
        btnCIncLTCToggled = NO;
    }
    
    int cpvyn = [frmCPVYN.text intValue];
    [btnCPVYN setTitle:@"Yes" forState:UIControlStateNormal];
    btnCPVYNToggled = NO;
    
    if (cpvyn == 1)
    {
        frmCPVYN.text = @"1";
        [btnCPVYN setTitle:@"Yes" forState:UIControlStateNormal];
        btnCPVYNToggled = YES;
    }
    else
    {
        frmCPVYN.text = @"2";
        [btnCPVYN setTitle:@"No" forState:UIControlStateNormal];
        btnCPVYNToggled = NO;
    }

    int jpvyn = [frmJPVYN.text intValue];
    [btnJPVYN setTitle:@"Yes" forState:UIControlStateNormal];
    btnJPVYNToggled = NO;
    
    if (jpvyn == 1)
    {
        frmJPVYN.text = @"1";
        [btnJPVYN setTitle:@"Yes" forState:UIControlStateNormal];
        btnJPVYNToggled = YES;
    }
    else
    {
        frmJPVYN.text = @"2";
        [btnJPVYN setTitle:@"No" forState:UIControlStateNormal];
        btnJPVYNToggled = NO;
    }
    
    int jincltc = [frmJIncLTC.text intValue];
    [btnJIncLTC setTitle:@"Yes" forState:UIControlStateNormal];
    btnJIncLTCToggled = NO;
    
    if (jincltc == 1)
    {
        frmJIncLTC.text = @"1";
        [btnJIncLTC setTitle:@"Yes" forState:UIControlStateNormal];
        btnJIncLTCToggled = YES;
    }
    else
    {
        frmJIncLTC.text = @"2";
        [btnJIncLTC setTitle:@"No" forState:UIControlStateNormal];
        btnJIncLTCToggled = NO;
    }
    
    int cincltcins = [frmCIncLTCIns.text intValue];
    [btnCIncLTCIns setTitle:@"Yes" forState:UIControlStateNormal];
    btnCIncLTCInsToggled = NO;
    
    if (cincltcins == 1)
    {
        frmCIncLTCIns.text = @"1";
        [btnCIncLTCIns setTitle:@"Yes" forState:UIControlStateNormal];
        btnCIncLTCInsToggled = YES;
    }
    else
    {
        frmCIncLTCIns.text = @"2";
        [btnCIncLTCIns setTitle:@"No" forState:UIControlStateNormal];
        btnCIncLTCInsToggled = NO;
    }
    
    int jincltcins = [frmJIncLTCIns.text intValue];
    [btnJIncLTCIns setTitle:@"Yes" forState:UIControlStateNormal];
    btnJIncLTCInsToggled = NO;
    
    if (jincltcins == 1)
    {
        frmJIncLTCIns.text = @"1";
        [btnJIncLTCIns setTitle:@"Yes" forState:UIControlStateNormal];
        btnJIncLTCInsToggled = YES;
    }
    else
    {
        frmJIncLTCIns.text = @"2";
        [btnJIncLTCIns setTitle:@"No" forState:UIControlStateNormal];
        btnJIncLTCInsToggled = NO;
    }
    
    int cincmedigapins = [frmCIncMediGapIns.text intValue];
    [btnCIncMediGapIns setTitle:@"Yes" forState:UIControlStateNormal];
    btnCIncMediGapInsToggled = NO;
    
    if (cincmedigapins == 1)
    {
        frmCIncMediGapIns.text = @"1";
        [btnCIncMediGapIns setTitle:@"Yes" forState:UIControlStateNormal];
        btnCIncMediGapInsToggled = YES;
    }
    else
    {
        frmCIncMediGapIns.text = @"2";
        [btnCIncMediGapIns setTitle:@"No" forState:UIControlStateNormal];
        btnCIncMediGapInsToggled = NO;
    }
    int jincmedigapins = [frmJIncMediGapIns.text intValue];
    [btnJIncMediGapIns setTitle:@"Yes" forState:UIControlStateNormal];
    btnJIncMediGapInsToggled = NO;
    
    if (jincmedigapins == 1)
    {
        frmJIncMediGapIns.text = @"1";
        [btnJIncMediGapIns setTitle:@"Yes" forState:UIControlStateNormal];
        btnJIncMediGapInsToggled = YES;
    }
    else
    {
        frmJIncMediGapIns.text = @"2";
        [btnJIncMediGapIns setTitle:@"No" forState:UIControlStateNormal];
        btnJIncMediGapInsToggled = NO;
    }
    
    statePicker = [[UIPickerView alloc] initWithFrame:CGRectMake(140,150, 298, 315)];
	statePicker.backgroundColor = [UIColor blueColor];
	statePicker.tag = kStatePickerTag;
	statePicker.showsSelectionIndicator = TRUE;
	statePicker.hidden = YES;
	statePicker.dataSource = self;
    statePicker.delegate = self;
    
    cIncLevPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(140,300, 398, 315)];
	cIncLevPicker.backgroundColor = [UIColor blueColor];
	cIncLevPicker.tag = kCIncLevPickerTag;
	cIncLevPicker.showsSelectionIndicator = TRUE;
	cIncLevPicker.hidden = YES;
	cIncLevPicker.dataSource = self;
    cIncLevPicker.delegate = self;
    
    jIncLevPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(140,300, 398, 315)];
	jIncLevPicker.backgroundColor = [UIColor blueColor];
	jIncLevPicker.tag = kJIncLevPickerTag;
	jIncLevPicker.showsSelectionIndicator = TRUE;
	jIncLevPicker.hidden = YES;
	jIncLevPicker.dataSource = self;
    jIncLevPicker.delegate = self;
    
    pickersArray = [[NSArray alloc] initWithObjects: statePicker, cIncLevPicker, jIncLevPicker,nil];
    
    int value = [frmSt.text intValue];
    
    [btnSt setTitle:[statesArray objectAtIndex:value] forState:UIControlStateNormal];
    [btnSt setTitle:[statesArray objectAtIndex:value] forState:UIControlStateHighlighted];
    [btnSt setTitle:[statesArray objectAtIndex:value] forState:UIControlStateSelected];
    [statePicker selectRow:value inComponent:0 animated:YES];

    
    value = [frmCIncLev.text intValue];
    
    [btnCIncLev setTitle:[cIncArray objectAtIndex:value] forState:UIControlStateNormal];
    [btnCIncLev setTitle:[cIncArray objectAtIndex:value] forState:UIControlStateHighlighted];
    [btnCIncLev setTitle:[cIncArray objectAtIndex:value] forState:UIControlStateSelected];
    [cIncLevPicker selectRow:value inComponent:0 animated:YES];
    
    value = [frmCIncLev.text intValue];
    
    [btnJIncLev setTitle:[jIncArray objectAtIndex:value] forState:UIControlStateNormal];
    [btnJIncLev setTitle:[jIncArray objectAtIndex:value] forState:UIControlStateHighlighted];
    [btnJIncLev setTitle:[jIncArray objectAtIndex:value] forState:UIControlStateSelected];
    [jIncLevPicker selectRow:value inComponent:0 animated:YES];
    
    int cgender = [frmCGender.text intValue];
    if (cgender != 1)
    {
        frmCGender.text = @"2";
        [btnCGender setTitle:@"Female" forState:UIControlStateNormal];
        btnCGenderToggled = YES;
    }
    else
    {
        frmCGender.text = @"1";
        [btnCGender setTitle:@"Male" forState:UIControlStateNormal];
        btnCGenderToggled = NO;
    }
    int jgender = [frmJGender.text intValue];
    if (jgender != 1)
    {
        frmJGender.text = @"2";
        [btnJGender setTitle:@"Female" forState:UIControlStateNormal];
        btnJGenderToggled = YES;
    }
    else
    {
        frmJGender.text = @"1";
        [btnJGender setTitle:@"Male" forState:UIControlStateNormal];
        btnJGenderToggled = NO;
    }
    
    int cretage = [frmCRetAge.text intValue];
    if (cretage == 1)
    {
        frmCRetAge.text = @"2";
        [btnCRetAge setTitle:@"Already Retired" forState:UIControlStateNormal];
        btnCRetAgeToggled = YES;
        frmCRetAge.hidden = YES;
    }
    else
    {
        frmCRetAge.text = @"65";
        [btnCRetAge setTitle:@"Retirement Age" forState:UIControlStateNormal];
        btnCRetAgeToggled = NO;
        frmCRetAge.hidden = NO;
    }
    int jretage = [frmJRetAge.text intValue];
    if (jretage == 1)
    {
        frmJRetAge.text = @"2";
        [btnJRetAge setTitle:@"Already Retired" forState:UIControlStateNormal];
        btnJRetAgeToggled = YES;
        frmJRetAge.hidden = YES;
    }
    else
    {
        frmJRetAge.text = @"65";
        [btnJRetAge setTitle:@"Retirement Age" forState:UIControlStateNormal];
        btnJRetAgeToggled = NO;
        frmJRetAge.hidden = YES;
    }
}


-(void) fnGetUpdatedTables
{
//NSLog(@"Updating Tables from Internet");
    NSString *dataURL = @"http://sophos.zenithmarketing.com/interchk/SHOPE/";
    NSFileManager *filemgr;
    NSString *dataFile;
    NSString *docsDir;
    NSArray *dirPaths;
    filemgr = [NSFileManager defaultManager];
    NSString *urlString;
    NSURL *url;
    // Identify the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = [dirPaths objectAtIndex:0];
    NSString *wcsv = @"";
    NSData *databuffer;
    
//NSLog(@"Reading States.txt from Internet");
    urlString = [self concatenateString:dataURL withString: @"States.txt"];
    url = [[NSURL alloc] initWithString:urlString];
//NSLog(@"urlString: %@", urlString);
//NSLog(@"url: %@",url);
    
    wcsv = [[NSString alloc] initWithContentsOfURL:url encoding:(NSStringEncoding)NSUTF8StringEncoding error:nil];
//NSLog(@"Why is it empty? States.txt: %@", wcsv);
    
//NSLog(@"Creating States from Internet");
    dataFile = [docsDir stringByAppendingPathComponent: @"States.txt"];
    databuffer = [wcsv dataUsingEncoding: NSASCIIStringEncoding];
    [filemgr createFileAtPath: dataFile contents: databuffer attributes:nil];
    
//NSLog(@"Reading LifeExpAges.txt from Internet");
    urlString = [self concatenateString:dataURL withString: @"LifeExpAges.txt"];
    url = [[NSURL alloc] initWithString:urlString];
    wcsv = [[NSString alloc] initWithContentsOfURL:url encoding:(NSStringEncoding)NSUTF8StringEncoding error:nil];

//NSLog(@"Creating LifeExpAges from Internet");
    dataFile = [docsDir stringByAppendingPathComponent: @"LifeExpAges.txt"];
    databuffer = [wcsv dataUsingEncoding: NSASCIIStringEncoding];
    [filemgr createFileAtPath: dataFile contents: databuffer attributes:nil];
    
//NSLog(@"Reading MedPartB from Internet");
    urlString = [self concatenateString:dataURL withString: @"MedPartB.txt"];
    url = [[NSURL alloc] initWithString:urlString];
    wcsv = [[NSString alloc] initWithContentsOfURL:url encoding:(NSStringEncoding)NSUTF8StringEncoding error:nil];
//NSLog(@"Why is it empty? %@", wcsv);
    
//NSLog(@"Creating MedPartB from Internet");
    dataFile = [docsDir stringByAppendingPathComponent: @"MedPartB.txt"];
    databuffer = [wcsv dataUsingEncoding: NSASCIIStringEncoding];
    [filemgr createFileAtPath: dataFile contents: databuffer attributes:nil];
    
//NSLog(@"Reading MedPartD from Internet");
    urlString = [self concatenateString:dataURL withString: @"MedPartD.txt"];
    url = [[NSURL alloc] initWithString:urlString];
    wcsv = [[NSString alloc] initWithContentsOfURL:url encoding:(NSStringEncoding)NSUTF8StringEncoding error:nil];
//NSLog(@"wcsv: %@", wcsv);
//NSLog(@"Creating MedPartD from Internet");
    dataFile = [docsDir stringByAppendingPathComponent: @"MedPartD.txt"];
    databuffer = [wcsv dataUsingEncoding: NSASCIIStringEncoding];
    [filemgr createFileAtPath: dataFile contents: databuffer attributes:nil];
    
//NSLog(@"Reading MediGapPrems from Internet");
    urlString = [self concatenateString:dataURL withString: @"MediGapPremsII.txt"];
    url = [[NSURL alloc] initWithString:urlString];
    wcsv = [[NSString alloc] initWithContentsOfURL:url encoding:(NSStringEncoding)NSUTF8StringEncoding error:nil];
//NSLog(@"Wcsv: %@", wcsv);
//NSLog(@"Creating MediGapPrems from Internet");
    dataFile = [docsDir stringByAppendingPathComponent: @"MediGapPremsII.txt"];
    databuffer = [wcsv dataUsingEncoding: NSASCIIStringEncoding];
    [filemgr createFileAtPath: dataFile contents: databuffer attributes:nil];
    
//NSLog(@"Reading NoLTCStPrems from Internet");
    urlString = [self concatenateString:dataURL withString: @"NoLTCStPrems.txt"];
    url = [[NSURL alloc] initWithString:urlString];
    wcsv = [[NSString alloc] initWithContentsOfURL:url encoding:(NSStringEncoding)NSUTF8StringEncoding error:nil];
//NSLog(@"wcsv: %@", wcsv);
//NSLog(@"Creating NoLTCStPrems from Internet");
    dataFile = [docsDir stringByAppendingPathComponent: @"NoLTCStPrems.txt"];
    databuffer = [wcsv dataUsingEncoding: NSASCIIStringEncoding];
    [filemgr createFileAtPath: dataFile contents: databuffer attributes:nil];
    
//NSLog(@"Reading LTCPrems from Internet");
    urlString = [self concatenateString:dataURL withString: @"LTCPrems.txt"];
    url = [[NSURL alloc] initWithString:urlString];
    wcsv = [[NSString alloc] initWithContentsOfURL:url encoding:(NSStringEncoding)NSUTF8StringEncoding error:nil];
//SLog(@"wcsv: %@", wcsv);
//NSLog(@"Creating LTCPrems from Internet");
    dataFile = [docsDir stringByAppendingPathComponent: @"LTCPrems.txt"];
    databuffer = [wcsv dataUsingEncoding: NSASCIIStringEncoding];
    [filemgr createFileAtPath: dataFile contents: databuffer attributes:nil];
}

-(void) GoToCalcBtn
{
    [self fnValidate];
    [self fnPutData];
}
-(void) fnPutData
{
//NSLog(@"Begin fnPutData");
    NSFileManager *filemgr;
    NSData *databuffer;
    NSString *dataFile;
    NSString *docsDir;
    NSArray *dirPaths;
    
    filemgr = [NSFileManager defaultManager];
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = [dirPaths objectAtIndex:0];
    
    dataFile = [docsDir stringByAppendingPathComponent: @"shope.dat"];
    
    // Construct  and write textBox back to shope.dat
    NSString *textBox;
    textBox = [NSString stringWithFormat:@"%@~%@", frmPS.text , frmCName.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmJName.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmSt.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmCDOB.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmJDOB.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmCAge.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmJAge.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmCGender.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmJGender.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmCRetAge.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmJRetAge.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmCIncLev.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmCPTA.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmJPTA.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmCERMI.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmJERMI.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmCMedInfRate.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmCIncMediGapIns.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmJIncMediGapIns.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmCMediGapPremInfRate.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmJMediGapPremInfRate.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmCExpOOPAmt.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmCExpOOPInfRate.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmJExpOOPAmt.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmJExpOOPInfRate.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmCIncLTC.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmJIncLTC.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmCIncLTCIns.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmJIncLTCIns.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmCExpLTCPremInfRate.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmJExpLTCPremInfRate.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmCExpLTCInfRate.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmJExpLTCInfRate.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmCLTCPolAge.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmJLTCPolAge.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmCHCYrs.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmCNHYrs.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmCPVYN.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmCPVInfRte.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmCPVAmt.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmJHCYrs.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmJNHYrs.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmJPVYN.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmJPVInfRte.text];
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , frmJPVAmt.text];
    
    textBox = [NSString stringWithFormat:@"%@~%@", textBox , nil];
    databuffer = [textBox dataUsingEncoding: NSASCIIStringEncoding];
    [filemgr createFileAtPath: dataFile contents: databuffer attributes:nil];
//NSLog(textBox);
    //[filemgr release];
}

- (NSString*) concatenateString:(NSString*)stringA withString:(NSString*)stringB
{
	NSString *finalString = [NSString stringWithFormat:@"%@%@", stringA , stringB];
    return finalString;
}

-(void) fnValidate
{
    validData = YES;
    lblName.textColor = [UIColor blackColor];
    lblName.backgroundColor = [UIColor clearColor];
    // Validate Name - Must contain a value
    if ([frmCName.text length] == 0)
    {
        validData = NO;
        lblName.textColor = [UIColor redColor];
    }
    lblSt.textColor = [UIColor blackColor];
    lblSt.backgroundColor = [UIColor clearColor];
    if ([frmSt.text length] == 0)
    {
        validData = NO;
        lblSt.textColor = [UIColor redColor];
    }
    
}
- (void)dealloc
{
//    [statesArray release];
//    [lifeExpAgesArray release];
//    [incLevArray release];
//    [statePicker release];
//    [incLevPicker release];
//    [super dealloc];
}


-(int) fnCalcAge : (NSString*) dateIn
{
    int mn = [[[dateIn componentsSeparatedByString : @"/"]  objectAtIndex: 0] intValue];
    int dy = [[[dateIn componentsSeparatedByString : @"/"]  objectAtIndex: 1] intValue];
    int yr = [[[dateIn componentsSeparatedByString : @"/"]  objectAtIndex: 2] intValue];
    NSDate *now = [NSDate date];
    NSString *strDate = [[NSString alloc] initWithFormat:@"%@",now];
    NSArray *arr = [strDate componentsSeparatedByString:@" "];
    NSString *str;
    str = [arr objectAtIndex:0];
    NSArray *arr_my = [str componentsSeparatedByString:@"-"];
    int cdy = [[arr_my objectAtIndex:2] intValue];
    int cmn = [[arr_my objectAtIndex:1] intValue];
    int cyr = [[arr_my objectAtIndex:0] intValue];
    int age = cyr - yr;
    if (((cmn * 100) + cdy) < ((mn * 100) + dy))
    {
        age = age - 1;
    }
    return age;
}

-(void) valCDOB
{
    NSString *value;
    value = allTrim(frmCDOB.text);
    if ([self valDate : value])
    {
        lblDOB.textColor = [UIColor blackColor];
        frmCAge.text = [NSString stringWithFormat:@"%d",[self fnCalcAge : value]];
        frmCPTA.text = [self fnCalcPTA: frmCAge.text: frmCGender.text];
    }
    else
    {
        lblDOB.textColor = [UIColor redColor];
        frmCAge.text = nil;
    }
}
-(void) valJDOB
{
    NSString *value;
    value = allTrim(frmJDOB.text);
    if ([self valDate : value])
    {
        lblDOB.textColor = [UIColor blackColor];
        frmJAge.text = [NSString stringWithFormat:@"%d",[self fnCalcAge : value]];
        frmJPTA.text = [self fnCalcPTA: frmJAge.text: frmJGender.text];
    }
    else
    {
        lblDOB.textColor = [UIColor redColor];
        frmJAge.text = nil;
    }
}
-(BOOL) valDate :(NSString*)value
{    
    int mn = [[[value componentsSeparatedByString : @"/"]  objectAtIndex: 0] intValue];
    if (mn < 1) return false;
    if (mn > 12) return false;
    
    int dy = [[[value componentsSeparatedByString : @"/"]  objectAtIndex: 1] intValue];
    if (dy < 1) return false;
    if (dy > 31) return false;
    
    if (mn == 2)
        if (dy > 29) return false;
    
    if (mn != 1)
        if (mn != 3)
            if (mn != 5)
                if (mn != 7)
                    if (mn !=8)
                        if (mn !=10)
                            if (mn != 12)
                                if (dy > 30) return false;
    
    int yr = [[[value componentsSeparatedByString : @"/"]  objectAtIndex: 2] intValue];
    if (yr < 1900) return false;
    
    NSDate *now = [NSDate date];
    NSString *strDate = [[NSString alloc] initWithFormat:@"%@",now];
    NSArray *arr = [strDate componentsSeparatedByString:@" "];
    NSString *str;
    str = [arr objectAtIndex:0];
    NSArray *arr_my = [str componentsSeparatedByString:@"-"];
    //int cdy = [[arr_my objectAtIndex:2] intValue];
    //int cmn = [[arr_my objectAtIndex:1] intValue];
    int cyr = [[arr_my objectAtIndex:0] intValue];
    
    if (yr > cyr) return false;
    
    return true;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)eve
{
    statePicker.hidden = YES;
    cIncLevPicker.hidden = YES;
    jIncLevPicker.hidden = YES;
}

-(IBAction) showStatePicker
{
    if (statePicker.hidden)
    {
		statePicker.hidden = NO;
		[self.view addSubview:statePicker];
        cIncLevPicker.hidden = YES;
        jIncLevPicker.hidden = YES;
        [cIncLevPicker removeFromSuperview];
        [jIncLevPicker removeFromSuperview];
    }
	else
    {
		statePicker.hidden = YES;
		[statePicker removeFromSuperview];
	}
}

-(IBAction) showCIncLevPicker
{
    if (cIncLevPicker.hidden)
    {
		cIncLevPicker.hidden = NO;
		[self.view addSubview:cIncLevPicker];
        jIncLevPicker.hidden = YES;
        [jIncLevPicker removeFromSuperview];
        statePicker.hidden = YES;
		[statePicker removeFromSuperview];
    }
	else
    {
		cIncLevPicker.hidden = YES;
		[cIncLevPicker removeFromSuperview];
        jIncLevPicker.hidden = YES;
        [jIncLevPicker removeFromSuperview];
        statePicker.hidden = YES;
		[statePicker removeFromSuperview];
	}
}

-(IBAction) showJIncLevPicker
{
    if (jIncLevPicker.hidden)
    {
		jIncLevPicker.hidden = NO;
		[self.view addSubview:jIncLevPicker];
        cIncLevPicker.hidden = YES;
        [cIncLevPicker removeFromSuperview];
        statePicker.hidden = YES;
		[statePicker removeFromSuperview];
    }
	else
    {
		jIncLevPicker.hidden = YES;
		[jIncLevPicker removeFromSuperview];
        cIncLevPicker.hidden = YES;
        [cIncLevPicker removeFromSuperview];
        statePicker.hidden = YES;
		[statePicker removeFromSuperview];
	}
}

#pragma mark -
#pragma mark picker methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return kPickerColumns;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSInteger ans = 0;
    if (pickerView.tag == kStatePickerTag)
    {
        ans = [statesArray count];
    }
    if (pickerView.tag == kCIncLevPickerTag)
    {
        ans = [cIncArray count];
    }
    if (pickerView.tag == kJIncLevPickerTag)
    {
        ans = [jIncArray count];
    }
    return ans;
}

- (NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *ans = @"";
    if (pickerView.tag == kStatePickerTag)
    {
        ans = [statesArray objectAtIndex:row];
    }
    if (pickerView.tag == kCIncLevPickerTag)
    {
        ans = [cIncArray objectAtIndex: row];
    }
    if (pickerView.tag == kJIncLevPickerTag)
    {
        ans = [jIncArray objectAtIndex: row];
    }
    return ans;
}

-(void) pickerView : (UIPickerView *) pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component
{
    if (pickerView.tag == kStatePickerTag)
    {
        NSString *stateType = [statesArray objectAtIndex:[pickerView selectedRowInComponent:0]];
        [btnSt setTitle:stateType forState:UIControlStateNormal];
        frmSt.text = [NSString stringWithFormat:@"%d",row + 1];
//NSLog(@"pickerView - frmSt.text: %@", frmSt.text);
    }
    
    if (pickerView.tag == kCIncLevPickerTag)
    {
        NSString *cIncLevType = [cIncArray objectAtIndex:[pickerView selectedRowInComponent:0]];
        [btnCIncLev setTitle:cIncLevType forState:UIControlStateNormal];
        frmCIncLev.text = [NSString stringWithFormat:@"%d",row];
//NSLog(@"pickerView - frmCIncLev.text: %@", frmCIncLev.text);
    }
    
    if (pickerView.tag == kJIncLevPickerTag)
    {
        NSString *jIncLevType = [jIncArray objectAtIndex:[pickerView selectedRowInComponent:0]];
        [btnJIncLev setTitle:jIncLevType forState:UIControlStateNormal];
        frmCIncLev.text = [NSString stringWithFormat:@"%d",row];
//NSLog(@"pickerView - frmCIncLev.text: %@", frmCIncLev.text);
    }
}

-(IBAction) alternatePickers: (id) sender
{
    UIButton * control = (UIButton*) sender;
    if (self.activePickerView)
    {
        [self.activePickerView removeFromSuperview];
    }
//NSLog(@"Segment index:%d",control.tag);
    self.activePickerView = [pickersArray objectAtIndex:control.tag];
    [self.view  addSubview:self.activePickerView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) togglePSBtn
{
    if (!btnPSToggled)
    {
        frmPS.text = @"1";
        [btnPS setTitle:@"Single" forState:UIControlStateNormal];
        btnPSToggled = YES;
        [self fnHideJSide];
    }
    else
    {
        frmPS.text = @"2";
        [btnPS setTitle:@"w/Spouse or Partner" forState:UIControlStateNormal];
        btnPSToggled = NO;
        [self fnUnHideJSide];
    }
}

-(void) toggleCERMIBtn
{
    if (!btnCERMIToggled)
    {
        frmCERMI.text = @"1";
        [btnCERMI setTitle:@"Yes" forState:UIControlStateNormal];
        btnCERMIToggled = YES;
    }
    else
    {
        frmCERMI.text = @"2";
        [btnCERMI setTitle:@"No" forState:UIControlStateNormal];
        btnCERMIToggled = NO;
    }
}
-(void) toggleJERMIBtn
{
    if (!btnJERMIToggled)
    {
        frmJERMI.text = @"1";
        [btnJERMI setTitle:@"Yes" forState:UIControlStateNormal];
        btnJERMIToggled = YES;
    }
    else
    {
        frmJERMI.text = @"2";
        [btnJERMI setTitle:@"No" forState:UIControlStateNormal];
        btnJERMIToggled = NO;
    }
}
-(void) toggleCIncMediGapInsBtn
{
    if (!btnCIncMediGapInsToggled)
    {
        frmCIncMediGapIns.text = @"1";
        [btnCIncMediGapIns  setTitle:@"Yes" forState:UIControlStateNormal];
        btnCIncMediGapInsToggled = YES;
        frmCMediGapPremInfRate.hidden = NO;
    }
    else
    {
        frmCIncMediGapIns.text = @"2";
        [btnCIncMediGapIns setTitle:@"No" forState:UIControlStateNormal];
        btnCIncMediGapInsToggled = NO;
        frmCMediGapPremInfRate.hidden = YES;
        frmCMediGapPremInfRate.text = @"0.00";
    }
}
-(void) toggleJIncMediGapInsBtn
{
    if (!btnJIncMediGapInsToggled)
    {
        frmJIncMediGapIns.text = @"1";
        [btnJIncMediGapIns  setTitle:@"Yes" forState:UIControlStateNormal];
        btnJIncMediGapInsToggled = YES;
        frmJMediGapPremInfRate.hidden = NO;
    }
    else
    {
        frmJIncMediGapIns.text = @"2";
        [btnJIncMediGapIns setTitle:@"No" forState:UIControlStateNormal];
        btnJIncMediGapInsToggled = NO;
        frmJMediGapPremInfRate.hidden = YES;
        frmJMediGapPremInfRate.text = @"0.00";
    }
}

-(void) toggleCGenderBtn
{
    if (!btnCGenderToggled)
    {
        frmCGender.text = @"2";
        [btnCGender setTitle:@"Female" forState:UIControlStateNormal];
        btnCGenderToggled = YES;
    }
    else
    {
        frmCGender.text = @"1";
        [btnCGender setTitle:@"Male" forState:UIControlStateNormal];
        btnCGenderToggled = NO;
    }
    frmCPTA.text = [self fnCalcPTA: frmCAge.text: frmCGender.text];
}
-(void) toggleJGenderBtn
{
    if (!btnJGenderToggled)
    {
        frmJGender.text = @"2";
        [btnJGender setTitle:@"Female" forState:UIControlStateNormal];
        btnJGenderToggled = YES;
    }
    else
    {
        frmJGender.text = @"1";
        [btnJGender setTitle:@"Male" forState:UIControlStateNormal];
        btnJGenderToggled = NO;
    }
    frmJPTA.text = [self fnCalcPTA: frmJAge.text: frmJGender.text];
}
-(void) toggleCRetAgeBtn
{
    if (!btnCRetAgeToggled)
    {
        frmCRetAge.text = @"2";
        [btnCRetAge setTitle:@"Already Retired" forState:UIControlStateNormal];
        btnCRetAgeToggled = YES;
        frmCRetAge.hidden = YES;
    }
    else
    {
        frmCRetAge.text = @"65";
        [btnCRetAge setTitle:@"Retirement Age" forState:UIControlStateNormal];
        btnCRetAgeToggled = NO;
        frmCRetAge.hidden = NO;
    }
}
-(void) toggleJRetAgeBtn
{
    if (!btnJRetAgeToggled)
    {
        frmJRetAge.text = @"2";
        [btnJRetAge setTitle:@"Already Retired" forState:UIControlStateNormal];
        btnJRetAgeToggled = YES;
        frmJRetAge.hidden = YES;
    }
    else
    {
        frmJRetAge.text = @"65";
        [btnJRetAge setTitle:@"Retirement Age" forState:UIControlStateNormal];
        btnJRetAgeToggled = NO;
        frmJRetAge.hidden = NO;
    }
}
-(void) fnCMedInfRateChanged
{
    float medinfrate = [frmCMedInfRate.text floatValue] / 100;
    frmCMedInfRate.text = [self fnFormatData: 3 : medinfrate];
}
-(void) fnCPVInfRteChanged
{
    float pvinfrte = [frmCPVInfRte.text floatValue] / 100;
    frmCPVInfRte.text = [self fnFormatData: 3 : pvinfrte];
}
-(void) fnCPVAmtChanged
{
    float cpvamt = [frmCPVAmt.text floatValue];
    frmCPVAmt.text = [self fnFormatData:2 :cpvamt];
}
-(void) fnJPVInfRteChanged
{
    float pvinfrte = [frmJPVInfRte.text floatValue] / 100;
    frmJPVInfRte.text = [self fnFormatData: 3 : pvinfrte];
}
-(void) fnJPVAmtChanged
{
    float jpvamt = [frmCPVAmt.text floatValue];
    frmJPVAmt.text = [self fnFormatData:2 :jpvamt];
}
-(void) fnCMediGapPremInfRateChanged
{
    float medinfrate = [frmCMediGapPremInfRate.text floatValue] / 100;
    frmCMediGapPremInfRate.text = [self fnFormatData:3 :medinfrate];
}
-(void) fnJMediGapPremInfRateChanged
{
    float medinfrate = [frmJMediGapPremInfRate.text floatValue] / 100;
    frmJMediGapPremInfRate.text = [self fnFormatData:3 :medinfrate];
}
-(void) fnCExpOOPAmtChanged
{
    float cexpoopamt = [frmCExpOOPAmt.text floatValue];
    frmCExpOOPAmt.text = [self fnFormatData:2 :cexpoopamt];
}
-(void) fnJExpOOPAmtChanged
{
    float jexpoopamt = [frmJExpOOPAmt.text floatValue];
    frmJExpOOPAmt.text = [self fnFormatData:2 :jexpoopamt];
}
-(void) fnCExpOOPInfRateChanged
{
    float cexpoopinfrate = [frmCExpOOPInfRate.text floatValue] / 100;
    frmCExpOOPInfRate.text = [self fnFormatData:3 :cexpoopinfrate];
}
-(void) fnJExpOOPInfRateChanged
{
    float jexpoopinfrate = [frmJExpOOPInfRate.text floatValue] / 100;
    frmJExpOOPInfRate.text = [self fnFormatData:3 :jexpoopinfrate];
}
-(void) fnCExpLTCPremInfRateChanged
{
    float cexpltcpreminfrate = [frmCExpLTCPremInfRate.text floatValue] / 100;
    frmCExpLTCPremInfRate.text = [self fnFormatData:3 :cexpltcpreminfrate];
}
-(void) fnJExpLTCPremInfRateChanged
{
    float jexpltcpreminfrate = [frmJExpLTCPremInfRate.text floatValue] / 100;
    frmJExpLTCPremInfRate.text = [self fnFormatData:3 :jexpltcpreminfrate];
}
-(void) fnCExpLTCInfRateChanged
{
    float cexpltcinfrate = [frmCExpLTCInfRate.text floatValue] / 100;
    frmCExpLTCInfRate.text = [self fnFormatData:3 :cexpltcinfrate];
}
-(void) fnJExpLTCInfRateChanged
{
    float jexpltcinfrate = [frmJExpLTCInfRate.text floatValue] / 100;
    frmJExpLTCInfRate.text = [self fnFormatData:3 :jexpltcinfrate];
}
-(void) fnCLTCPolAgeChanged
{
    int cltcpolage = [frmCLTCPolAge.text intValue];
    frmCLTCPolAge.text = [self fnFormatData:1 :cltcpolage];
}
-(void) fnJLTCPolAgeChanged
{
    int jltcpolage = [frmJLTCPolAge.text intValue];
    frmJLTCPolAge.text = [self fnFormatData:1 :jltcpolage];
}
-(void) toggleCIncLTCBtn
{
    if (!btnCIncLTCToggled)
    {
        frmCIncLTC.text = @"1";
        [btnCIncLTC setTitle:@"Yes" forState:UIControlStateNormal];
        btnCIncLTCToggled = YES;
        btnCIncLTCIns.hidden = NO;
        frmCExpLTCPremInfRate.hidden = NO;
        lblCExpLTC0.hidden = NO;
        lblCExpLTC1.hidden = NO;
        lblCExpLTC2.hidden = NO;
        frmCLTCPolAge.hidden = NO;
        frmCExpLTCInfRate.hidden = YES;
        lblCExpLTCInfRate.hidden = YES;
        lblCHC0.hidden = NO;
        lblCHC1.hidden = NO;
        lblCHC2.hidden = NO;
        frmCHCYrs.hidden = NO;
        frmCNHYrs.hidden = NO;
    }
    else
    {
        frmCIncLTC.text = @"2";
        [btnCIncLTC setTitle:@"No" forState:UIControlStateNormal];
        btnCIncLTCToggled = NO;
        btnCIncLTCIns.hidden = YES;
        frmCExpLTCPremInfRate.hidden = YES;
        lblCExpLTC0.hidden = YES;
        if ([frmPS.text intValue] == 2)
            if ([frmJIncLTC.text intValue] == 1)
                lblCExpLTC0.hidden = NO;
        lblCExpLTC1.hidden = YES;
        lblCExpLTC2.hidden = YES;
        frmCLTCPolAge.hidden = YES;
        frmCExpLTCInfRate.hidden = YES;
        lblCExpLTCInfRate.hidden = YES;
        lblCHC0.hidden = YES;
        lblCHC1.hidden = YES;
        lblCHC2.hidden = YES;
        frmCHCYrs.hidden = YES;
        frmCNHYrs.hidden = YES;
    }
}

-(void) toggleCPVYNBtn
{
    if (!btnCPVYNToggled)
    {
        frmCPVYN.text = @"1";
        [btnCPVYN setTitle:@"Yes" forState:UIControlStateNormal];
        btnCPVYNToggled = YES;
        lblCPV1.hidden = NO;
        lblCPV2.hidden = NO;
        frmCPVInfRte.hidden = NO;
        frmCPVAmt.hidden = NO;
    }
    else
    {
        frmCPVYN.text = @"2";
        [btnCPVYN setTitle:@"No" forState:UIControlStateNormal];
        btnCPVYNToggled = NO;
        lblCPV1.hidden = YES;
        lblCPV2.hidden = YES;
        frmCPVInfRte.hidden = YES;
        frmCPVAmt.hidden = YES;
    }
}

-(void) toggleJPVYNBtn
{
    if (!btnJPVYNToggled)
    {
        frmJPVYN.text = @"1";
        [btnJPVYN setTitle:@"Yes" forState:UIControlStateNormal];
        btnJPVYNToggled = YES;
        lblJPV1.hidden = NO;
        lblJPV2.hidden = NO;
        frmJPVInfRte.hidden = NO;
        frmJPVAmt.hidden = NO;
    }
    else
    {
        frmJPVYN.text = @"2";
        [btnJPVYN setTitle:@"No" forState:UIControlStateNormal];
        btnJPVYNToggled = NO;
        lblJPV1.hidden = YES;
        lblJPV2.hidden = YES;
        frmJPVInfRte.hidden = YES;
        frmJPVAmt.hidden = YES;
    }
}
-(void) toggleJIncLTCBtn
{
    if (!btnJIncLTCToggled)
    {
        frmJIncLTC.text = @"1";
        [btnJIncLTC setTitle:@"Yes" forState:UIControlStateNormal];
        btnJIncLTCToggled = YES;
        btnJIncLTCIns.hidden = NO;
        frmJExpLTCPremInfRate.hidden = NO;
        frmJLTCPolAge.hidden = NO;
        lblCExpLTC0.hidden = NO;
        lblJExpLTC1.hidden = NO;
        lblJExpLTC2.hidden = NO;
        frmJExpLTCInfRate.hidden = YES;
        lblJExpLTCInfRate.hidden = YES;
        lblJHC0.hidden = NO;
        lblJHC1.hidden = NO;
        lblJHC2.hidden = NO;
        frmJHCYrs.hidden = NO;
        frmJNHYrs.hidden = NO;
    }
    else
    {
        frmJIncLTC.text = @"2";
        [btnJIncLTC setTitle:@"No" forState:UIControlStateNormal];
        btnJIncLTCToggled = NO;
        btnJIncLTCIns.hidden = YES;
        frmJExpLTCPremInfRate.hidden = YES;
        lblCExpLTC0.hidden = YES;
        if ([frmCIncLTC.text intValue] == 1)
                lblCExpLTC0.hidden = NO;
        lblJExpLTC1.hidden = YES;
        lblJExpLTC2.hidden = YES;
        frmJLTCPolAge.hidden = YES;
        frmJExpLTCInfRate.hidden = YES;
        lblJExpLTCInfRate.hidden = YES;
        lblJHC0.hidden = YES;
        lblJHC1.hidden = YES;
        lblJHC2.hidden = YES;
        frmJHCYrs.hidden = YES;
        frmJNHYrs.hidden = YES;
    }
}
-(void) toggleCIncLTCInsBtn
{
    if (!btnCIncLTCInsToggled)
    {
        frmCIncLTCIns.text = @"1";
        [btnCIncLTCIns setTitle:@"Yes" forState:UIControlStateNormal];
        btnCIncLTCInsToggled = YES;
        frmCExpLTCPremInfRate.hidden = NO;
        frmCLTCPolAge.hidden = NO;
        lblCExpLTC1.hidden = NO;
        lblCExpLTC2.hidden = NO;
        frmCExpLTCInfRate.hidden = YES;
        lblCExpLTCInfRate.hidden = YES;
        
    }
    else
    {
        frmCIncLTCIns.text = @"2";
        [btnCIncLTCIns setTitle:@"No" forState:UIControlStateNormal];
        btnCIncLTCInsToggled = NO;
        frmCExpLTCPremInfRate.hidden = YES;
        frmCLTCPolAge.hidden = YES;
        lblCExpLTC1.hidden = YES;
        lblCExpLTC2.hidden = YES;
        frmCExpLTCInfRate.hidden = NO;
        lblCExpLTCInfRate.hidden = NO;
        
    }
}
-(void) toggleJIncLTCInsBtn
{
    if (!btnJIncLTCInsToggled)
    {
        frmJIncLTCIns.text = @"1";
        [btnJIncLTCIns setTitle:@"Yes" forState:UIControlStateNormal];
        btnJIncLTCInsToggled = YES;
        frmJExpLTCPremInfRate.hidden = NO;
        frmJLTCPolAge.hidden = NO;
        lblJExpLTC1.hidden = NO;
        lblJExpLTC2.hidden = NO;
        frmJExpLTCInfRate.hidden = YES;
        lblJExpLTCInfRate.hidden = YES;
    }
    else
    {
        frmJIncLTCIns.text = @"2";
        [btnJIncLTCIns setTitle:@"No" forState:UIControlStateNormal];
        btnJIncLTCInsToggled = NO;
        frmJExpLTCPremInfRate.hidden = YES;
        frmJLTCPolAge.hidden = YES;
        lblJExpLTC1.hidden = YES;
        lblJExpLTC2.hidden = YES;
        frmJExpLTCInfRate.hidden = NO;
        lblJExpLTCInfRate.hidden = NO;
    }
}
-(void) fnInitCVariables
{
    // Initialize variables for first time use
    frmPS.text = [self fnFormatData: 1 : 1];
    frmCName.text = @"Client's Name";
    frmSt.text = [self fnFormatData: 1 : 31 - 1]; // New Jersey
    frmCDOB.text = @"8/8/1949";
    frmCAge.text = [self fnFormatData: 1 : 64];
    frmCGender.text = [self fnFormatData: 1 : 1];
    frmCRetAge.text = [self fnFormatData: 1 : 65];
    frmCIncLev.text = [self fnFormatData: 1 : 0];
    frmCPTA.text =    [self fnFormatData: 1 : 85];
    frmCERMI.text = [self fnFormatData: 1 : 1];
    frmCMedInfRate.text = [self fnFormatData: 3 : 0];
    frmCIncMediGapIns.text = [self fnFormatData: 1 : 1];
    frmCMediGapPremInfRate.text = [self fnFormatData: 3 : 0];
    frmCExpOOPAmt.text = [self fnFormatData: 2 : 0];
    frmCExpOOPInfRate.text = [self fnFormatData: 3 : 0];
    
    frmCIncLTC.text = [self fnFormatData: 1 : 1];
    frmCIncLTCIns.text = [self fnFormatData: 1 : 1];
    
    frmCExpLTCPremInfRate.text = [self fnFormatData: 3 : 0];
    frmCExpLTCPremInfRate.hidden = NO;
    frmCLTCPolAge.text = [self fnFormatData: 1 : 65];
    frmCLTCPolAge.hidden = NO;
    lblCExpLTC0.hidden = NO;
    lblCExpLTC1.hidden = NO;
    lblCExpLTC2.hidden = NO;
    
    frmCExpLTCInfRate.text = [self fnFormatData: 3 : 0];
    frmCExpLTCInfRate.hidden = YES;
    frmCExpLTCInfRate.hidden = YES;
    lblCExpLTCInfRate.hidden = YES;
    
    lblCPV0.hidden = NO;
    lblCPV1.hidden = NO;
    lblCPV2.hidden = NO;
    frmCHCYrs.hidden = NO;
    frmCNHYrs.hidden = NO;
    frmCHCYrs.text = [self fnFormatData: 1 : 1];
    frmCNHYrs.text = [self fnFormatData: 1 : 3];
    
    frmCPVYN.text = [self fnFormatData: 1 : 1];
    frmCPVInfRte.text = [self fnFormatData: 3 : 0];
    frmCPVAmt.text = [self fnFormatData: 2 : 0];
    lblCPV0.hidden = NO;
    lblCPV1.hidden = NO;
    lblCPV2.hidden = NO;
    btnCPVYN.hidden = NO;
    frmCPVYN.hidden = NO;
    frmCPVInfRte.hidden = NO;
    frmCPVAmt.hidden = NO;
//NSLog(@"fnInitCVariables - End of Function");
    [self fnInitJVariables];
}

-(NSString*) fnCalcPTA: (NSString*) age : (NSString*) gender
{
    NSString *ans = nil;
    int a = [age intValue];
    int g = [gender intValue];
    int c0 = 0;
    int c1 = 0;
    int c2 = 0;
    
    NSArray *rowArray = [[NSArray alloc] init];
//NSLog(@"lifeExpAgesArray description: %@", [lifeExpAgesArray description]);
    for (int ii = 0; ii <= 65; ii++)
    {
        rowArray = [lifeExpAgesArray objectAtIndex: ii];
//NSLog([rowArray description]);
        c0 = [[rowArray objectAtIndex: 0] intValue];
        c1 = [[rowArray objectAtIndex: 1] intValue];
        c2 = [[rowArray objectAtIndex: 2] intValue];
        
        if (c0 == a)
        {
            if (g == 1)
            {
                ans = [NSString stringWithFormat: @"%d", c1];
            }
            else
            {
                ans = [NSString stringWithFormat: @"%d", c2];
            }
//NSLog(@"c0: %d | c1: %d | c2: %d", c0, c1, c2);
        }
    }
    return ans;
}

-(void) fnInitJVariables
{
    frmJName.text = @"Spouse's / Partner's Name";
    frmJDOB.text = @"5/4/1947";
    frmJAge.text = [self fnFormatData: 1 : 67];
    frmJGender.text = [self fnFormatData: 1 : 2];
    frmJRetAge.text = [self fnFormatData: 1 : 65];
    frmJPTA.text = [self fnFormatData: 1 : 86];
    frmJERMI.text = [self fnFormatData: 1 : 1];
    frmJIncMediGapIns.text = [self fnFormatData: 1 : 1];
    frmJMediGapPremInfRate.text = [self fnFormatData: 3 : 0];
    frmJExpOOPAmt.text = [self fnFormatData: 2 : 0];
    frmJExpOOPInfRate.text = [self fnFormatData: 3 : 0];
    
    frmJIncLTC.text = [self fnFormatData: 1 : 1];
    frmJIncLTCIns.text = [self fnFormatData: 1 : 1];
    
    frmJExpLTCPremInfRate.text = [self fnFormatData: 3 : 0];
    frmJExpLTCPremInfRate.hidden = NO;
    frmJLTCPolAge.text = [self fnFormatData: 1 : 65];
    frmJLTCPolAge.hidden = NO;
    lblCExpLTC0.hidden = YES;
    
    if ([frmCIncLTC.text intValue] == 1)
        lblCExpLTC0.hidden = NO;
    
    frmJExpLTCInfRate.text = [self fnFormatData: 3 : 0];
    frmJExpLTCInfRate.hidden = YES;
    frmJExpLTCInfRate.hidden = YES;
    lblJExpLTCInfRate.hidden = YES;
    
    lblJPV0.hidden = NO;
    lblJPV1.hidden = NO;
    lblJPV2.hidden = NO;
    frmJHCYrs.hidden = NO;
    frmJNHYrs.hidden = NO;
    frmJHCYrs.text = [self fnFormatData: 1 : 1];
    frmJNHYrs.text = [self fnFormatData: 1 : 3];
    
    frmJPVYN.text = [self fnFormatData: 1 : 1];
    frmJPVInfRte.text = [self fnFormatData: 3 : 0];
    frmJPVAmt.text = [self fnFormatData: 2 : 0];
    lblJPV0.hidden = NO;
    lblJPV1.hidden = NO;
    lblJPV2.hidden = NO;
    btnJPVYN.hidden = NO;
    frmJPVYN.hidden = NO;
    frmJPVInfRte.hidden = NO;
    frmJPVAmt.hidden = NO;
//NSLog(@"fnInitJVariables - End of Function");
    [self fnHideJSide];
}
-(void) fnHideWorkFields
{
    frmPS.hidden = YES;
    frmSt.hidden = YES;
    frmCGender.hidden = YES;
    frmJGender.hidden = YES;
    frmCIncLev.hidden = YES;
    frmCERMI.hidden = YES;
    frmJERMI.hidden = YES;
    frmCIncMediGapIns.hidden = YES;
    frmJIncMediGapIns.hidden = YES;
    frmCIncLTC.hidden = YES;
    frmCPVYN.hidden = YES;
    frmJPVYN.hidden = YES;
    frmJIncLTC.hidden = YES;
    frmCIncLTCIns.hidden = YES;
    frmJIncLTCIns.hidden = YES;
//NSLog(@"fnHideWorkFields - End of Function");
}


-(void) fnHideJSide
{
    lblJPS.hidden = YES;
    frmJName.hidden = YES;
    frmJDOB.hidden = YES;
    frmJAge.hidden = YES;
    lblJAge.hidden = YES;
    frmJGender.hidden = YES;
    btnJGender.hidden = YES;
    frmJRetAge.hidden = YES;
    btnJRetAge.hidden = YES;
    frmJPTA.hidden = YES;
    lblJMI.hidden = YES;
    frmJERMI.hidden = YES;
    btnJERMI.hidden = YES;
    frmJIncMediGapIns.hidden = YES;
    btnJIncMediGapIns.hidden = YES;
    frmJMediGapPremInfRate.hidden = YES;
    frmJExpOOPAmt.hidden = YES;
    frmJExpOOPInfRate.hidden = YES;
    lblJExpOOPAmt.hidden = YES;
    lblJExpOOPInfRate.hidden = YES;
    frmJIncLTC.hidden = YES;
    btnJIncLTC.hidden = YES;
    frmJIncLTCIns.hidden = YES;
    btnJIncLTCIns.hidden = YES;
    frmJExpLTCPremInfRate.hidden = YES;
    frmJExpLTCInfRate.hidden = YES;
    lblJExpLTCInfRate.hidden = YES;
    frmJLTCPolAge.hidden = YES;
    lblJExpLTC1.hidden = YES;
    lblJExpLTC2.hidden = YES;
    btnJIncLev.hidden = YES;
    btnCIncLev.hidden = NO;
    
    lblJPV0.hidden = YES;
    lblJPV1.hidden = YES;
    lblJPV2.hidden = YES;
    frmJHCYrs.hidden = YES;
    frmJNHYrs.hidden = YES;
    lblJPV0.hidden =YES;
    lblJPV1.hidden =YES;
    lblJPV2.hidden = YES;
    btnJPVYN.hidden = YES;
    frmJPVYN.hidden = YES;
    frmJPVInfRte.hidden = YES;
    frmJPVAmt.hidden = YES;
    lblJHC0.hidden = YES;
    lblJHC1.hidden = YES;
    lblJHC2.hidden = YES;
//NSLog(@"fnHideJSide - End of Function");
}
-(void) fnUnHideJSide
{
    lblJPS.hidden = NO;
    frmJName.hidden = NO;
    frmJDOB.hidden = NO;
    frmJAge.hidden = NO;
    lblJAge.hidden = NO;
    //frmJGender.hidden = NO;
    btnJGender.hidden = NO;
    frmJRetAge.hidden = NO;
    btnJRetAge.hidden = NO;
    frmJPTA.hidden = NO;
    lblJMI.hidden = NO;
    //frmJERMI.hidden = NO;
    btnJERMI.hidden = NO;
    //frmJIncMediGapIns.hidden = NO;
    btnJIncMediGapIns.hidden = NO;
    frmJMediGapPremInfRate.hidden = NO;
    frmJExpOOPAmt.hidden = NO;
    frmJExpOOPInfRate.hidden = NO;
    lblJExpOOPAmt.hidden = NO;
    lblJExpOOPInfRate.hidden = NO;
    
    lblJPV0.hidden = NO;
    lblJPV1.hidden = NO;
    lblJPV2.hidden = NO;
    frmJHCYrs.hidden = NO;
    frmJNHYrs.hidden = NO;
    lblJPV0.hidden = NO;
    lblJPV1.hidden = NO;
    lblJPV2.hidden = NO;
    btnJPVYN.hidden = NO;
    frmJPVYN.hidden = YES;
    frmJPVInfRte.hidden = NO;
    frmJPVAmt.hidden = NO;
    lblJHC0.hidden = NO;
    lblJHC1.hidden = NO;
    lblJHC2.hidden = NO;
    
    if ([frmJIncLTC.text intValue] == 1)
    {
        btnJIncLTC.hidden = NO;
        if ([frmJIncLTCIns.text intValue] == 1)
        {
            btnJIncLTCIns.hidden = NO;
            frmJExpLTCPremInfRate.hidden = NO;
            frmJLTCPolAge.hidden = NO;
            lblCExpLTC0.hidden = NO;
            lblJExpLTC1.hidden = NO;
            lblJExpLTC2.hidden = NO;
            frmJExpLTCInfRate.hidden = YES;
            lblJExpLTCInfRate.hidden = YES;
//            lblJHC0.hidden = YES;
//            lblJHC1.hidden = YES;
//            lblJHC2.hidden = YES;
        }
        else
        {
            btnJIncLTCIns.hidden = NO;
            frmJExpLTCPremInfRate.hidden = YES;
            frmJLTCPolAge.hidden = YES;
            lblJExpLTC1.hidden = YES;
            lblJExpLTC2.hidden = YES;
            frmJExpLTCInfRate.hidden = NO;
            lblJExpLTCInfRate.hidden = NO;
//            lblJHC0.hidden = NO;
//            lblJHC1.hidden = NO;
//            lblJHC2.hidden = NO;
        }
    }
    else
    {
        btnJIncLTC.hidden = NO;
    }
    
    btnJIncLev.hidden = NO;
    btnCIncLev.hidden = YES;
}
- (NSString *) fnFormatData : (int) typ : (float) floatIn
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSString *formattedOutput;
    
    if (typ == 1)
    {
        // Set to decimal style
        [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
        formattedOutput = [formatter stringFromNumber:[[NSNumber alloc] initWithFloat:floatIn]];
    }
    if (typ == 2)
    {
        // Format style as currency
        [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
        [formatter setMinimumFractionDigits:0];
        [formatter setDecimalSeparator:@"."];
        [formatter setRoundingMode: NSNumberFormatterRoundUp];
        formattedOutput = [formatter stringFromNumber:[[NSNumber alloc] initWithFloat:floatIn]];
    }
    if (typ == 3)
    {
        // Format style as percentage
        //[formatter setLocale:[NSLocale currentLocale]];
        formattedOutput = [self formatPercentValue: floatIn];
        
        //        [formatter setNumberStyle:NSNumberFormatterPercentStyle];
        //        NSNumber *num = [NSNumber numberWithFloat:floatIn];
        //        formattedOutput = [formatter stringFromNumber:num];
    }
    if (typ == 4)
    {
        // Format style as "spell-out" output to console
        [formatter setNumberStyle:NSNumberFormatterSpellOutStyle];
        formattedOutput = [formatter stringFromNumber:[[NSNumber alloc] initWithFloat:floatIn]];
    }
    // Clean up
    //[locale release];
    //[formatter release];
    return formattedOutput;
}
-(NSString*) formatPercentValue:(double)value
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
    [numberFormatter setPercentSymbol:@"%"];
    [numberFormatter setNumberStyle: NSNumberFormatterPercentStyle];
    [numberFormatter setDecimalSeparator:@"."];
    [numberFormatter setGeneratesDecimalNumbers:TRUE];
    [numberFormatter setMinimumFractionDigits:2];
    //[numberFormatter setRoundingMode: NSNumberFormatterRoundUp];
    [numberFormatter setRoundingIncrement:[[NSNumber alloc]initWithDouble:0.00]];
    NSNumber *c = [NSNumber numberWithFloat:value];
    return [numberFormatter stringFromNumber:c];
}
-(NSString*) formatCurrencyValue:(double)value
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
    [numberFormatter setCurrencySymbol:@"$"];
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    NSNumber *c = [NSNumber numberWithFloat:value];
    return [numberFormatter stringFromNumber:c];
}
-(double) formatDoubleFromCurrency:(NSString*) value
{
    double ret ;
    if(value)
    {
        ret = [value doubleValue];
        if (ret == 0)
        {
            NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
            [numberFormatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
            [numberFormatter setCurrencySymbol:@"$"];
            [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
            NSNumber *c = [numberFormatter numberFromString:value];
            ret = [c doubleValue];
        }
        return ret;
    }
    else
        return 0.0;
}

@end
