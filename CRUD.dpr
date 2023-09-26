program CRUD;

uses
  Vcl.Forms,
  uCadAluno in 'uCadAluno.pas' {frmCRUD},
  udmBanco in 'udmBanco.pas' {DMBanco: TDataModule},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Amethyst Kamri');
  Application.CreateForm(TDMBanco, DMBanco);
  Application.CreateForm(TfrmCRUD, frmCRUD);
  Application.Run;
end.
