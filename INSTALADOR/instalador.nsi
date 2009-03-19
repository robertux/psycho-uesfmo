;NSIS Modern User Interface
;Instalacion de ...${NOMBREPROG}  ^_^
;Autor Rodrigo S. Amaya Centeno.

!define PROGRAMADORES 'Rodrigo S. Amaya Centeno, Roberto C. Linares Melara.'
!define EMPRESAIMAGINARIA 'UES FMOcc'
!define SLOGAN ' - Universidad de El Salvador -'

!define NOMBREPROG 'PsychoEval'
!define DESCRIPROG 'Evaluador de Aspirantes pruebas RAVEN y CEPS'
!define VERSION '1.0'
!define RUTAEXE '..\WinApp\bin\Debug'

;!define PRODUCTO_FINAL
;!define PRODUCTO_ESPECIFICO
;!define PRODUCTO_PRUEBA
!define PRODUCTO_OPENSOURCE
; Opcion de compresion
!ifdef PRODUCTO_FINAL
	SetCompressor /SOLID lzma
	!define LIC '.\docu\licencia.txt'
!endif
!ifdef PRODUCTO_PRUEBA
	SetCompressor zlib
	!define LIC '.\docu\prueba.txt'
!endif
!ifdef PRODUCTO_ESPECIFICO
	SetCompressor zlib
	!define LIC '.\docu\licencia-especifica.txt'
!endif
!ifdef PRODUCTO_OPENSOURCE
	SetCompressor zlib
	!define LIC '.\docu\gpl-2.0.txt'
!endif

;Configuracion
Name "${NOMBREPROG}"
Caption "${NOMBREPROG} ${VERSION} Instalacion"
BrandingText "UES FMOcc"

!ifdef OUTFILE
	OutFile "${OUTFILE}"
!else
	OutFile .\${NOMBREPROG}-${VERSION}-Instalacion.exe
!endif

;--------------------------------
;Incluir Modern UI
!include "MUI.nsh"
;--------------------------------

;Solo UNA instancia del instalador
Function .onInit
 System::Call 'kernel32::CreateMutexA(i 0, i 0, t "ramayacmutex") i .r1 ?e'
 Pop $R0
 
 StrCmp $R0 0 +3
   MessageBox MB_OK|MB_ICONEXCLAMATION "El Instalador de ${NOMBREPROG} ya se esta ejecutando."
   Abort

FunctionEnd


  
;General
; Carpeta de instalacion
InstallDir "$PROGRAMFILES\${NOMBREPROG}"
;clave del registro
InstallDirRegKey HKCU "Software\${NOMBREPROG}" ""

;--------------------------------

;Iconos
!define MUI_ICON ".\graficos\iconos\orange-install.ico"
!define MUI_UNICON ".\graficos\iconos\orange-uninstall.ico"
;Imagen de el tope de la ventana
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP ".\graficos\headers\orange.bmp" ; optional  
;Baner de la izquierda instalacion
!define MUI_WELCOMEFINISHPAGE_BITMAP ".\graficos\asistentes\orange.bmp"
;Baner de la izquierda desinstalacion
!define MUI_UNWELCOMEFINISHPAGE_BITMAP ".\graficos\asistentes\orange-uninstall.bmp"
  
!define MUI_ABORTWARNING

;--------------------------------
;Paginas Instalacion
  
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "${LIC}"
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

;Paginas Desinstalacion
!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

;--------------------------------
;Lenguajes

!insertmacro MUI_LANGUAGE "Spanish"

;--------------------------------
;Instalacion

Section "Extrayendo componentes adicionales..." SecMySQLODBC
	SetDetailsPrint textonly
	DetailPrint "Extrayendo componentes..."	
	SectionIn 1 RO
	SetOutPath "$INSTDIR"
	File .\extra\mysql-essential-5.0.51a-win32.msi
	;File .\extra\dotnetfx.exe
	;File .\mysql\mysql-connector-odbc-3.51.12-win32.msi

SectionEnd

Section "Instalando componentes adicionales..." SecInstalar
	SetDetailsPrint listonly
	DetailPrint "Instalando componentes..."
	SectionIn 2
	SetOutPath "$INSTDIR"
	File .\instalamsi.bat
	ExecWait "$INSTDIR\instalamsi.bat"
	
	Call IsDotNETInstalled
	Pop $R3
	StrCmp $R3 0 +3
    DetailPrint "Encontre: .NET"
    Goto +7 ;numero de linea, sin comentario al que tengo que "saltar"
    ; else
    DetailPrint "No encontre: .NET, procedere a instalarlo..."
	SetOutPath "$INSTDIR"
	File .\extra\dotnetfx.exe
	ExecWait 'dotnetfx.exe /q:a /c:"install /q"'
	Delete "$INSTDIR\dotnetfx.exe"
	DetailPrint "Framework .NET 2.0 instalado."
	
	;No dejemos basura tirada... MUAJAJAJAJA
	Delete "$INSTDIR\instalamsi.bat"
	Delete "$INSTDIR\*.msi"
SectionEnd

;Veamos si esta instalado .NET (verificacion SENCILLA)
Function IsDotNETInstalled
  Push $0
  Push $1
  Push $2
  Push $3
  Push $4
 
  ReadRegStr $4 HKEY_LOCAL_MACHINE \
    "Software\Microsoft\.NETFramework" "InstallRoot"
  # remove trailing back slash
  Push $4
  Exch $EXEDIR
  Exch $EXEDIR
  Pop $4
  # if the root directory doesn't exist .NET is not installed
  IfFileExists $4 0 noDotNET
 
  StrCpy $0 0
 
  EnumStart:
 
    EnumRegKey $2 HKEY_LOCAL_MACHINE \
      "Software\Microsoft\.NETFramework\Policy"  $0
    IntOp $0 $0 + 1
    StrCmp $2 "" noDotNET
 
    StrCpy $1 0
 
    EnumPolicy:
 
      EnumRegValue $3 HKEY_LOCAL_MACHINE \
        "Software\Microsoft\.NETFramework\Policy\$2" $1
      IntOp $1 $1 + 1
       StrCmp $3 "" EnumStart
        IfFileExists "$4\$2.$3" foundDotNET EnumPolicy
 
  noDotNET:
    StrCpy $0 0
    Goto done
 
  foundDotNET:
    StrCpy $0 1
 
  done:
    Pop $4
    Pop $3
    Pop $2
    Pop $1
    Exch $0
FunctionEnd

;para cuando se necesita registrar la conexion ODBC
;Section "Registrar Conexion" SecConex
	;SetDetailsPrint none
	;DetailPrint "Registrando Conexion ODBC 3.51..."
	;SetDetailsPrint listonly
	;SectionIn 3
	;SetOutPath "$INSTDIR"
	;File ..\extra\.exe
	;ExecWait '"$INSTDIR\.exe" -cr'	
;SectionEnd

Section "Configurar Instancia de Gestor de Base de Datos" SecConfMySQL
	SetDetailsPrint listonly
	DetailPrint "Configurando..."
	SectionIn 3
	ExecWait '"$PROGRAMFILES\MySQL\MySQL Server 5.0\bin\MySQLInstanceConfig.exe"'
	;esta basura no funciona asi que asi se queda la instalacion de la instancia...
	;File .\my.ini
	;SetOutPath "$PROGRAMFILES\MySQL\MySQL Server 5.0\"
	;Exec '"$PROGRAMFILES\MySQL\MySQL Server 5.0\bin\mysql-nt.exe"'
SectionEnd

Section "Generar Base de Datos" SecLlenarBD
	SetDetailsPrint none
	DetailPrint "Generando la base de datos..."
	;SetDetailsPrint listonly	
	SectionIn 4 ;RO
	SetOutPath "$TEMP\"

	File .\b.bat
	File .\b.sql
	ExecWait '"$TEMP\b.bat"'
	Delete $TEMP\b.bat
	Delete $TEMP\b.sql
	
	DetailPrint "Creando usuarios y asignando permisos..."
	File .\u.bat
	File .\u.sql
	ExecWait '"$TEMP\u.bat"'
	Delete $TEMP\u.bat
	Delete $TEMP\u.sql
	
SectionEnd

Section "${NOMBREPROG}" SecBASE
  SetDetailsPrint textonly
  DetailPrint "Instalando ${NOMBREPROG}..."
  SetDetailsPrint listonly
  
  SectionIn 5 RO
  SetOutPath "$INSTDIR"
  ;RMDir /r $SMPROGRAMS!\! <-quita los signos de admiracion

  SetOverwrite on
  File ${LIC}
  File ${RUTAEXE}\${NOMBREPROG}.exe
  File ${RUTAEXE}\*.dll
  File ${RUTAEXE}\*.xml
  File ${RUTAEXE}\*.config
  ;documentos de wordpad que sirven como plantillas
  ;File ${RUTAEXE}\*.rtf
  ;archivos de ayuda
  ;File ${RUTAEXE}\ayuda.bat
  ;File ${RUTAEXE}\player.exe
  ;File ${RUTAEXE}\ayuda.swf
  ;File ${RUTAEXE}\busca.png
  
  SetOutPath "$INSTDIR\Media\"
  File ${RUTAEXE}\Media\*.png
  
  SetOutPath "$INSTDIR\Media\Raven\"
  File ${RUTAEXE}\Media\Raven\*.jpg
  
  SetOutPath "$INSTDIR\Ayuda\"
  File ${RUTAEXE}\Ayuda\MANUAL*.doc
  
  SetOutPath "$INSTDIR\Ayuda\Videos\"
  File ${RUTAEXE}\Ayuda\Videos\*
  
  ;File ${RUTAEXE}\recursos\rac\*.png
  
  ;Store installation folder
  WriteRegStr HKCU "Software\${NOMBREPROG}" "" $INSTDIR
  ;Desinstalacion de producto
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${NOMBREPROG}" "DisplayName" "${NOMBREPROG}"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${NOMBREPROG}" "UninstallString" "$INSTDIR\Desinstalar-${NOMBREPROG}.exe"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${NOMBREPROG}" "InstallLocation" "$INSTDIR\"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${NOMBREPROG}" "Contact" "${PROGRAMADORES}"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${NOMBREPROG}" "Publisher" "${EMPRESAIMAGINARIA}, ${SLOGAN}"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${NOMBREPROG}" "DisplayVersion" "${VERSION}"
  ;Create uninstaller
  WriteUninstaller "$INSTDIR\Desinstalar-${NOMBREPROG}.exe"

SectionEnd

Section "Accesos Directos" SecAccesosDirectos
  SetDetailsPrint textonly
  DetailPrint "Creando Accesos Directos en el Menu Inicio y en el Escritorio..."
  SetDetailsPrint listonly
  SectionIn 6 ;RO
  SetOutPath $INSTDIR
  CreateDirectory $SMPROGRAMS\${NOMBREPROG}
  CreateShortCut "$SMPROGRAMS\${NOMBREPROG}\${NOMBREPROG}.lnk" "$INSTDIR\${NOMBREPROG}.exe" ""
  ;CreateShortCut "$SMPROGRAMS\${NOMBREPROG}\Ayuda.lnk" "$INSTDIR\ayuda.bat" ""
  ;CreateShortCut "$SMPROGRAMS\${NOMBREPROG}\PlantillaExpediente.lnk" "$INSTDIR\plantillaExpediente.rtf" ""
  ;CreateShortCut "$SMPROGRAMS\${NOMBREPROG}\PlantillaReceta.lnk" "$INSTDIR\plantillaReceta.rtf" ""
  ;CreateShortCut "$SMPROGRAMS\NSIS\MakeNSISW (Compiler GUI).lnk" "$INSTDIR\makensisw.exe"
  ;CreateShortCut "$SMPROGRAMS\NSIS\NSIS Documentation.lnk" "$INSTDIR\NSIS.chm"
  CreateShortCut "$SMPROGRAMS\${NOMBREPROG}\Desinstalar ${NOMBREPROG}.lnk" "$INSTDIR\Desinstalar-${NOMBREPROG}.exe"
  CreateShortCut "$DESKTOP\${NOMBREPROG} - ${DESCRIPROG}.lnk" "$INSTDIR\${NOMBREPROG}.exe"
  ;no se porque no funciona :P
  RMDir /r "$SMPROGRAMS\MySQL\"
  ;por si acaso.
  Delete "$INSTDIR\*.msi"
SectionEnd

;--------------------------------
;Descriptions

  ;Asignar descripcion a las secciones
  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
    !insertmacro MUI_DESCRIPTION_TEXT ${SecBase} "Archivos de funcionamiento BASICO de el programa."
	!insertmacro MUI_DESCRIPTION_TEXT ${SecMySQLODBC} "Extraccion de componentes adicionales."
	;!insertmacro MUI_DESCRIPTION_TEXT ${SecConex} "Registro de componentes adicionales."
	!insertmacro MUI_DESCRIPTION_TEXT ${SecInstalar} "Instalacion de componentes adicionales."
	!insertmacro MUI_DESCRIPTION_TEXT ${SecLlenarBD} "Generar la base de datos."
	!insertmacro MUI_DESCRIPTION_TEXT ${SecConfMySQL} "Configurar los componentes adicionales ."
	!insertmacro MUI_DESCRIPTION_TEXT ${SecAccesosDirectos} "Crear Accesos Directos en el Escritorio y en el Menu Inicio."
  !insertmacro MUI_FUNCTION_DESCRIPTION_END

;--------------------------------
;Informacion de la Version 

  VIProductVersion "1.0.0.0"
  VIAddVersionKey /LANG=${LANG_SPANISH} "ProductName" "${NOMBREPROG} Instalacion"
  VIAddVersionKey /LANG=${LANG_SPANISH} "Comments" "Instalacion de ${NOMBREPROG} - ${DESCRIPROG}."
  VIAddVersionKey /LANG=${LANG_SPANISH} "CompanyName" "${EMPRESAIMAGINARIA}"
  VIAddVersionKey /LANG=${LANG_SPANISH} "LegalTrademarks" ""
  VIAddVersionKey /LANG=${LANG_SPANISH} "LegalCopyright" "© ${PROGRAMADORES}"
  VIAddVersionKey /LANG=${LANG_SPANISH} "FileDescription" "${NOMBREPROG}"
  VIAddVersionKey /LANG=${LANG_SPANISH} "FileVersion" "1.0"
  
;--------------------------------
;Uninstaller

Section "Uninstall"
	SetDetailsPrint none
	DetailPrint "Desinstalando ${NOMBREPROG}..."
	SetDetailsPrint none
	;ExecWait '"MsiExec.exe" /I{0CB3C535-1171-4A20-B549-E2CB5DEB9723}' ;ODBC
	ExecWait '"MsiExec.exe" /I{3EAB224E-12F7-4EBA-AC0A-A2B10FEEA0E4}' ;MySQL, esto cambia para cada version del programa ( Uninstall String )
	;ExecWait '"$INSTDIR\urco.exe" -qr'
	;esto es por si se es muuuy paranoico, y mala gente.
	;RMDir /r "$PROGRAMFILES\MySQL\MySQL Server 5.0\data\pimoto"
	;esto es por si se es muuuy paranoico, y mala gente.
	;RMDir /r "$PROGRAMFILES\MySQL\MySQL Server 5.0\data\mysql"
	;Delete "ib*"
	;Delete "*.err"
	RMDir /r $SMPROGRAMS\${NOMBREPROG}
	Delete "$DESKTOP\${NOMBREPROG} - ${DESCRIPROG}.lnk"	
	DeleteRegKey /ifempty HKCU "Software\${NOMBREPROG}"
    Delete $INSTDIR\Desinstalar-${NOMBREPROG}.exe
	RMDir /r $INSTDIR
SectionEnd
