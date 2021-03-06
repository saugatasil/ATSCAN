#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

## GET FUNCTIONS 
require "$Bin/inc/funcs.pl";
our ($dork, $help, $Target, $mmd5, $mencode64, $checkVersion, $data, $uninstall, $toolInfo, $config, $interactive, $repair, $shodan);

## PRINT BANNER 
our ($nobanner, $output, $msource, $bugtraq);
if (!defined $nobanner && !$nobanner) { banner(); }
else{ mtak(); ptak(); }

## CLEAN OUTPUT 
if (defined $output) { unlink $output if -e $output; }
if (defined $msource) {
  $msource=~s/\.(.*)//g;
  unlink $msource if -d $msource; mkdir $msource, 755;
}

## PASS LOGIN ##
our $password;
if ($password) { require "$Bin/inc/functions/log.pl"; }

## NO ARGUMENTS ##
our @NoArg=($dork, $help, $Target, $mmd5, $mencode64, $checkVersion, $data, $bugtraq, $uninstall, $toolInfo, $repair, $config, $interactive, $shodan);
my $NoArg=0;
for (@NoArg) { $NoArg++ if defined $_; }
if ($NoArg < 1) {
  if (!defined $shodan) {
    advise();
  }
}

#########################################################################################################################
## TOOL CONFIGURATION
require "$Bin/inc/functions/clientConf.pl";

## COMMANDE LINE ERRORS 
require "$Bin/inc/errors/useErrors.pl";
## ENGINE
require "$Bin/inc/search/engine.pl";

## DEFINE HTML CMS 
require "$Bin/inc/functions/checkCmsType.pl";

## CHECK IF THERE ANY ERROR IN HTML 
require "$Bin/inc/functions/checkErrors.pl";
## PORTS SCAN PROCESS
require "$Bin/inc/functions/scanPorts.pl";

## ENCODE DECODE SCAN PROCESS 
require "$Bin/inc/functions/encode.pl";

## GET ALL PARAMS TO SCAN 
require "$Bin/inc/functions/makeScan.pl";

## PRINT AND BUILD RESULTS 
require "$Bin/inc/search/print.pl";

## SERACH AND SCANS PROCESS 
require "$Bin/inc/search/process.pl";

## MENU ########
require "$Bin/inc/conf/menu.pl";

1;
