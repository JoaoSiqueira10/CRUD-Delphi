object DMBanco: TDMBanco
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 314
  Width = 526
  object ConnBanco: TpFIBDatabase
    Connected = True
    DBName = 
      'C:\Users\Usuario\Desktop\Treinamento Delphi\Youtube\CRUD Delphi\' +
      'db\CRUD.FDB'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=*iw01'
      'sql_role_name=')
    DefaultTransaction = defRTrans
    DefaultUpdateTransaction = defWTrans
    SQLDialect = 3
    Timeout = 0
    LibraryName = 'C:\Program Files\Firebird\Firebird_2_5\WOW64\fbclient.dll'
    WaitForRestoreConnect = 0
    Left = 32
    Top = 24
  end
  object sdsAluno: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT * FROM ALUNO')
    Transaction = defRTrans
    Database = ConnBanco
    Left = 96
    Top = 24
  end
  object defRTrans: TpFIBTransaction
    DefaultDatabase = ConnBanco
    Timeout = 1
    TimeoutAction = TACommit
    Left = 32
    Top = 80
  end
  object defWTrans: TpFIBTransaction
    DefaultDatabase = ConnBanco
    Timeout = 1
    TimeoutAction = TACommit
    TPBMode = tpbDefault
    Left = 32
    Top = 144
  end
  object cdsLeAluno: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT * FROM GETALUNO'
    Params = <>
    ProviderName = 'dspAluno'
    Left = 192
    Top = 200
    object cdsLeAlunoMATRICULA: TStringField
      FieldName = 'MATRICULA'
    end
    object cdsLeAlunoNOME: TStringField
      FieldName = 'NOME'
    end
    object cdsLeAlunoCURSO: TStringField
      FieldName = 'CURSO'
    end
    object cdsLeAlunoDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsLeAlunoHORA: TTimeField
      FieldName = 'HORA'
    end
  end
  object dspAluno: TDataSetProvider
    DataSet = sdsAluno
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 144
    Top = 72
  end
  object dsAluno: TDataSource
    DataSet = cdsLeAluno
    Left = 216
    Top = 128
  end
  object cdsGravaAluno: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAluno'
    Left = 288
    Top = 200
    object StringField1: TStringField
      FieldName = 'MATRICULA'
    end
    object StringField2: TStringField
      FieldName = 'NOME'
    end
    object StringField3: TStringField
      FieldName = 'CURSO'
    end
    object cdsGravaAlunoDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsGravaAlunoHORA: TTimeField
      FieldName = 'HORA'
    end
  end
  object cdsDeletaAluno: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAluno'
    Left = 384
    Top = 200
    object StringField4: TStringField
      FieldName = 'MATRICULA'
    end
    object StringField5: TStringField
      FieldName = 'NOME'
    end
    object StringField6: TStringField
      FieldName = 'CURSO'
    end
    object cdsDeletaAlunoDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsDeletaAlunoHORA: TTimeField
      FieldName = 'HORA'
    end
  end
  object cdsFindAluno: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT * FROM FINDALUNO(:MATRICULA,:NOME,:CURSO)'
    Params = <
      item
        DataType = ftUnknown
        Name = 'MATRICULA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NOME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CURSO'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspAluno'
    Left = 192
    Top = 256
    object cdsFindAlunoMATRICULA: TStringField
      FieldName = 'MATRICULA'
    end
    object cdsFindAlunoNOME: TStringField
      FieldName = 'NOME'
    end
    object cdsFindAlunoCURSO: TStringField
      FieldName = 'CURSO'
    end
    object cdsFindAlunoDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsFindAlunoHORA: TTimeField
      FieldName = 'HORA'
    end
  end
end
