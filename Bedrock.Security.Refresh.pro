﻿601,100
562,"NULL"
586,
585,
564,
565,"rMW6beb1Q]?2xm^:\zaVepFbjB23A6O>xq_2<7[n;]d8n2;IrQvI_[WQXL<VjNM_sxG:eaVkC^@dBFrsFiVrdp8NQMXzfgQ3ho[B@owU8h<DrVmx6\g2B?;`Wynwo5ykSQ4XCUs34KEk=ly^x\>0w3gJA7GF?8?ZvqK2:ztxE`V\[4bde<0]fLwGqF9?rYAsLMQPD;c3"
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
571,
569,0
592,0
599,1000
560,1
pDebug
561,1
1
590,1
pDebug,0.
637,1
pDebug,Debug Mode
577,0
578,0
579,0
580,0
581,0
582,0
572,39

#****Begin: Generated Statements***
#****End: Generated Statements****

#####################################################################################
##~~Copyright bedrocktm1.org 2011 www.bedrocktm1.org/how-to-licence.php Ver 2.0.2~~##
#####################################################################################

# This process refreshes TM1 security


### Constants ###

cProcess = 'Bedrock.Security.Refresh';
cTimeStamp = TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt = NumberToString( INT( RAND( ) * 100000 ));
cDebugFile = GetProcessErrorFileDirectory | cProcess | '.' | cTimeStamp | '.' | sRandomInt ;


### Initialise Debug ###

If( pDebug >= 1 );

  # Set debug file name
  sDebugFile = cDebugFile | 'Prolog.debug';

  # Log start time
  AsciiOutput( sDebugFile, 'Process Started: ' | TimSt( Now, '\d-\m-\Y \h:\i:\s' ) );

EndIf;


### Refresh Security ###
If( pDebug <= 1 );
  SecurityRefresh;
EndIf;


### End Prolog ###
573,4

#****Begin: Generated Statements***
#****End: Generated Statements****

574,4

#****Begin: Generated Statements***
#****End: Generated Statements****

575,23

#****Begin: Generated Statements***
#****End: Generated Statements****

#####################################################################################
##~~Copyright bedrocktm1.org 2011 www.bedrocktm1.org/how-to-licence.php Ver 2.0.2~~##
#####################################################################################


### Initialise Debug ###

If( pDebug >= 1 );

  # Set debug file name
  sDebugFile = cDebugFile | 'Epilog.debug';

  # Log finish time
  AsciiOutput( sDebugFile, 'Process Finished: ' | TimSt( Now, '\d-\m-\Y \h:\i:\s' ) );

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
