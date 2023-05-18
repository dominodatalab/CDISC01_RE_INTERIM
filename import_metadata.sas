/*****************************************************************************\
*  ____                  _
* |  _ \  ___  _ __ ___ (_)_ __   ___
* | | | |/ _ \| '_ ` _ \| | '_ \ / _ \
* | |_| | (_) | | | | | | | | | | (_) |
* |____/ \___/|_| |_| |_|_|_| |_|\___/                                               
* ____________________________________________________________________________
* Sponsor              : Domino
* Study                : CDISC01
* Program              : import_metadata.sas
* Purpose              : Import External NFS TFL_Metadata to Domino Dataset
* ____________________________________________________________________________
* DESCRIPTION                                                    
*                                                                   
* Input files: TFL_Metadata.xlsx
*              
* Output files: tfl.sas7bdat
*               
* Macros:       None
*         
* Assumptions: 
*
* ____________________________________________________________________________
* PROGRAM HISTORY                                   
*  18MAY2023  | Megan Harries  | Original
* ----------------------------------------------------------------------------
\*****************************************************************************/

proc printto
	log = "/mnt/artifacts/results/metadata.sas";
run;

proc import out = metadata.tfl
			datafile = "/mnt/pvc-rev4-nfs/TFL_Metadata.xlsx"
			dbms = xlsx replace;
	sheet = "Display";
	getnames = YES;
run;

