object frmCRUD: TfrmCRUD
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'CRUD 0.0.1'
  ClientHeight = 504
  ClientWidth = 564
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 136
    Top = 96
    Width = 52
    Height = 16
    Caption = 'M'#225'tricula'
  end
  object Label2: TLabel
    Left = 136
    Top = 136
    Width = 38
    Height = 16
    Caption = 'Nome:'
  end
  object Label3: TLabel
    Left = 135
    Top = 176
    Width = 38
    Height = 16
    Caption = 'Curso:'
  end
  object lblData: TLabel
    Left = 135
    Top = 219
    Width = 31
    Height = 16
    Caption = 'Data:'
  end
  object lblHora: TLabel
    Left = 135
    Top = 256
    Width = 32
    Height = 16
    Caption = 'Hora:'
  end
  object edtNome: TEdit
    Left = 192
    Top = 133
    Width = 189
    Height = 24
    MaxLength = 50
    TabOrder = 1
  end
  object edtMatricula: TEdit
    Left = 192
    Top = 93
    Width = 73
    Height = 24
    MaxLength = 10
    TabOrder = 0
  end
  object edtCurso: TEdit
    Left = 192
    Top = 173
    Width = 189
    Height = 24
    TabOrder = 2
  end
  object btPro: TButton
    Left = 89
    Top = 39
    Width = 75
    Height = 25
    Caption = '->'
    TabOrder = 11
    OnClick = btProClick
  end
  object btSalvar: TButton
    Left = 128
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 3
    Visible = False
    OnClick = btSalvarClick
  end
  object btAdd: TButton
    Left = 217
    Top = 39
    Width = 75
    Height = 25
    Caption = 'Adicionar'
    TabOrder = 5
    OnClick = btAddClick
  end
  object btEditar: TButton
    Left = 298
    Top = 39
    Width = 75
    Height = 25
    Caption = 'Editar'
    TabOrder = 6
    OnClick = btEditarClick
  end
  object btExcluir: TButton
    Left = 227
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 7
    OnClick = btExcluirClick
  end
  object btCancelar: TButton
    Left = 319
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 4
    Visible = False
    OnClick = btCancelarClick
  end
  object btAnterior: TButton
    Left = 8
    Top = 39
    Width = 75
    Height = 25
    Caption = '<-'
    TabOrder = 12
    OnClick = btAnteriorClick
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 384
    Width = 564
    Height = 120
    Align = alBottom
    DataSource = DMBanco.dsAluno
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 10
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'MATRICULA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURSO'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HORA'
        Visible = True
      end>
  end
  object edtData: TEdit
    Left = 192
    Top = 216
    Width = 65
    Height = 24
    ReadOnly = True
    TabOrder = 8
  end
  object edtHora: TEdit
    Left = 192
    Top = 253
    Width = 34
    Height = 24
    ReadOnly = True
    TabOrder = 9
  end
  object btnPesquisar: TButton
    Left = 379
    Top = 39
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 13
    OnClick = btnPesquisarClick
  end
  object btnBusca: TButton
    Left = 387
    Top = 131
    Width = 38
    Height = 25
    Caption = '>>'
    TabOrder = 14
    OnClick = btnBuscaClick
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 564
    Height = 33
    Align = alTop
    BorderOuter = fsNone
    BorderColor = clBlack
    BorderShadow = clBlack
    BorderWidth = 1
    Caption = 'GERENCIAMENTO DE ALUNOS'
    Color = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 15
    ExplicitWidth = 554
  end
end
