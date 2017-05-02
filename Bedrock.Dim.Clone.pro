﻿601,100
562,"SUBSET"
586,"}Cubes"
585,"}Cubes"
564,
565,"sAgkwg2W6UGKljVuHz=awWIKjm\yEMe=R<wfT>AJtZRgpZFI``dE:_vlBA=US3Y<oOTF2P9[q;ukQEvfrOxH4xvdp^0AyEvwaI;IWJii0y4eYraZ9wpSZDORCiJ<Jx[vJOa4491Ad?0r5Zn59JCWcfZ149uAz;R2;OkCyuTE]J2Dob>eP76zTfMUdBf5W9A6qPfKfI7O"
559,1
928,0
593,
594,
595,
597,
598,
596,
800,
801,
566,0
567,","
588,"."
589,
568,""""
570,
571,All
569,0
592,0
599,1000
560,4
pSourceDim
pTargetDim
pAttr
pDebug
561,4
2
2
1
1
590,4
pSourceDim,""
pTargetDim,""
pAttr,0.
pDebug,0.
637,4
pSourceDim,Source Dimension
pTargetDim,Target Dimension
pAttr,Include Attributes? (Boolean 1=True)
pDebug,Debug Mode
577,1
vElement
578,1
2
579,1
1
580,1
0
581,1
0
582,1
VarType=32ColType=827
572,111

#****Begin: Generated Statements***
#****End: Generated Statements****

#####################################################################################
##~~Copyright bedrocktm1.org 2011 www.bedrocktm1.org/how-to-licence.php Ver 2.0.2~~##
#####################################################################################

# This process will clone the source dimension
# If the target dimension already exists then it will be overwritten


### Constants ###

cProcess = 'Bedrock.Dim.Clone' ;
cTimeStamp = TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt = NumberToString( INT( RAND( ) * 100000 ));
cDebugFile = GetProcessErrorFileDirectory | cProcess | '.' | cTimeStamp | '.' | sRandomInt ;

cSubset = '}' | cProcess;


### Initialise Debug ###

If( pDebug >= 1 );

  # Set debug file name
  sDebugFile = cDebugFile | 'Prolog.debug';

  # Log start time
  AsciiOutput( sDebugFile, 'Process Started: ' | TimSt( Now, '\d-\m-\Y \h:\i:\s' ) );

  # Log parameters
  AsciiOutput( sDebugFile, 'Parameters: pSourceDim : ' | pSourceDim );
  AsciiOutput( sDebugFile, '            pTargetDim : ' | pTargetDim );
  AsciiOutput( sDebugFile, '            pAttr      : ' | NumberToString( pAttr ) );

EndIf;


### Validate Parameters ###

nErrors = 0;

# Validate source dimension
If( DimensionExists( pSourceDim ) = 0 );
  nErrors = 1;
  sMessage = 'Invalid source dimension: ' | pSourceDim;
  If( pDebug >= 1 );
    AsciiOutput( sDebugFile, sMessage );
  EndIf;
  DataSourceType = 'NULL';
  ItemReject( sMessage );
EndIf;

# Validate target dimension
If( pTargetDim @= '' % pTargetDim @= pSourceDim );
  pTargetDim = pSourceDim | '_Clone';
EndIf;


### Create target dimension ###

If( pDebug <= 1 );
  If( DimensionExists( pTargetDim ) = 0 );
    DimensionCreate( pTargetDim );
  Else;
    DimensionDeleteAllElements( pTargetDim );
  EndIf;
  DimensionSortOrder(pTargetDim, 'ByName', 'Ascending', 'ByHierarchy' , 'Ascending');
EndIf;


### Build Source Subset ###

If( SubsetExists( pSourceDim, cSubset ) = 1 );
  SubsetDeleteAllElements( pSourceDim, cSubset );
Else;
  SubsetCreate( pSourceDim, cSubset );
EndIf;
SubsetIsAllSet( pSourceDim, cSubset, 1 );


### Assign Data Source ###

DatasourceNameForServer = pSourceDim;
DatasourceNameForClient = pSourceDim;
DataSourceType = 'SUBSET';
DatasourceDimensionSubset = cSubset;


### Replicate Attributes ###

# Note: DType on Attr dim returns "AS", "AN" or "AA" need to strip off leading "A"

sAttrDim = '}ElementAttributes_' | pSourceDim;
If( pAttr = 1 & DimensionExists( sAttrDim ) = 1 );
  nNumAttrs = DimSiz( sAttrDim );
  nCount = 1;
  While( nCount <= nNumAttrs );
    sAttrName = DimNm( sAttrDim, nCount );
    sAttrType = SubSt(DType( sAttrDim, sAttrName ), 2, 1 );
      If( pDebug <= 1 );
        AttrInsert( pTargetDim, '', sAttrName, sAttrType );
      EndIf;
    nCount = nCount + 1;
  End;
EndIf;


### End Prolog ###
573,41

#****Begin: Generated Statements***
#****End: Generated Statements****

#####################################################################################
##~~Copyright bedrocktm1.org 2011 www.bedrocktm1.org/how-to-licence.php Ver 2.0.2~~##
#####################################################################################


### Check for errors in prolog ###

If( nErrors <> 0 );
  ProcessBreak;
EndIf;


### Add Elements to cloned dimension ###

If( pDebug <= 1 );

  sElType = DType( pSourceDim, vElement );

  DimensionElementInsert( pTargetDim, '', vElement, sElType );

  IF( sElType @= 'C' & ElCompN( pSourceDim, vElement ) > 0 );
    nChildren = ElCompN( pSourceDim, vElement );
    nCount = 1;
    While( nCount <= nChildren );
      sChildElement = ElComp( pSourceDim, vElement, nCount );
      sChildType = DType( pSourceDim, sChildElement );
      sChildWeight = ElWeight( pSourceDim, vElement, sChildElement );
      DimensionElementInsert( pTargetDim, '', sChildElement, sChildType );
      DimensionElementComponentAdd( pTargetDim, vElement, sChildElement, sChildWeight );
      nCount = nCount + 1;
    End;
  EndIf;

EndIf;


### End MetaData ###
574,48

#****Begin: Generated Statements***
#****End: Generated Statements****

#####################################################################################
##~~Copyright bedrocktm1.org 2011 www.bedrocktm1.org/how-to-licence.php Ver 2.0.2~~##
#####################################################################################


### Check for errors in prolog ###

If( nErrors <> 0 );
  ProcessBreak;
EndIf;


### Replicate Attributes ###

# Note: DTYPE on Attr dim returns "AS", "AN" or "AA" need to strip off leading "A"

If( pDebug <= 1 );

  If( pAttr = 1 & DimensionExists( sAttrDim ) = 1 );

    nCount = 1;
    While( nCount <= nNumAttrs );
      sAttrName = DimNm( sAttrDim, nCount );
      sAttrType = SubSt( DTYPE( sAttrDim, sAttrName ), 2, 1 );
      If( sAttrType @= 'S' % sAttrType @= 'A' );
        sAttrVal = AttrS( pSourceDim, vElement, sAttrName );
        If( sAttrVal @<> '' );
          AttrPutS( sAttrVal, pTargetDim, vElement, sAttrName );
        EndIf;
      Else;
        nAttrVal = AttrN( pSourceDim, vElement, sAttrName );
        If( nAttrVal <> 0 );
          AttrPutN( nAttrVal, pTargetDim, vElement, sAttrName );
        EndIf;
      EndIf;
      nCount = nCount + 1;
    End;

  EndIf;

EndIf;


### End Data ###
575,35

#****Begin: Generated Statements***
#****End: Generated Statements****

#####################################################################################
##~~Copyright bedrocktm1.org 2011 www.bedrocktm1.org/how-to-licence.php Ver 2.0.2~~##
#####################################################################################


### Initialise Debug ###

If( pDebug >= 1 );

  # Set debug file name
  sDebugFile = cDebugFile | 'Epilog.debug';

  # Log errors
  If( nErrors <> 0 );
    AsciiOutput( sDebugFile, 'Errors Occurred' );
  EndIf;

  # Log finish time
  AsciiOutput( sDebugFile, 'Process Finished: ' | TimSt( Now, '\d-\m-\Y \h:\i:\s' ) );

EndIf;


### If errors occurred terminate process with a major error status ###

If( nErrors <> 0 );
  ProcessQuit;
EndIf;


### End Epilog ###
576,CubeAction=1511DataAction=1503CubeLogChanges=0
638,1
804,0
1217,1
900,
901,
902,
903,
906,
929,
907,
908,
904,0
905,0
909,0
911,
912,
913,
914,
915,
916,
917,1
918,1
919,0
920,50000
921,""
922,""
923,0
924,""
925,""
926,""
927,""
