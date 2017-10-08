unit Cubc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, GLCadencer, GLScene, GLObjects, GLCoordinates,
  GLCrossPlatform, BaseClasses, GLWin32Viewer, GLColor, GLSimpleNavigation,
  ExtCtrls;

type
  TCube = class(TForm)
    GLSceneViewer1: TGLSceneViewer;
    GLScene1: TGLScene;
    GLDummyCube1: TGLDummyCube;
    GLCamera1: TGLCamera;
    DummyCube1: TGLDummyCube;
    GLSphere1: TGLSphere;
    GLCube1: TGLCube;
    GLLightSource1: TGLLightSource;
    GLCadencer1: TGLCadencer;
    GLSimpleNavigation1: TGLSimpleNavigation;
    GLSphere2: TGLSphere;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Timer1: TTimer;
    Button3: TButton;
    Button4: TButton;
    CheckBox1: TCheckBox;
    Timer2: TTimer;
    Button5: TButton;
    Timer3: TTimer;
    Button6: TButton;
    procedure GLCadencer1Progress(Sender: TObject; const deltaTime,
      newTime: Double);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  tpp = record x,y,z :integer;end;

const VCount = 100;

var
  Cube: TCube;
  CC  : array[-VCount..VCount,-VCount..VCount,-VCount..VCount] of TGLSphere;
  pp  : array[1..50] of tpp;
  kx,ky,kz : integer;
  dy: integer;

implementation



{$R *.dfm}

{function gen(x1,x2:longint):int64;
const p1=1000000;
var l,h:int64;m:real;
begin
     m:=time*p1+random;
     h:=trunc(m);
     m:=m-h;
     l:=trunc(m*p1);
     gen:=l*(x2-x1+1)div (p1)+x1;
end;  }


procedure TCube.GLCadencer1Progress(Sender: TObject; const deltaTime,
  newTime: Double);
begin
   GLCamera1.MoveAllAroundTarget(0,0.02);
end;

procedure TCube.Button1Click(Sender: TObject);
const
  cSpacing = 2;
  cEdgeLength = 0.9;
  cNb = 1;

var
  X: integer;
  Y: integer;
  Z: integer;
  xx,yy,zz:integer;
  sc:single;
 // Cube : TGLCube;
  //k,d: integer;
     procedure go1(color:TColorVector);
     begin
     xx:=random(kx*2)-kx;yy:=random(ky*2)-ky;zz:=random(kz*2)-kz;
     cc[xx,yy,zz].Material.FrontProperties.Emission.Color:=color;
     cc[xx,yy,zz].Scale.x:=1; cc[xx,yy,zz].Scale.y:=1; cc[xx,yy,zz].Scale.z:=1;
     end;
begin
 // GLMaterialLibrary1.AddTextureMaterial('glscene', '..\..\media\glscene.bmp');
  kx:=6;ky:=9;kz:=6;
 // kx:=10;ky:=6;kz:=10;
  for X := -kx to kx do for Y := -ky to ky do for Z := -kz to kz do
       // if (X and {Y and} Z) <> 0 then
  begin

    CC[x,y,z]:=TGLSphere.Create(DummyCube1);
    cc[x,y,z].Assign(GLSphere2);
          CC[x,y,z].Position.SetPoint(X * cSpacing, Y * cSpacing, Z * cSpacing);
    {CC[x,y,z].Position.X:=x;
    CC[x,y,z].Position.Y:=y;
    CC[x,y,z].Position.Z:=z; }
    CC[x,y,z].Material.FrontProperties.Emission.Color:=clrred;//clrgray;
    cc[x,y,z].Parent:=DummyCube1;
    //if y=0 then cc[x,y,z].Material.FrontProperties.Emission.Color:=clrbrown;
    {sc:=random(10)/10;
    cc[x,y,z].Scale.x:=sc;
    cc[x,y,z].Scale.y:=sc;
    cc[x,y,z].Scale.z:=sc;  }
    sc:=0.1;
    cc[x,y,z].Scale.x:=sc;
    cc[x,y,z].Scale.y:=sc;
    cc[x,y,z].Scale.z:=sc;
  end;
  GLSphere2.Visible:=false;
  GLCube1.Visible:=false;
  {  go1(clrred);
    go1(clrgreen);
    go1(clrBrightGold);
    go1(clrblue);
    go1(clrMediumPurple);
    go1(clrBronze2);
    go1(clrDarkBrown);
    go1(clrFirebrick);
    go1(clrIndian);
    go1(clryellow);  }
end;

procedure TCube.Button6Click(Sender: TObject);
var
  xx,yy,zz:integer; i,k:integer;b:boolean;sc:single;
begin
      kx:=6;ky:=9;kz:=6;
     dec(dy);
       if dy<-ky then begin
       timer3.Enabled:=false;
       timer1.Enabled:=true;
       exit;
       end;
     yy:=dy;
     for zz := -kz to kz do for xx := -kx to kx do begin
     cc[xx,yy,zz].Material.FrontProperties.Emission.Color:=clrlime;
    sc:=0.3;
    cc[xx,yy,zz].Scale.x:=sc;
    cc[xx,yy,zz].Scale.y:=sc;
    cc[xx,yy,zz].Scale.z:=sc;

     cc[xx,yy+1,zz].Material.FrontProperties.Emission.Color:=clrlime;
    sc:=0.1;
    cc[xx,yy+1,zz].Scale.x:=sc;
    cc[xx,yy+1,zz].Scale.y:=sc;
    cc[xx,yy+1,zz].Scale.z:=sc;
     end;

end;

procedure TCube.Button5Click(Sender: TObject);
var
  xx,yy,zz:integer; k:integer;b:boolean;sc:single;
begin
    ky:=9;
    b:=false;
    for k:=1 to 50 do begin
    xx:=pp[k].x;
    yy:=pp[k].y;
    zz:=pp[k].z;
     if yy<ky then begin
     b:=true;
     cc[xx,yy+1,zz].Material.FrontProperties.Emission.Color:=cc[xx,yy,zz].Material.FrontProperties.Emission.Color;
     cc[xx,yy,zz].Material.FrontProperties.Emission.Color:=clrred;
    sc:=0.1;
    cc[xx,yy,zz].Scale.x:=sc;
    cc[xx,yy,zz].Scale.y:=sc;
    cc[xx,yy,zz].Scale.z:=sc;
     inc(yy);
    pp[k].x:=xx;
    pp[k].y:=yy;
    pp[k].z:=zz;
    sc:=0.2;
    cc[xx,yy,zz].Scale.x:=sc;
    cc[xx,yy,zz].Scale.y:=sc;
    cc[xx,yy,zz].Scale.z:=sc;
     end;

    end;
    if not b then begin
     for zz := -kz to kz do for xx := -kx to kx do begin
     cc[xx,yy,zz].Material.FrontProperties.Emission.Color:=clrred;
    sc:=0.3;
    cc[xx,yy,zz].Scale.x:=sc;
    cc[xx,yy,zz].Scale.y:=sc;
    cc[xx,yy,zz].Scale.z:=sc;
     end;
     dy:=9;
     timer2.enabled:=false;
     timer3.enabled:=true;
    end;
end;

procedure TCube.Button2Click(Sender: TObject);
var
  X: integer;
  Y: integer;
  Z: integer;
  xx,yy,zz:integer;
  sc:single;
  k:integer;
     procedure go1(color:TColorVector);
     var i:integer;
     begin
  kx:=6;ky:=9;kz:=6;
     for i:=1 to 5 do begin
     xx:=random(kx*2)-kx;yy:=random(ky*2)-ky;zz:=random(kz*2)-kz;
     cc[xx,yy,zz].Material.FrontProperties.Emission.Color:=color;
    sc:=0.2;
    cc[xx,yy,zz].Scale.x:=sc;
    cc[xx,yy,zz].Scale.y:=sc;
    cc[xx,yy,zz].Scale.z:=sc;
    inc(k);
    pp[k].x:=xx;
    pp[k].y:=yy;
    pp[k].z:=zz;
     // cc[xx,yy,zz].Scale.x:=1; cc[xx,yy,zz].Scale.y:=1; cc[xx,yy,zz].Scale.z:=1;
     end;
     end;
begin
  k:=0;
  for X := -kx to kx do for Y := -ky to ky do for Z := -kz to kz  do begin
    //sc:=random(1000)/1000;
    sc:=0.1;
    cc[x,y,z].Scale.x:=sc;
    cc[x,y,z].Scale.y:=sc;
    cc[x,y,z].Scale.z:=sc;
    cc[x,y,z].Material.FrontProperties.Emission.Color:=(clrred);
    cc[x,y,z].Visible:=true;
  end;
    go1(clrred);
    go1(clrgreen);
    go1(clrBrightGold);
    go1(clrblue);
    go1(clrMediumPurple);
    go1(clrBronze2);
    go1(clrDarkBrown);
    go1(clrFirebrick);
    go1(clrIndian);
    go1(clryellow);
    timer1.Enabled:=false;
    timer2.Enabled:=true;
end;

procedure TCube.FormCreate(Sender: TObject);
begin
    Button1.Click;
end;

procedure TCube.FormShow(Sender: TObject);
begin
    Button2.Click;
    GLCadencer1.Enabled:=true;
    //timer1.Enabled:=true;
end;

procedure TCube.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    GLCadencer1.Enabled:=false;
    timer1.Enabled:=false;
end;

procedure TCube.Timer1Timer(Sender: TObject);
var  X,y,z: integer;
begin
    for X := -kx to kx do
    for Y := -ky to ky do
    for Z := -kz to kz do
    //cc[x,y,z].Visible:=false;
//    cc[x,y,z].Scale.x:=1; cc[x,y,z].Scale.y:=1; cc[x,y,z].Scale.z:=1;
    cc[x,y,z].Visible:=false;
    button2.Click;
end;

procedure TCube.Button3Click(Sender: TObject);
begin
    timer1.Enabled:=not timer1.Enabled;
    if timer1.Enabled then Button3.Caption:='Stop' else  Button3.Caption:='Start';
end;

procedure TCube.Button4Click(Sender: TObject);
begin
     close;
end;

procedure TCube.CheckBox1Click(Sender: TObject);
begin
    if CheckBox1.Checked then begin
     Timer1.Interval:=1 ;
     Timer2.Interval:=1 ;
     Timer3.Interval:=1 ;
    end else begin
     Timer1.Interval:=2000;
     Timer2.Interval:=100;
     Timer3.Interval:=100;
    end;
end;

procedure TCube.Timer2Timer(Sender: TObject);
begin
    Button5.Click
end;

procedure TCube.Timer3Timer(Sender: TObject);
begin
     Button6.Click
end;

end.
