unit udmBanco;

interface

uses
  System.SysUtils, System.Classes, Data.DBXFirebird, Data.FMTBcd, FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, Data.SqlExpr, FIBQuery, pFIBQuery, Vcl.Dialogs;

type
  TDMBanco = class(TDataModule)
    ConnBanco: TpFIBDatabase;
    sdsAluno: TpFIBDataSet;
    defRTrans: TpFIBTransaction;
    defWTrans: TpFIBTransaction;
    cdsLeAluno: TClientDataSet;
    cdsLeAlunoMATRICULA: TStringField;
    cdsLeAlunoNOME: TStringField;
    cdsLeAlunoCURSO: TStringField;
    dspAluno: TDataSetProvider;
    dsAluno: TDataSource;
    cdsGravaAluno: TClientDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    cdsDeletaAluno: TClientDataSet;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    cdsLeAlunoDATA: TDateField;
    cdsLeAlunoHORA: TTimeField;
    cdsGravaAlunoDATA: TDateField;
    cdsGravaAlunoHORA: TTimeField;
    cdsDeletaAlunoDATA: TDateField;
    cdsDeletaAlunoHORA: TTimeField;
    cdsFindAluno: TClientDataSet;
    cdsFindAlunoMATRICULA: TStringField;
    cdsFindAlunoNOME: TStringField;
    cdsFindAlunoCURSO: TStringField;
    cdsFindAlunoDATA: TDateField;
    cdsFindAlunoHORA: TTimeField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMBanco: TDMBanco;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uCadAluno;

{$R *.dfm}

procedure TDMBanco.DataModuleCreate(Sender: TObject);
begin
  try
    with ConnBanco do
    begin
      if not Connected then Connected := True;
      if Connected then
         MessageDlg('Conexão efetuada com o banco:' + sLineBreak +
                    DBName, mtInformation, [mbOK], 0);
    end;
    with cdsLeAluno do
    begin
      if not Active then CreateDataSet;
    end;
  except
    on E:Exception do
    begin
      MessageDlg('ERRO(#01): ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

end.
