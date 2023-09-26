unit uCadAluno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DBXFirebird,
  Data.FMTBcd, Data.DB, Datasnap.Provider, Datasnap.DBClient, Data.SqlExpr,
  Vcl.Grids, Vcl.DBGrids, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  Vcl.Mask, Vcl.ExtCtrls, RzPanel;

type
  TfrmCRUD = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtNome: TEdit;
    edtMatricula: TEdit;
    edtCurso: TEdit;
    btPro: TButton;
    btSalvar: TButton;
    btAdd: TButton;
    btEditar: TButton;
    btExcluir: TButton;
    btCancelar: TButton;
    btAnterior: TButton;
    DBGrid1: TDBGrid;
    lblHora: TLabel;
    edtData: TEdit;
    edtHora: TEdit;
    btnPesquisar: TButton;
    btnBusca: TButton;
    lblData: TLabel;
    RzPanel1: TRzPanel;
    procedure btAddClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btProClick(Sender: TObject);
    procedure btAnteriorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
  private
    { Private declarations }
  public
    operacao : Integer;
    procedure limpacampos;
    procedure preenchecampos;
    procedure persistedados;
    procedure habilitacampos(status : boolean);
    procedure excluirregistro;
    procedure PreencherDataHoraAtual;
    procedure RealizarBusca;
    { Public declarations }
  end;

var
  frmCRUD: TfrmCRUD;

implementation

{$R *.dfm}

uses udmBanco;

{ TfrmCRUD }

procedure TfrmCRUD.btAddClick(Sender: TObject);
begin
  operacao := 1; // Adicionar
  habilitacampos(true);
  limpacampos;
  PreencherDataHoraAtual;
  edtMatricula.SetFocus;
end;

procedure TfrmCRUD.btAnteriorClick(Sender: TObject);
begin
  DMBanco.cdsLeAluno.Prior;
  preenchecampos;
end;

procedure TfrmCRUD.btCancelarClick(Sender: TObject);
begin
  habilitacampos(false);
  preenchecampos;
end;

procedure TfrmCRUD.btEditarClick(Sender: TObject);
begin
  //habilitar o campo matricula para fazer um tipo de busca
  //criar um botão busca que irá buscar a matricula e retornar os dados da mesma para editar nome e curso
  //após a busca retornar resultado positivo os campos que podem sofrer alteração apareceção ou ficarao habilitados
  //em caso de busca negativa, uma mensagem aparecerá

  operacao := 2; // Editar
  habilitacampos(true);
  preenchecampos;
  PreencherDataHoraAtual;
  edtNome.SetFocus;
end;

procedure TfrmCRUD.btExcluirClick(Sender: TObject);
begin
  operacao := 3; //Excluir
  if Application.MessageBox('Deseja excluir o Registro?','Atenção',mb_yesno) = IDYES then
  begin
    excluirregistro;
    preenchecampos;
    habilitacampos(false);
  end;
end;

procedure TfrmCRUD.btnBuscaClick(Sender: TObject);
begin
  if (edtMatricula.Text = '')and
     (edtNome.Text      = '')and
     (edtCurso.Text     = '') then
  begin
    MessageDlg('Por favor, digite uma informação válida!', mtWarning, [mbOK], 0);
  end else
  begin
    RealizarBusca;
    preenchecampos;
  end;
end;

procedure TfrmCRUD.btnPesquisarClick(Sender: TObject);
begin
  limpacampos;
  operacao := 4; //Pesquisar
  habilitacampos(true);
end;

procedure TfrmCRUD.btProClick(Sender: TObject);
begin
  DMBanco.cdsLeAluno.Next;
  preenchecampos;
end;

procedure TfrmCRUD.FormCreate(Sender: TObject);
begin
  preenchecampos;
  habilitacampos(false);
end;

procedure TfrmCRUD.habilitacampos(status: boolean);
begin
  case operacao of
    1: // Adicionar
    begin
      btExcluir.Visible := False;

      edtNome.Enabled := status;
      edtCurso.Enabled := status;

      edtData.Enabled := not status;
      edtHora.Enabled := not status;

      btSalvar.Visible := status;
      btCancelar.Visible := status;
      btnBusca.Visible := status;

      btnBusca.Visible := not status;
      btnPesquisar.Visible := not status;
      btAnterior.Visible := not status;
      btPro.Visible := not status;
      btAdd.Visible := not status;
      btEditar.Visible := not status;

    end;
    2: // Editar
    begin
      edtNome.Enabled := status;
      edtCurso.Enabled := status;
      edtData.Enabled := status;
      edtHora.Enabled := status;

      btExcluir.Visible := status;
      btSalvar.Visible := status;
      btCancelar.Visible := status;

      edtMatricula.Enabled := not status;
      btnPesquisar.Visible := not status;
      btAnterior.Visible := not status;
      btPro.Visible := not status;
      btAdd.Visible := not status;
      btEditar.Visible := not status;
      btnBusca.Visible := not status;
    end;
    4: //Pesquisar
    begin
      btExcluir.Visible := false;

      btSalvar.Visible := status;
      btCancelar.Visible := status;
      btnBusca.Visible := status;

      edtNome.Enabled := status;
      edtCurso.Enabled :=  status;

      btnPesquisar.Visible := not status;
      btAnterior.Visible := not status;
      btPro.Visible := not status;
      btAdd.Visible := not status;
      btEditar.Visible := not status;
      lblHora.Visible := not status;
      lblData.Visible := not status;
      edtData.Visible := not status;
      edtHora.Visible := not status;
    end;
  else
    begin
      edtNome.Enabled := status;
      edtCurso.Enabled := status;
      edtData.Enabled := status;
      edtHora.Enabled := status;

      btExcluir.Visible := status;
      btSalvar.Visible := status;
      btCancelar.Visible := status;
      btnBusca.Visible := status;

      btnPesquisar.Visible := not status;
      btAnterior.Visible := not status;
      btPro.Visible := not status;
      btAdd.Visible := not status;
      btEditar.Visible := not status;
    end;
  end;

end;

procedure TfrmCRUD.limpacampos;
begin
  edtMatricula.Clear;
  edtNome.Clear;
  edtCurso.Clear;
  edtData.Clear;
  edtHora.Clear;
end;

procedure TfrmCRUD.preenchecampos;
begin
  try
    try
      with dmBanco.cdsLeAluno do
      begin
        if operacao <> 2 then // diferente de Editar
        begin
          dmBanco.defRTrans.StartTransaction;

          Active := False; //Força refresh do clientdataset
          Active := True;
          if RecordCount > 0 then First;
        end;
        if RecordCount > 0 then
        begin
          edtMatricula.Text := DMBanco.cdsLeAlunoMATRICULA.AsString;
          edtNome.Text      := DMBanco.cdsLeAlunoNOME.AsString;
          edtCurso.Text     := DMBanco.cdsLeAlunoCURSO.AsString;
          //edtData.Text    := DateTimeToStr(DMBanco.cdsLeAlunoDATA.AsDateTime);
          //edtHora.Text    := DateTimeToStr(DMBanco.cdsLeAlunoHORA.AsDateTime);
        end;
      end;
    except
      on E:Exception do
      begin
        if operacao <> 2 then
          if dmBanco.defRTrans.InTransaction then
            dmBanco.defRTrans.Rollback;
        //----
        ShowMessage('[PREENCHECAMPOS]ERRO(#01): ' + E.Message);
      end;
    end;
  finally
    if operacao <> 2 then
      if dmBanco.defRTrans.InTransaction then
        dmBanco.defRTrans.Commit;
  end;
end;

procedure TfrmCRUD.persistedados;
begin
  with DMBanco do
  begin
    with cdsGravaAluno do
    begin
      defRTrans.StartTransaction;
      try
        try
          Active := False;
          CommandText := 'EXECUTE PROCEDURE ADDUPDALUNO(:MATRICULA, :NOME, :CURSO, :DATA, :HORA)';
          Params.ParamByName('MATRICULA').AsString := edtMatricula.Text;
          Params.ParamByName('NOME'     ).AsString := edtNome.Text;
          Params.ParamByName('CURSO'    ).AsString := edtCurso.Text;
          Params.ParamByName('DATA'     ).AsDate   := StrToDate(edtData.Text);
          Params.ParamByName('HORA'     ).AsTime   := StrToTime(edtHora.Text);
          Execute;
        except
          on E:exception do
          begin
            if defRtrans.InTransaction then defRtrans.Rollback;
            ShowMessage('Erro na operação: ' + E.Message);
          end;
        end;
      finally
        if defRtrans.InTransaction then defRTrans.Commit;
        preenchecampos;
      end;
    end;
  end;
end;

procedure TfrmCRUD.btSalvarClick(Sender: TObject);
begin
  persistedados;
  preenchecampos;
  operacao := 0;
  habilitacampos(false);
  DBGrid1.Refresh;
end;

procedure TfrmCRUD.excluirregistro;
begin
  with DMBanco do
  begin
    with cdsDeletaAluno do
    begin
      defRTrans.StartTransaction;
      try
        try
          Active := False;
          CommandText := 'EXECUTE PROCEDURE DELALUNO(:MATRICULA)';
          Params.ParamByName('MATRICULA').AsString := edtMatricula.Text;
          Execute;
        except
          on E:exception do
          begin
            if defRtrans.InTransaction then defRTrans.Rollback;
            ShowMessage('Erro na operação');
          end;
        end;
      finally
        if defRtrans.InTransaction then defRTrans.Commit;
        preenchecampos;
      end;
    end;
  end;
end;

procedure TfrmCRUD.PreencherDataHoraAtual;
begin
  // Preencher o componente edtData com a data atual
  edtData.Text := DateToStr(Now);

  // Preencher o componente edtHora com a hora atual
  edtHora.Text := TimeToStr(Now);
end;

procedure TfrmCRUD.RealizarBusca;
begin
  // Define a consulta parametrizada no componente ClientDataSet
  with DMBanco do
  begin
    with cdsFindAluno do
    begin
      defRTrans.StartTransaction; // Inicia uma nova transação
      try
        try
          Active := False;
          Params.ParamByName('MATRICULA').AsString := edtMatricula.Text;
          Params.ParamByName('NOME'     ).AsString := edtNome.Text;
          Params.ParamByName('CURSO'    ).AsString := edtCurso.Text;
          Active := True;
          if RecordCount = 0 then
            MessageDlg('Nenhum registro encontrado!', mtWarning, [mbOK], 0);
        except
          on E: Exception do
          begin
            if defRTrans.InTransaction then defRTrans.Rollback; // Em caso de erro, rollback da transação
            ShowMessage('Erro na operação: ' + E.Message);
          end;
        end;
      finally
        if defRTrans.InTransaction then defRTrans.Commit; // Finaliza a transação
        preenchecampos;
      end;
    end;
  end;
end;

end.
