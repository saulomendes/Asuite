{
Copyright (C) 2006-2013 Matteo Salvi

Website: http://www.salvadorsoftware.com/

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
}

unit ulAppConfig;

interface

uses
  Windows, SysUtils, Graphics, Forms, Controls, VirtualTrees, ulEnumerations,
  Vcl.Imaging.pngimage, System.UITypes, Classes, DKLang;

type

  { TConfiguration }
  TConfiguration = class
  private
    //General
    FStartWithWindows   : Boolean;
    FShowPanelAtStartUp : Boolean;
    FShowMenuAtStartUp  : Boolean;
    //Main Form
    FLangID             : Word;
    FUseCustomTitle     : Boolean;
    FCustomTitleString  : string;
    FHideTabSearch      : Boolean;
    //Main Form - Position and size
    FHoldSize           : Boolean;
    FAlwaysOnTop        : Boolean;
    //Main Form - Treevew
    FTVBackground       : Boolean;
    FTVBackgroundPath   : string;
    FTVAutoOpClCats     : Boolean; //Automatic Opening/closing categories
    FTVFont             : TFont;
    //MRU
    FMRU                : Boolean;
    FSubMenuMRU         : Boolean;
    FMRUNumber          : Integer;
    //MFU
    FMFU                : Boolean;
    FSubMenuMFU         : Boolean;
    FMFUNumber          : Integer;
    //Backup
    FBackup             : Boolean;
    FBackupNumber       : Integer;
    //Other functions
    FAutorun            : Boolean;
    FCache              : Boolean;
    FScheduler          : Boolean;
    //Execution
    FActionOnExe        : TActionOnExecute;
    FRunSingleClick     : Boolean;
    FHotKey             : Boolean;
    //Trayicon
    FTrayIcon           : Boolean;
    FTrayUseCustomIcon  : Boolean;
    FTrayCustomIconPath : string;
    FActionClickLeft    : Integer;
    FActionClickRight   : Integer;
    FUseClassicMenu     : Boolean;
    //Graphic Menu
    FGMTheme            : string;
    FGMFade             : Boolean;
    FGMPersonalPicture  : string;
    //Right buttons
    FGMBtnDocuments     : string;
    FGMBtnMusic         : string;
    FGMBtnPictures      : string;
    FGMBtnVideos        : string;
    FGMBtnExplore       : string;
    //HotKeys
    FWindowHotKey       : Boolean;
    FWindowHotKeyCode   : Integer;
    FWindowHotKeyMod    : Integer;
    FMenuHotKey         : Boolean;
    FMenuHotKeyCode     : Integer;
    FMenuHotKeyMod      : Integer;
    //Mouse Sensors
    FSensorLeftClick    : Array[0..3] of Integer; //0 Top, 1 Left, 2 Right, 3 Bottom
    FSensorRightClick   : Array[0..3] of Integer;
    //Misc
    FReadOnlyMode       : Boolean;
    FChanged            : Boolean;
    FASuiteState        : TASuiteState;
    FUseMouseSensors    : Boolean;
    FScanFolderLastPath: string;
    FScanFolderSubFolders: boolean;
    FScanFolderFileTypes: TStringList;
    FScanFolderExcludeNames: TStringList;
    procedure SetHoldSize(value: Boolean);
    procedure SetAlwaysOnTop(value: Boolean);
    procedure SetSensorLeftClick(aIndex: Integer; value: Integer);
    procedure SetSensorRightClick(aIndex: Integer; value: Integer);
    function GetSensorLeftClick(aIndex: Integer): Integer;
    function GetSensorRightClick(aIndex: Integer): Integer;
    procedure SetTrayIcon(value: Boolean);
    procedure SetTrayUseCustomIcon(value: Boolean);
    procedure SetUseCustomTitle(value: Boolean);
    procedure SetTVAutoOpClCats(value: Boolean);
    procedure SetHideTabSearch(value: Boolean);
    procedure SetShowPanelAtStartUp(value: Boolean);
    procedure SetTVBackground(value: Boolean);
    procedure SetCache(value: boolean);
    procedure SetStartWithWindows(value: boolean);
    procedure SetLangID(value: Word);
    procedure SetTVFont(value: TFont);
    procedure SetScheduler(value: Boolean);
    procedure SetGMTheme(value: string);
    procedure SetGMBtnDocuments(Value: string);
    procedure SetGMBtnExplore(Value: string);
    procedure SetGMBtnMusic(Value: string);
    procedure SetGMBtnPictures(Value: string);
    procedure SetGMBtnVideos(Value: string);
    procedure SetMenuHotKeyCode(const Value: Integer);
    procedure SetMenuHotKeyMod(const Value: Integer);
    procedure SetWindowHotKeyCode(const Value: Integer);
    procedure SetWindowHotKeyMod(const Value: Integer);
    procedure SetBackupNumber(const Value: Integer);
    procedure SetChanged(const Value: Boolean);
    procedure SetBackup(const Value: Boolean);
    procedure SetWindowHotKey(const Value: Boolean);
    procedure SetMenuHotKey(const Value: Boolean);
    procedure SetHotKey(const Value: Boolean);
  public
    { public declarations }
    constructor Create; overload;
    destructor Destroy; override;
    //Mouse Sensor
    procedure UpdateSensors;
    //General
    property StartWithWindows: Boolean read FStartWithWindows write SetStartWithWindows;
    property ShowPanelAtStartUp: Boolean read FShowPanelAtStartUp write SetShowPanelAtStartUp;
    property ShowMenuAtStartUp: Boolean read FShowMenuAtStartUp write FShowMenuAtStartUp;
    // Main Form
    property LangID: Word read FLangID write SetLangID;
    property UseCustomTitle: Boolean read FUseCustomTitle write SetUseCustomTitle;
    property CustomTitleString : String read FCustomTitleString write FCustomTitleString;
    property HideTabSearch: Boolean read FHideTabSearch write SetHideTabSearch;
    // Main Form - Position and size
    property HoldSize: Boolean read FHoldSize write SetHoldSize;
    property AlwaysOnTop: Boolean read FAlwaysOnTop write SetAlwaysOnTop;
    // Main Form - Treevew
    property TVBackground: Boolean read FTVBackground write SetTVBackground;
    property TVBackgroundPath: String read FTVBackgroundPath write FTVBackgroundPath;
    property TVAutoOpClCats: Boolean read FTVAutoOpClCats write SetTVAutoOpClCats;
    property TVFont: TFont read FTVFont write SetTVFont;
    // MRU
    property MRU: Boolean read FMRU write FMRU;
    property SubMenuMRU: Boolean read FSubMenuMRU write FSubMenuMRU;
    property MRUNumber: Integer read FMRUNumber write FMRUNumber;
    // MFU
    property MFU: Boolean read FMFU write FMFU;
    property SubMenuMFU: Boolean read FSubMenuMFU write FSubMenuMFU;
    property MFUNumber: Integer read FMFUNumber write FMFUNumber;
    // Backup
    property Backup: Boolean read FBackup write SetBackup;
    property BackupNumber: Integer read FBackupNumber write SetBackupNumber;
    // Other functions
    property Autorun: Boolean read FAutorun write FAutorun;
    property Cache: Boolean read FCache write SetCache;
    property Scheduler: Boolean read FScheduler write SetScheduler;
    // Execution
    property ActionOnExe: TActionOnExecute read FActionOnExe write FActionOnExe;
    property RunSingleClick: Boolean read FRunSingleClick write FRunSingleClick;
    // Trayicon
    property TrayIcon: Boolean read FTrayIcon write SetTrayIcon;
    property TrayUseCustomIcon: Boolean read FTrayUseCustomIcon write SetTrayUseCustomIcon;
    property TrayCustomIconPath: String read FTrayCustomIconPath write FTrayCustomIconPath;
    property ActionClickLeft: Integer read FActionClickLeft write FActionClickLeft;
    property ActionClickRight: Integer read FActionClickRight write FActionClickRight;
    property UseClassicMenu: Boolean read FUseClassicMenu write FUseClassicMenu;
    //Graphic Menu
    property GMTheme: string read FGMTheme write SetGMTheme;
    property GMFade: Boolean read FGMFade write FGMFade;
    property GMPersonalPicture: string read FGMPersonalPicture write FGMPersonalPicture;
    //Right buttons
    property GMBtnDocuments: string read FGMBtnDocuments write SetGMBtnDocuments;
    property GMBtnPictures: string read FGMBtnPictures write SetGMBtnPictures;
    property GMBtnMusic: string read FGMBtnMusic write SetGMBtnMusic;
    property GMBtnVideos: string read FGMBtnVideos write SetGMBtnVideos;
    property GMBtnExplore: string read FGMBtnExplore write SetGMBtnExplore;
    //HotKeys
    property HotKey: Boolean read FHotKey write SetHotKey;
    property WindowHotKey: Boolean read FWindowHotKey write SetWindowHotKey;
    property WindowHotKeyCode: Integer read FWindowHotKeyCode write SetWindowHotKeyCode;
    property WindowHotKeyMod: Integer read FWindowHotKeyMod write SetWindowHotKeyMod;
    property MenuHotKey: Boolean read FMenuHotKey write SetMenuHotKey;
    property MenuHotKeyCode: Integer read FMenuHotKeyCode write SetMenuHotKeyCode;
    property MenuHotKeyMod: Integer read FMenuHotKeyMod write SetMenuHotKeyMod;
    //Mouse Sensor
    property UseMouseSensors: Boolean read FUseMouseSensors write FUseMouseSensors;
    property SensorLeftClick[aIndex: Integer]:Integer read GetSensorLeftClick write setSensorLeftClick;
    property SensorRightClick[aIndex: Integer]:Integer read GetSensorRightClick write setSensorRightClick;
    // Misc
    property ReadOnlyMode: Boolean read FReadOnlyMode write FReadOnlyMode;
    property Changed: Boolean read FChanged write SetChanged;
    property ASuiteState: TASuiteState read FASuiteState write FASuiteState;
    property ScanFolderLastPath: string read FScanFolderLastPath write FScanFolderLastPath;
    property ScanFolderSubFolders: boolean read FScanFolderSubFolders write FScanFolderSubFolders;
    property ScanFolderFileTypes: TStringList read FScanFolderFileTypes write FScanFolderFileTypes;
    property ScanFolderExcludeNames: TStringList read FScanFolderExcludeNames write FScanFolderExcludeNames;
  end;

var
  Config  : TConfiguration;

implementation

uses
  Main, udClassicMenu, ulSysUtils, AppConfig, Sensor, ulCommonUtils, ulFileFolder,
  udImages, GraphicMenu, ulTreeView;

constructor TConfiguration.Create;
begin
  //Find language files and register them in LangManager
  LangManager.ScanForLangFiles(SUITE_LOCALE_PATH, '*.lng', False);
  //General
  FStartWithWindows   := False;
  FShowPanelAtStartUp := True;
  FShowMenuAtStartUp  := False;
  //Main Form
  FLangID             := 1033;
  FUseCustomTitle     := False;
  FCustomTitleString  := APP_TITLE;
  FHideTabSearch      := False;
  //Main Form - Position and size
  FHoldSize           := False;
  FAlwaysOnTop        := False;
  //Main Form - Treevew
  FTVBackground       := False;
  FTVBackgroundPath   := '';
  FTVAutoOpClCats     := True;
  //Treeview Font
  FTVFont             := TFont.Create;
  FTVFont.Name        := 'MS Sans Serif';
  FTVFont.Size        := 8;
  FTVFont.Color       := clWindowText;
  //MRU
  FMRU                := True;
  FSubMenuMRU         := False;
  FMRUNumber          := 5;
  //MFU
  FMFU                := True;
  FSubMenuMFU         := True;
  FMFUNumber          := 5;
  //Backup
  FBackup             := True;
  FBackupNumber       := 5;
  //Other functions
  FAutorun            := True;
  FCache              := True;
  FScheduler          := True;
  //Execution
  FActionOnExe        := aeDefault;
  FRunSingleClick     := False;
  //Trayicon
  FTrayIcon           := True;
  FTrayUseCustomIcon  := False;
  FTrayCustomIconPath := '';
  FActionClickLeft    := 0;
  FActionClickRight   := 2;
  FUseClassicMenu     := False;
  //Graphic Menu
  FGMTheme            := 'Default';
  FGMFade             := True;
  FGMPersonalPicture  := 'PersonalPicture.jpg';
  //Right buttons
  FGMBtnDocuments     := '%USERPROFILE%\Documents';
  FGMBtnPictures      := '%USERPROFILE%\Pictures';
  FGMBtnMusic         := '%USERPROFILE%\Music';
  FGMBtnVideos        := '%USERPROFILE%\Videos';
  FGMBtnExplore       := '$drive';
  //Misc
  FReadOnlyMode       := False;
  FChanged            := False;
  FASuiteState        := asStartUp;
  FHotKey             := True;
  //Hotkey
  FWindowHotKey       := False;
  FWindowHotKeyCode   := 0;
  FWindowHotKeyMod    := 0;
  FMenuHotKey         := False;
  FMenuHotKeyCode     := 0;
  FMenuHotKeyMod      := 0;
  //ScanFolder
  FScanFolderLastPath   := SUITE_WORKING_PATH;
  FScanFolderSubFolders := True;
  FScanFolderFileTypes  := TStringList.Create;
  FScanFolderFileTypes.Add(EXT_LNK);
  FScanFolderFileTypes.Add(EXT_EXE);
  FScanFolderExcludeNames := TStringList.Create;
  FScanFolderExcludeNames.Add('uninstall');
end;

destructor TConfiguration.Destroy;
begin
  inherited Destroy;
  FTVFont.Free;
  FScanFolderFileTypes.Free;
  FScanFolderExcludeNames.Free;
end;

procedure TConfiguration.SetHoldSize(value: boolean);
begin
  FHoldSize := value;
  if FHoldSize then
  begin
    frmMain.BorderStyle := bsSingle;
    frmMain.BorderIcons := [biSystemMenu, biMinimize];
  end
  else begin
    frmMain.BorderStyle := bsSizeable;
    frmMain.BorderIcons := [biSystemMenu, biMinimize, biMaximize];
  end;
end;

procedure TConfiguration.SetHotKey(const Value: Boolean);
begin
  if (FHotKey <> Value) then
  begin
    FHotKey := Value;
    HotKeyApp.RefreshRegs;
  end;
end;

procedure TConfiguration.SetAlwaysOnTop(value: Boolean);
begin
  FAlwaysOnTop := value;
  if FAlwaysOnTop then
    frmMain.FormStyle := fsStayOnTop
  else
    frmMain.FormStyle := fsNormal;
end;

procedure TConfiguration.SetBackup(const Value: Boolean);
begin
  FBackup := Value;
  if FBackup then
    CheckBackupFolder;
end;

procedure TConfiguration.SetBackupNumber(const Value: Integer);
begin
  if Value < FBackupNumber then
    DeleteOldBackups(Value);
  FBackupNumber := Value;
end;

procedure TConfiguration.SetScheduler(value: Boolean);
begin
  FScheduler := value;
  frmMain.tmScheduler.Enabled := FScheduler;
end;

procedure TConfiguration.SetSensorLeftClick(aIndex: Integer; value: Integer);
begin
  FSensorLeftClick[aIndex] := value;
end;

procedure TConfiguration.SetSensorRightClick(aIndex: Integer; value: Integer);
begin
  FSensorRightClick[aIndex] := value;
end;

function TConfiguration.GetSensorLeftClick(aIndex: Integer): Integer;
begin
  Result := FSensorLeftClick[aIndex];
end;

function TConfiguration.GetSensorRightClick(aIndex: Integer): Integer;
begin
  Result := FSensorRightClick[aIndex];
end;

procedure TConfiguration.SetTrayIcon(value: Boolean);
begin
  FTrayIcon := value;
  ClassicMenu.tiTrayMenu.Visible := FTrayIcon;
  if (not(FShowPanelAtStartUp)) and (not(FTrayicon)) then
    FShowPanelAtStartUp := True;
end;

procedure TConfiguration.SetTrayUseCustomIcon(value: Boolean);
var
  sPath: string;
begin
  FTrayUseCustomIcon := value;
  ClassicMenu.tiTrayMenu.Visible := False;
  sPath := RelativeToAbsolute(FTrayCustomIconPath);
  if (FTrayUseCustomIcon) and (FileExists(sPath)) then
    ClassicMenu.tiTrayMenu.Icon.LoadFromFile(sPath)
  else begin
    sPath := RelativeToAbsolute(SUITE_SMALLICONS_PATH + FILEICON_ASuite);
    if FileExists(sPath) then
      ClassicMenu.tiTrayMenu.Icon.LoadFromFile(sPath);
  end;
  //If you can't change trayicon's property visible, it will use old icon
  ClassicMenu.tiTrayMenu.Visible := FTrayIcon;
end;

procedure TConfiguration.SetUseCustomTitle(value: Boolean);
begin
  FUseCustomTitle := value;
  if (FUseCustomTitle) and (FCustomTitleString <> '') then
    frmMain.Caption := FCustomTitleString
  else
    frmMain.Caption := APP_TITLE;
end;

procedure TConfiguration.SetWindowHotKey(const Value: Boolean);
begin
  if (Config.HotKey) then
  begin
    //Unregister hotkey (if actived)
    UnregisterHotKey(frmMain.Handle, frmMain.Handle);
    //Register hotkey
    if (Config.WindowHotKey) then
    begin
      if Not(RegisterHotKey(frmMain.Handle, frmMain.Handle,
                            GetHotKeyMod(FWindowHotKeyMod),
                            GetHotKeyCode(FWindowHotKeyCode))) then
        ShowMessage(DKLangConstW('msgErrRegHotkey'));
    end;
  end;
  FWindowHotKey := Value;
end;

procedure TConfiguration.SetWindowHotKeyCode(const Value: Integer);
begin
  if Value <> -1 then
    FWindowHotKeyCode := Value
  else
    FWindowHotKeyCode := 0;
end;

procedure TConfiguration.SetWindowHotKeyMod(const Value: Integer);
begin
  if Value <> -1 then
    FWindowHotKeyMod := Value
  else
    FWindowHotKeyMod := 0;
end;

procedure TConfiguration.SetTVAutoOpClCats(value: Boolean);
begin
  FTVAutoOpClCats := value;
  if FTVAutoOpClCats then
    frmMain.vstList.TreeOptions.AutoOptions := frmMain.vstList.TreeOptions.AutoOptions + [toAutoExpand]
  else
    frmMain.vstList.TreeOptions.AutoOptions := frmMain.vstList.TreeOptions.AutoOptions - [toAutoExpand];
end;

procedure TConfiguration.SetHideTabSearch(value: Boolean);
begin
  FHideTabSearch := value;
  with frmMain do
  begin
    tbSearch.TabVisible    := Not(FHideTabSearch);
    tbList.TabVisible      := Not(FHideTabSearch);
    pcList.ActivePageIndex := 0;
  end;
end;

procedure TConfiguration.SetShowPanelAtStartUp(value: Boolean);
begin
  FShowPanelAtStartUp := value;
end;

procedure TConfiguration.SetTVBackground(value: Boolean);
var
  BackgroundBMP : TBitmap;
  BackgroundPNG : TPngImage;
begin
  FTVBackground := value;
  with frmMain do
  begin
    vstList.TreeOptions.PaintOptions := vstList.TreeOptions.PaintOptions - [toShowBackground];
    if (FTVBackground) and (FTVBackgroundPath <> '') and
       (FileExists(RelativeToAbsolute(FTVBackgroundPath))) then
    begin
      if LowerCase(ExtractFileExt(RelativeToAbsolute(FTVBackgroundPath))) <> '.bmp' then
      begin
        BackgroundBMP := TBitmap.Create;
        BackgroundPNG := TPngImage.Create;
        try
          BackgroundPNG.LoadFromFile(RelativeToAbsolute(FTVBackgroundPath));
          BackgroundBMP.Assign(BackgroundPNG);
          vstList.Background.Bitmap := BackgroundBMP;
        finally
          BackgroundBMP.Free;
          BackgroundPNG.Free;
        end;
      end
      else
        vstList.Background.LoadFromFile(RelativeToAbsolute(FTVBackgroundPath));
      vstList.TreeOptions.PaintOptions := vstList.TreeOptions.PaintOptions + [toShowBackground];
    end
    else
      vstList.TreeOptions.PaintOptions := vstList.TreeOptions.PaintOptions - [toShowBackground];
    vstList.Update;
  end;
end;

procedure TConfiguration.SetTVFont(value: TFont);
begin
  if FTVFont <> value then
  begin
    with FTVFont do
    begin
      Name  := value.Name;
      Style := value.Style;
      Size  := value.Size;
      Color := value.Color;
    end;
  end;
end;

procedure TConfiguration.UpdateSensors;
begin
  CloseFormSensors;
  CreateFormSensors;
end;

procedure TConfiguration.SetCache(value: Boolean);
begin
  FCache := value;
  //If disabled, delete all file icon-cache and folders cache
  if Not(FCache) then
    RemoveCacheFolders
  else //Else create folders cache
    CheckCacheFolders;
end;

procedure TConfiguration.SetChanged(const Value: Boolean);
begin
  FChanged := Value;
  RefreshList(frmMain.vstList);
end;

procedure TConfiguration.SetGMBtnDocuments(Value: string);
begin
  if value = '' then
    FGMBtnDocuments := '%USERPROFILE%\Documents'
  else
    FGMBtnDocuments := value;
end;

procedure TConfiguration.SetGMBtnExplore(Value: string);
begin
  if value = '' then
    FGMBtnExplore := '$drive\'
  else
    FGMBtnExplore := value;
end;

procedure TConfiguration.SetGMBtnMusic(Value: string);
begin
  if value = '' then
    FGMBtnMusic := '%USERPROFILE%\Music'
  else
    FGMBtnMusic := value;
end;

procedure TConfiguration.SetGMBtnPictures(Value: string);
begin
  if value = '' then
    FGMBtnPictures := '%USERPROFILE%\Pictures'
  else
    FGMBtnPictures := value;
end;

procedure TConfiguration.SetGMBtnVideos(Value: string);
begin
  if value = '' then
    FGMBtnVideos := '%USERPROFILE%\Videos'
  else
    FGMBtnVideos := value;
end;

procedure TConfiguration.SetGMTheme(value: string);
begin
  if value = '' then
    FGMTheme := 'default'
  else
    FGMTheme := value;
  //Set Paths
  SUITE_CURRENTTHEME_PATH := IncludeTrailingBackslash(SUITE_MENUTHEMES_PATH + FGMTheme);
  SUITE_SMALLICONS_PATH   := SUITE_CURRENTTHEME_PATH + SMALLICONS_DIR;
  SUITE_LARGEICONS_PATH   := SUITE_CURRENTTHEME_PATH + LARGEICONS_DIR;
  //Loading icons
  ImagesDM.LoadASuiteIcons;
  frmMain.LoadGlyphs;
  //Refresh GraphicMenu
  if Assigned(frmGraphicMenu) then
  begin
    frmGraphicMenu.Free;
    Application.CreateForm(TfrmGraphicMenu, frmGraphicMenu);
  end;
end;

procedure TConfiguration.SetStartWithWindows(value: Boolean);
begin
  FStartWithWindows := value;
  if FStartWithWindows then
    SetASuiteAtWindowsStartup
  else
    DeleteASuiteAtWindowsStartup;
end;

procedure TConfiguration.SetLangID(value: Word);
begin
  if (value <> -1) or (value <> 0) then
    FLangID := value
  else
    FLangID := 1033;
  LangManager.LanguageID := FLangID;
end;

procedure TConfiguration.SetMenuHotKey(const Value: Boolean);
begin
  if (Config.HotKey) then
  begin
    //Unregister hotkey
    UnregisterHotKey(frmMain.Handle, frmMenuID);
    //Register Menuhotkey
    if (value) then
    begin
      if Not(RegisterHotKey(frmMain.Handle, frmMenuID,
                            GetHotKeyMod(Config.MenuHotKeyMod),
                            GetHotKeyCode(Config.MenuHotKeyCode))) then
        ShowMessage(DKLangConstW('msgErrRegHotkey'));
    end;
  end;
  FMenuHotKey := Value;
end;

procedure TConfiguration.SetMenuHotKeyCode(const Value: Integer);
begin
  if Value <> -1 then
    FMenuHotKeyCode := Value
  else
    FMenuHotKeyCode := 0;
end;

procedure TConfiguration.SetMenuHotKeyMod(const Value: Integer);
begin
  if Value <> -1 then
    FMenuHotKeyMod := Value
  else
    FMenuHotKeyMod := 0;
end;

end.
