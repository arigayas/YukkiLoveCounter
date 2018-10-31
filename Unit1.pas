unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, System.DateUtils,
  Vcl.Buttons, System.ImageList, Vcl.ImgList,PNGImage, Vcl.Menus;

type
  TForm1 = class(TForm)
    Ryota_lbledt: TLabeledEdit;
    Ume_lbledt: TLabeledEdit;
    Ryota_btn: TButton;
    Ume_btn: TButton;
    Memo1: TMemo;
    TimeLabel: TLabel;
    Timer: TTimer;
    Startbtn: TButton;
    Stopbtn: TButton;
    ImageList: TImageList;
    PopupMenu1: TPopupMenu;
    ResetN1: TMenuItem;
    SUMN1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Ryota_btnClick(Sender: TObject);
    procedure Ume_btnClick(Sender: TObject);
    procedure StartbtnClick(Sender: TObject);
    procedure StopbtnClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure SUMN1Click(Sender: TObject);
  private
    { Private 宣言 }
    function TimeCalc(sec:Integer):string;
  public
    { Public 宣言 }
  end;

var
  Form1: TForm1;
  sec:Integer;
  N:Integer;
  playFlag:boolean;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject); // アプリの土台のフォームが作成時の処理
const
  reset: string = '0';        // カウントリセットは0に設定
begin
  Ryota_lbledt.Text := reset; // 良太さんの所に0をセット
  Ume_lbledt.Text := reset;   // うめさんの所に0をセット
  TimeLabel.Caption := '00:00:00';
  Memo1.Clear;
  sec := 0;
  playFlag := true;
  Startbtn.Font.Size := 20;
end;



procedure TForm1.N1Click(Sender: TObject); // 右クリックメニューの「すべてリセット」
const
  reset: string = '0';        // カウントリセットは0に設定
begin
  Ryota_lbledt.Text := reset; // 良太さんの所に0をセット
  Ume_lbledt.Text := reset;   // うめさんの所に0をセット
  TimeLabel.Caption := '00:00:00';
  Memo1.Clear;
  sec := 0;
  playFlag := true;
  Timer.Enabled := False;
  if Startbtn.ImageIndex = 1 then
    Startbtn.ImageIndex := 0;
end;

procedure TForm1.Ryota_btnClick(Sender: TObject); // 良太さんの所のボタンで1増やす
var
  num: Integer;
begin
  num := StrToInt( Ryota_lbledt.Text );
  inc(num);
  Ryota_lbledt.Text := num.ToString;
  Memo1.Lines.Add('良太さん : ' + TimeLabel.Caption);
end;

procedure TForm1.StartbtnClick(Sender: TObject); // スタートボタン
begin
  if playFlag = true then  // ボタンの文字が▶なら||にする。
  begin
    Timer.Enabled := true;
    Startbtn.ImageIndex:= 1;
    playFlag := False;
  end
  else
  begin
    Timer.Enabled := False; // ||なら▶にする。
    playFlag := true;
    Startbtn.ImageIndex:= 0;
  end;
end;

procedure TForm1.StopbtnClick(Sender: TObject);
begin
  Timer.Enabled := False;
  Startbtn.Enabled := True;
  sec := 0;
  TimeLabel.Caption := TimeCalc(sec);
  playFlag := true;
  if Startbtn.ImageIndex = 1 then
    Startbtn.ImageIndex := 0;
end;

procedure TForm1.SUMN1Click(Sender: TObject); // 右クリックメニューの合計回数
var
  SUM:Integer;
begin
  SUM := StrToInt(Ryota_lbledt.Text) + StrToInt(Ume_lbledt.Text);
  ShowMessage('二人が「ゆっきーラブ」と言った合計回数は、' + SUM.ToString + ' 回です。');
end;

procedure TForm1.TimerTimer(Sender: TObject);
begin
  inc(sec);
  TimeLabel.Caption := TimeCalc(sec);
end;

procedure TForm1.Ume_btnClick(Sender: TObject); // うめさんの所のボタンで1増やす
var
  num: Integer;
begin
  num := StrToInt( Ume_lbledt.Text );
  inc(num);
  Ume_lbledt.Text := num.ToString;
  Memo1.Lines.Add('うめさん : ' + TimeLabel.Caption);
end;

function TForm1.TimeCalc(sec:Integer):string;
Var
 Hour : Integer; //時間
 Minute: Integer; //分
begin
  Hour := sec div 3600;            // sec <- 3700 h:1
  Minute := (sec - Hour * 3600 ) div 60;     // sec - 1 * 3600
  sec  := sec - (Hour * 3600) - (Minute * 60);

  Result := Format('%.2d',[Hour]) + ':'+ Format('%.2d',[Minute]) +':'+ Format('%.2d',[sec]) ;
end;

end.
