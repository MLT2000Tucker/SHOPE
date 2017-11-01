//
//  SHOPEViewController.h
//  SHOPE
//
//  Created by Michael Tucker on 4/10/13.
//  Copyright (c) 2013 Insware Design Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHOPEViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>
{
    BOOL validData;
    IBOutlet UIButton *btnGoToCalc;
    
    IBOutlet UITextField *frmPS;
    IBOutlet UIButton *btnPS;
    BOOL btnPSToggled;
    IBOutlet UILabel *lblJPS;
    
    IBOutlet UITextField *frmCName;
    IBOutlet UITextField *frmJName;
    IBOutlet UILabel *lblName;
    
    IBOutlet UITextField *frmSt;
    IBOutlet UIButton *btnSt;
    UIPickerView *statePicker;
    NSMutableArray *statesArray;
    IBOutlet UILabel *lblSt;
    
    NSMutableArray *lifeExpAgesArray;
    
    IBOutlet UILabel *lblDOB;
    IBOutlet UITextField *frmCDOB;
    IBOutlet UITextField *frmCAge;
    
    IBOutlet UITextField *frmJDOB;
    IBOutlet UITextField *frmJAge;
    IBOutlet UILabel *lblJAge;
    
    IBOutlet UITextField *frmCGender;
    IBOutlet UIButton *btnCGender;
    BOOL btnCGenderToggled;
    
    IBOutlet UITextField *frmJGender;
    IBOutlet UIButton *btnJGender;
    BOOL btnJGenderToggled;
    
    IBOutlet UITextField *frmCRetAge;
    IBOutlet UIButton *btnCRetAge;
    BOOL btnCRetAgeToggled;
    
    IBOutlet UITextField *frmJRetAge;
    IBOutlet UIButton *btnJRetAge;
    BOOL btnJRetAgeToggled;
    
    IBOutlet UILabel *lblJMI;
    
    IBOutlet UITextField *frmCIncLev;
    IBOutlet UIButton *btnCIncLev;
    UIPickerView *cIncLevPicker;
    NSArray *cIincLevArray;
    
    IBOutlet UIButton *btnJIncLev;
    UIPickerView *jIncLevPicker;
    NSArray *jIncLevArray;
    
    NSArray *pickersArray;
    UIPickerView *activePickerView;
    
    NSMutableArray *cIncArray;
    NSMutableArray *jIncArray;
    
    IBOutlet UITextField *frmCPTA;
    IBOutlet UITextField *frmJPTA;
    
    IBOutlet UITextField *frmCERMI;
    IBOutlet UIButton *btnCERMI;
    BOOL btnCERMIToggled;
    
    IBOutlet UITextField *frmJERMI;
    IBOutlet UIButton *btnJERMI;
    BOOL btnJERMIToggled;
    
    IBOutlet UITextField *frmCMedInfRate;
    
    IBOutlet UITextField *frmCIncMediGapIns;
    IBOutlet UIButton *btnCIncMediGapIns;
    BOOL btnCIncMediGapInsToggled;
    
    IBOutlet UITextField *frmJIncMediGapIns;
    IBOutlet UIButton *btnJIncMediGapIns;
    BOOL btnJIncMediGapInsToggled;
    
    IBOutlet UITextField *frmCMediGapPremInfRate;
    IBOutlet UITextField *frmJMediGapPremInfRate;
    
    IBOutlet UITextField *frmCExpOOPAmt;
    IBOutlet UITextField *frmCExpOOPInfRate;
    
    IBOutlet UITextField *frmJExpOOPAmt;
    IBOutlet UITextField *frmJExpOOPInfRate;
    IBOutlet UILabel *lblJExpOOPAmt;
    IBOutlet UILabel *lblJExpOOPInfRate;
    
    IBOutlet UITextField *frmCIncLTC;
    IBOutlet UIButton *btnCIncLTC;
    BOOL btnCIncLTCToggled;
    
    IBOutlet UITextField *frmJIncLTC;
    IBOutlet UIButton *btnJIncLTC;
    BOOL btnJIncLTCToggled;
    
    IBOutlet UITextField *frmCIncLTCIns;
    IBOutlet UIButton *btnCIncLTCIns;
    BOOL btnCIncLTCInsToggled;
    
    IBOutlet UITextField *frmJIncLTCIns;
    IBOutlet UIButton *btnJIncLTCIns;
    BOOL btnJIncLTCInsToggled;
    
    IBOutlet UITextField *frmCExpLTCPremInfRate;
    IBOutlet UITextField *frmCExpLTCInfRate;
    IBOutlet UILabel *lblCExpLTCInfRate;
    
    IBOutlet UITextField *frmJExpLTCPremInfRate;
    IBOutlet UITextField *frmJExpLTCInfRate;
    IBOutlet UILabel *lblJExpLTCInfRate;
    
    IBOutlet UITextField *frmCLTCPolAge;
    IBOutlet UITextField *frmJLTCPolAge;
    
    IBOutlet UILabel *lblCExpLTC0;
    IBOutlet UILabel *lblCExpLTC1;
    IBOutlet UILabel *lblCExpLTC2;
    IBOutlet UILabel *lblJExpLTC1;
    IBOutlet UILabel *lblJExpLTC2;
    
    IBOutlet UIScrollView *medInfoView;
    
    IBOutlet UILabel *lblCHC0;
    IBOutlet UILabel *lblCHC1;
    IBOutlet UILabel *lblCHC2;
    IBOutlet UITextField *frmCHCYrs;
    IBOutlet UITextField *frmCNHYrs;
    
    IBOutlet UILabel *lblCPV0;
    IBOutlet UILabel *lblCPV1;
    IBOutlet UILabel *lblCPV2;
    IBOutlet UIButton *btnCPVYN;
    BOOL btnCPVYNToggled;
    IBOutlet UITextField *frmCPVInfRte;
    IBOutlet UITextField *frmCPVAmt;
    
    IBOutlet UILabel *lblJHC0;
    IBOutlet UILabel *lblJHC1;
    IBOutlet UILabel *lblJHC2;
    IBOutlet UITextField *frmJHCYrs;
    IBOutlet UITextField *frmJNHYrs;
    
    IBOutlet UILabel *lblJPV0;
    IBOutlet UILabel *lblJPV1;
    IBOutlet UILabel *lblJPV2;
    IBOutlet UIButton *btnJPVYN;
    BOOL btnJPVYNToggled;
    IBOutlet UITextField *frmJPVInfRte;
    IBOutlet UITextField *frmJPVAmt;

}

@property (nonatomic, retain) IBOutlet UIButton *btnGoToCalc;

@property (nonatomic, retain) IBOutlet UITextField *frmPS;
@property (nonatomic, retain) IBOutlet UIButton *btnPS;
@property (nonatomic, retain) IBOutlet UILabel *lblJPS;

@property (nonatomic, retain) IBOutlet UITextField *frmCName;
@property (nonatomic, retain) IBOutlet UITextField *frmJName;
@property (nonatomic, retain) IBOutlet UILabel *lblName;

@property (nonatomic, retain) IBOutlet UITextField *frmSt;
@property (nonatomic, retain) IBOutlet UIButton *btnSt;
@property (nonatomic, retain) IBOutlet UILabel *lblSt;

@property (nonatomic, retain) IBOutlet UILabel *lblDOB;
@property (nonatomic, retain) IBOutlet UITextField *frmCDOB;
@property (nonatomic, retain) IBOutlet UITextField *frmCAge;
@property (nonatomic, retain) IBOutlet UITextField *frmJDOB;
@property (nonatomic, retain) IBOutlet UITextField *frmJAge;
@property (nonatomic, retain) IBOutlet UILabel *lblJAge;

@property (nonatomic, retain) IBOutlet UITextField *frmCGender;
@property (nonatomic, retain) IBOutlet UIButton *btnCGender;
@property (nonatomic, retain) IBOutlet UITextField *frmJGender;
@property (nonatomic, retain) IBOutlet UIButton *btnJGender;

@property (nonatomic, retain) IBOutlet UITextField *frmCRetAge;
@property (nonatomic, retain) IBOutlet UIButton *btnCRetAge;
@property (nonatomic, retain) IBOutlet UITextField *frmJRetAge;
@property (nonatomic, retain) IBOutlet UIButton *btnJRetAge;

@property (nonatomic, retain) IBOutlet UITextField *frmCIncLev;
@property (nonatomic, retain) IBOutlet UIButton *btnCIncLev;

@property (nonatomic, retain) IBOutlet UIButton *btnJIncLev;

@property (nonatomic, retain) UIPickerView *activePickerView;
@property (nonatomic, retain) UIPickerView *statePicker;
@property (nonatomic, retain) UIPickerView *cIncLevPickerView;

@property (nonatomic, retain) UIPickerView *jIncLevPickerView;

@property (nonatomic, retain) NSMutableArray *cIncArray;
@property (nonatomic, retain) NSMutableArray *jIncArray;
@property (nonatomic, retain) NSMutableArray *statesArray;
@property (nonatomic, retain) NSMutableArray *lifeExpAgesArray;
@property (nonatomic, retain) NSArray *cIncLevArray;
@property (nonatomic, retain) NSArray *jIncLevArray;
@property (nonatomic, retain) NSArray *pickersArray;

@property (nonatomic, retain) IBOutlet UITextField *frmCPTA;
@property (nonatomic, retain) IBOutlet UITextField *frmJPTA;

@property (nonatomic, retain) IBOutlet UILabel *lblJMI;

@property (nonatomic, retain) IBOutlet UITextField *frmCERMI;
@property (nonatomic, retain) IBOutlet UIButton *btnCERMI;
@property (nonatomic, retain) IBOutlet UITextField *frmJERMI;
@property (nonatomic, retain) IBOutlet UIButton *btnJERMI;

@property (nonatomic, retain) IBOutlet UITextField *frmCMedInfRate;

@property (nonatomic, retain) IBOutlet UITextField *frmCIncMediGapIns;
@property (nonatomic, retain) IBOutlet UIButton *btnCIncMediGapIns;
@property (nonatomic, retain) IBOutlet UITextField *frmJIncMediGapIns;
@property (nonatomic, retain) IBOutlet UIButton *btnJIncMediGapIns;

@property (nonatomic, retain) IBOutlet UITextField *frmCMediGapPremInfRate;
@property (nonatomic, retain) IBOutlet UITextField *frmJMediGapPremInfRate;

@property (nonatomic, retain) IBOutlet UITextField *frmCExpOOPAmt;
@property (nonatomic, retain) IBOutlet UITextField *frmCExpOOPInfRate;
@property (nonatomic, retain) IBOutlet UITextField *frmJExpOOPAmt;
@property (nonatomic, retain) IBOutlet UITextField *frmJExpOOPInfRate;
@property (nonatomic, retain) IBOutlet UILabel *lblJExpOOPAmt;
@property (nonatomic, retain) IBOutlet UILabel *lblJExpOOPInfRate;

@property (nonatomic, retain) IBOutlet UITextField *frmCIncLTC;
@property (nonatomic, retain) IBOutlet UIButton *btnCIncLTC;
@property (nonatomic, retain) IBOutlet UITextField *frmJIncLTC;
@property (nonatomic, retain) IBOutlet UIButton *btnJIncLTC;

@property (nonatomic, retain) IBOutlet UITextField *frmCIncLTCIns;
@property (nonatomic, retain) IBOutlet UIButton *btnCIncLTCIns;
@property (nonatomic, retain) IBOutlet UITextField *frmJIncLTCIns;
@property (nonatomic, retain) IBOutlet UIButton *btnJIncLTCIns;

@property (nonatomic, retain) IBOutlet UITextField *frmCExpLTCPremInfRate;
@property (nonatomic, retain) IBOutlet UITextField *frmCExpLTCInfRate;
@property (nonatomic, retain) IBOutlet UITextField *frmJExpLTCPremInfRate;
@property (nonatomic, retain) IBOutlet UITextField *frmJExpLTCInfRate;
@property (nonatomic, retain) IBOutlet UILabel *lblCExpLTCInfRate;
@property (nonatomic, retain) IBOutlet UILabel *lblJExpLTCInfRate;

@property (nonatomic, retain) IBOutlet UITextField *frmCLTCPolAge;
@property (nonatomic, retain) IBOutlet UITextField *frmJLTCPolAge;

@property (nonatomic, retain) IBOutlet UILabel *lblCExpLTC0;
@property (nonatomic, retain) IBOutlet UILabel *lblCExpLTC1;
@property (nonatomic, retain) IBOutlet UILabel *lblCExpLTC2;
@property (nonatomic, retain) IBOutlet UILabel *lblJExpLTC1;
@property (nonatomic, retain) IBOutlet UILabel *lblJExpLTC2;

@property (nonatomic, retain) IBOutlet UILabel *lblCHC0;
@property (nonatomic, retain) IBOutlet UILabel *lblCHC1;
@property (nonatomic, retain) IBOutlet UILabel *lblCHC2;
@property (nonatomic, retain) IBOutlet UITextField *frmCHCYrs;
@property (nonatomic, retain) IBOutlet UITextField *frmCNHYrs;

@property (nonatomic, retain) IBOutlet UILabel *lblCPV0;
@property (nonatomic, retain) IBOutlet UILabel *lblCPV1;
@property (nonatomic, retain) IBOutlet UILabel *lblCPV2;
@property (nonatomic, retain) IBOutlet UIButton *btnCPVYN;
@property (nonatomic, retain) IBOutlet UITextField *frmCPVYN;
@property (nonatomic, retain) IBOutlet UITextField *frmCPVInfRte;
@property (nonatomic, retain) IBOutlet UITextField *frmCPVAmt;

@property (nonatomic, retain) IBOutlet UILabel *lblJHC0;
@property (nonatomic, retain) IBOutlet UILabel *lblJHC1;
@property (nonatomic, retain) IBOutlet UILabel *lblJHC2;
@property (nonatomic, retain) IBOutlet UITextField *frmJHCYrs;
@property (nonatomic, retain) IBOutlet UITextField *frmJNHYrs;

@property (nonatomic, retain) IBOutlet UILabel *lblJPV0;
@property (nonatomic, retain) IBOutlet UILabel *lblJPV1;
@property (nonatomic, retain) IBOutlet UILabel *lblJPV2;
@property (nonatomic, retain) IBOutlet UIButton *btnJPVYN;
@property (nonatomic, retain) IBOutlet UITextField *frmJPVYN;
@property (nonatomic, retain) IBOutlet UITextField *frmJPVInfRte;
@property (nonatomic, retain) IBOutlet UITextField *frmJPVAmt;

- (IBAction) togglePSBtn;
- (IBAction) showStatePicker;
- (IBAction) valCDOB;
- (IBAction) valJDOB;
- (IBAction) toggleCGenderBtn;
- (IBAction) toggleCRetAgeBtn;
- (IBAction) showCIncLevPicker;
- (IBAction) showJIncLevPicker;
- (IBAction) toggleCERMIBtn;
- (IBAction) fnCMedInfRateChanged;
- (IBAction) toggleCIncMediGapInsBtn;
- (IBAction) fnCExpOOPAmtChanged;
- (IBAction) fnCExpOOPInfRateChanged;
- (IBAction) toggleCIncLTCBtn;
- (IBAction) toggleCIncLTCInsBtn;
- (IBAction) fnCExpLTCPremInfRateChanged;
- (IBAction) fnCExpLTCInfRateChanged;
- (IBAction) fnCLTCPolAgeChanged;
- (IBAction) fnCMediGapPremInfRateChanged;

- (IBAction) toggleJGenderBtn;
- (IBAction) toggleJRetAgeBtn;
- (IBAction) toggleJERMIBtn;
- (IBAction) toggleJIncMediGapInsBtn;
- (IBAction) fnJExpOOPAmtChanged;
- (IBAction) fnJExpOOPInfRateChanged;
- (IBAction) toggleJIncLTCBtn;
- (IBAction) toggleJIncLTCInsBtn;
- (IBAction) fnJExpLTCPremInfRateChanged;
- (IBAction) fnJExpLTCInfRateChanged;
- (IBAction) fnJLTCPolAgeChanged;
- (IBAction) fnJMediGapPremInfRateChanged;

- (IBAction) fnCPVInfRteChanged;
- (IBAction) fnCPVAmtChanged;
- (IBAction) fnJPVInfRteChanged;
- (IBAction) fnJPVAmtChanged;

- (IBAction) fnHideWorkFields;
- (IBAction) fnUnHideJSide;
- (IBAction) fnHideJSide;
- (IBAction) fnInitJVariables;

- (NSString*) fnCalcPTA: (NSString*) age : (NSString*) gender;
- (NSString*) fnFormatData : (int) typ : (float) floatIn;

- (IBAction) toggleCPVYNBtn;
- (IBAction) toggleJPVYNBtn;

- (IBAction) fnValidate;
- (IBAction) GoToCalcBtn;

@end
