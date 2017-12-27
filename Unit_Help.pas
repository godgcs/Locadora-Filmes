unit Unit_Help;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, Unit_Biblioteca;

type
  TFrm_Help = class(TForm)
    CategoryPanelGroup1: TCategoryPanelGroup;
    CategoryPanel1: TCategoryPanel;
    Button3: TButton;
    Button2: TButton;
    Button1: TButton;
    CategoryPanel2: TCategoryPanel;
    CategoryPanel3: TCategoryPanel;
    Button6: TButton;
    Button5: TButton;
    Button4: TButton;
    Button7: TButton;
    Button8: TButton;
    CategoryPanel4: TCategoryPanel;
    Button9: TButton;
    CategoryPanel5: TCategoryPanel;
    Button15: TButton;
    Button14: TButton;
    Button13: TButton;
    Button12: TButton;
    Button11: TButton;
    Button10: TButton;
    Button16: TButton;
    CategoryPanel6: TCategoryPanel;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel4: TPanel;
    Panel5: TPanel;
    Label4: TLabel;
    Label8: TLabel;
    Panel6: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel3: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    TabSheet3: TTabSheet;
    Panel7: TPanel;
    Panel8: TPanel;
    Label7: TLabel;
    Label13: TLabel;
    Panel9: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    TabSheet4: TTabSheet;
    Panel10: TPanel;
    Panel11: TPanel;
    Label17: TLabel;
    Panel12: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    TabSheet5: TTabSheet;
    Panel13: TPanel;
    Panel14: TPanel;
    Label23: TLabel;
    Label24: TLabel;
    Panel15: TPanel;
    Label25: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    TabSheet6: TTabSheet;
    Panel16: TPanel;
    Panel17: TPanel;
    Label29: TLabel;
    Label30: TLabel;
    Panel18: TPanel;
    Label31: TLabel;
    Label32: TLabel;
    Label34: TLabel;
    TabSheet7: TTabSheet;
    Panel19: TPanel;
    Panel20: TPanel;
    Label35: TLabel;
    Label36: TLabel;
    TabSheet8: TTabSheet;
    Panel22: TPanel;
    Panel23: TPanel;
    Label41: TLabel;
    Label42: TLabel;
    Panel24: TPanel;
    Label43: TLabel;
    Label44: TLabel;
    TabSheet9: TTabSheet;
    Panel25: TPanel;
    Panel26: TPanel;
    Label47: TLabel;
    Label48: TLabel;
    Panel27: TPanel;
    Label49: TLabel;
    Label50: TLabel;
    TabSheet10: TTabSheet;
    Panel28: TPanel;
    Panel29: TPanel;
    Label53: TLabel;
    Label54: TLabel;
    Panel30: TPanel;
    Label55: TLabel;
    Label56: TLabel;
    TabSheet11: TTabSheet;
    Panel31: TPanel;
    Panel32: TPanel;
    Label59: TLabel;
    Label60: TLabel;
    TabSheet12: TTabSheet;
    Panel34: TPanel;
    Panel35: TPanel;
    Label65: TLabel;
    Label66: TLabel;
    TabSheet13: TTabSheet;
    Panel37: TPanel;
    Panel38: TPanel;
    Label71: TLabel;
    Label72: TLabel;
    TabSheet14: TTabSheet;
    Panel40: TPanel;
    Panel41: TPanel;
    Label77: TLabel;
    Label78: TLabel;
    TabSheet15: TTabSheet;
    Panel43: TPanel;
    Panel44: TPanel;
    Label83: TLabel;
    Label84: TLabel;
    TabSheet16: TTabSheet;
    Panel46: TPanel;
    Panel47: TPanel;
    Label89: TLabel;
    Label90: TLabel;
    TabSheet17: TTabSheet;
    Panel49: TPanel;
    Panel50: TPanel;
    Label95: TLabel;
    Label96: TLabel;
    TabSheet18: TTabSheet;
    TabSheet19: TTabSheet;
    TabSheet20: TTabSheet;
    TabSheet21: TTabSheet;
    TabSheet22: TTabSheet;
    Label18: TLabel;
    Label21: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    Label27: TLabel;
    Label33: TLabel;
    Label104: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    Label114: TLabel;
    Panel21: TPanel;
    Label37: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    Label38: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label119: TLabel;
    Label121: TLabel;
    Label120: TLabel;
    Label122: TLabel;
    Label123: TLabel;
    Label124: TLabel;
    Label125: TLabel;
    Label126: TLabel;
    Label127: TLabel;
    Label128: TLabel;
    Panel33: TPanel;
    Label58: TLabel;
    Panel36: TPanel;
    Label57: TLabel;
    Panel39: TPanel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Panel42: TPanel;
    Label64: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Panel45: TPanel;
    Label69: TLabel;
    Label70: TLabel;
    Label73: TLabel;
    Panel48: TPanel;
    Label74: TLabel;
    Panel51: TPanel;
    Label75: TLabel;
    Label76: TLabel;
    Panel52: TPanel;
    Panel53: TPanel;
    Label79: TLabel;
    Label80: TLabel;
    Panel55: TPanel;
    Panel58: TPanel;
    Panel61: TPanel;
    Panel64: TPanel;
    Panel66: TPanel;
    Label131: TLabel;
    Panel56: TPanel;
    Label85: TLabel;
    Label86: TLabel;
    Panel59: TPanel;
    Label91: TLabel;
    Label92: TLabel;
    Panel62: TPanel;
    Label97: TLabel;
    Label98: TLabel;
    Panel65: TPanel;
    Label129: TLabel;
    Label130: TLabel;
    Panel54: TPanel;
    Label81: TLabel;
    Label133: TLabel;
    Label134: TLabel;
    Label135: TLabel;
    Label136: TLabel;
    Label137: TLabel;
    Label138: TLabel;
    Label139: TLabel;
    Label140: TLabel;
    Panel57: TPanel;
    Label82: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label141: TLabel;
    Label142: TLabel;
    Label143: TLabel;
    Label145: TLabel;
    Label146: TLabel;
    Panel60: TPanel;
    Label93: TLabel;
    Label94: TLabel;
    Label147: TLabel;
    Label148: TLabel;
    Label149: TLabel;
    Label150: TLabel;
    Label151: TLabel;
    Label152: TLabel;
    Label153: TLabel;
    Label144: TLabel;
    Panel63: TPanel;
    Label99: TLabel;
    Label100: TLabel;
    Label132: TLabel;
    Label154: TLabel;
    Label155: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    Procedure ControlaTabs;
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Help: TFrm_Help;
  op:integer;

implementation

{$R *.dfm}

procedure TFrm_Help.Button10Click(Sender: TObject);
begin
    if op<>10
      Then op:=10
      Else op:=0;
    ControlaTabs;
end;

procedure TFrm_Help.Button11Click(Sender: TObject);
begin
    if op<>11
      Then op:=11
      Else op:=0;
    ControlaTabs;
end;

procedure TFrm_Help.Button12Click(Sender: TObject);
begin
    if op<>12
      Then op:=12
      Else op:=0;
    ControlaTabs;
end;

procedure TFrm_Help.Button13Click(Sender: TObject);
begin
    if op<>13
      Then op:=13
      Else op:=0;
    ControlaTabs;
end;

procedure TFrm_Help.Button14Click(Sender: TObject);
begin
    if op<>14
      Then op:=14
      Else op:=0;
    ControlaTabs;
end;

procedure TFrm_Help.Button15Click(Sender: TObject);
begin
    if op<>15
      Then op:=15
      Else op:=0;
    ControlaTabs;
end;

procedure TFrm_Help.Button16Click(Sender: TObject);
begin
    if op<>16
      Then op:=16
      Else op:=0;
    ControlaTabs;
end;

procedure TFrm_Help.Button17Click(Sender: TObject);
begin
    if op<>17
      Then op:=17
      Else op:=0;
    ControlaTabs;
end;

procedure TFrm_Help.Button18Click(Sender: TObject);
begin
    if op<>18
      Then op:=18
      Else op:=0;
    ControlaTabs;
end;

procedure TFrm_Help.Button22Click(Sender: TObject);
begin
    if op<>22
      Then op:=22
      Else op:=0;
    ControlaTabs;
end;

procedure TFrm_Help.Button1Click(Sender: TObject);
begin
    if op<>1
      Then op:=1
      Else op:=0;
    ControlaTabs;
end;

procedure TFrm_Help.Button21Click(Sender: TObject);
begin
    if op<>21
      Then op:=21
      Else op:=0;
    ControlaTabs;
end;

procedure TFrm_Help.Button20Click(Sender: TObject);
begin
    if op<>20
      Then op:=20
      Else op:=0;
    ControlaTabs;
end;

procedure TFrm_Help.Button19Click(Sender: TObject);
begin
    if op<>19
      Then op:=19
      Else op:=0;
    ControlaTabs;
end;

procedure TFrm_Help.Button2Click(Sender: TObject);
begin
    if op<>2
      Then op:=2
      Else op:=0;
    ControlaTabs;
end;

procedure TFrm_Help.Button3Click(Sender: TObject);
begin
    if op<>3
      Then op:=3
      Else op:=0;
    ControlaTabs;
end;

procedure TFrm_Help.Button4Click(Sender: TObject);
begin
    if op<>4
      Then op:=4
      Else op:=0;
    ControlaTabs;
end;

procedure TFrm_Help.Button5Click(Sender: TObject);
begin
    if op<>5
      Then op:=5
      Else op:=0;
    ControlaTabs;
end;

procedure TFrm_Help.Button6Click(Sender: TObject);
begin
    if op<>6
      Then op:=6
      Else op:=0;
    ControlaTabs;
end;

procedure TFrm_Help.Button7Click(Sender: TObject);
begin
    if op<>7
      Then op:=7
      Else op:=0;
    ControlaTabs;
end;

procedure TFrm_Help.Button8Click(Sender: TObject);
begin
    if op<>8
      Then op:=8
      Else op:=0;
    ControlaTabs;
end;

procedure TFrm_Help.Button9Click(Sender: TObject);
begin
    if op<>9
      Then op:=9
      Else op:=0;
    ControlaTabs;
end;

procedure TFrm_Help.FormCreate(Sender: TObject);
begin
    op:=0;
    ControlaTabs;
    if Vendedor_Ativo='GERENTE'
      Then CategoryPanel6.Visible:=true;
end;

Procedure TFrm_Help.ControlaTabs;
  Begin
      TabSheet1.TabVisible:=false;
      TabSheet2.TabVisible:=false;
      TabSheet3.TabVisible:=false;
      TabSheet4.TabVisible:=false;
      TabSheet5.TabVisible:=false;
      TabSheet6.TabVisible:=false;
      TabSheet7.TabVisible:=false;
      TabSheet8.TabVisible:=false;
      TabSheet9.TabVisible:=false;
      TabSheet10.TabVisible:=false;
      TabSheet11.TabVisible:=false;
      TabSheet12.TabVisible:=false;
      TabSheet13.TabVisible:=false;
      TabSheet14.TabVisible:=false;
      TabSheet15.TabVisible:=false;
      TabSheet16.TabVisible:=false;
      TabSheet17.TabVisible:=false;
      TabSheet18.TabVisible:=false;
      TabSheet19.TabVisible:=false;
      TabSheet20.TabVisible:=false;
      TabSheet21.TabVisible:=false;
      TabSheet22.TabVisible:=false;

      case op of
      1:TabSheet1.TabVisible:=true;
      2:TabSheet2.TabVisible:=true;
      3:TabSheet3.TabVisible:=true;
      4:TabSheet4.TabVisible:=true;
      5:TabSheet5.TabVisible:=true;
      6:TabSheet6.TabVisible:=true;
      7:TabSheet7.TabVisible:=true;
      8:TabSheet8.TabVisible:=true;
      9:TabSheet9.TabVisible:=true;
      10:TabSheet10.TabVisible:=true;
      11:TabSheet11.TabVisible:=true;
      12:TabSheet12.TabVisible:=true;
      13:TabSheet13.TabVisible:=true;
      14:TabSheet14.TabVisible:=true;
      15:TabSheet15.TabVisible:=true;
      16:TabSheet16.TabVisible:=true;
      17:TabSheet17.TabVisible:=true;
      18:TabSheet18.TabVisible:=true;
      19:TabSheet19.TabVisible:=true;
      20:TabSheet20.TabVisible:=true;
      21:TabSheet21.TabVisible:=true;
      22:TabSheet22.TabVisible:=true;

      end;
  End;


end.
