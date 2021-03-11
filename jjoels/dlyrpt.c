#include <stdio.h>
#include <query.h>
#include <vista.h>
#include "delay.h"
#include <pdefs.h>
#include <math.h>
#include "delaydb.h"

#define MAXRANGE 10
#define MAXPCS 3
#define OTHER 11
#define PRINTER 1
#define DISK 2
#define BOTH 3
#define MAXQSTMT 200
#define MAXROW 200

extern DELAY_DESIGN_PARM d_parms;

static int ranges[11][2] = {
    {1,100}, {101,200}, {201,300}, {301,400}, {401,500} , {501,600} ,
    {601,700} , {701,800} , {801,900} , {901,1000} };

struct delay_struct{
        int count;
        long delay;
        float freq;
        float mean;
        }; 

struct pc_struct{
        int percentile;
        long record_number;
        int delay;
        };
            
int dly_rpt()

{
FILE *outid, *fopen();
char out_name[13];
int status, epos, numchr;
char *emsg;
static char stmt[MAXQSTMT];
long date,node,delay;
int time, i, j;
char row[MAXROW];
struct delay_struct matrix[MAXRANGE+1];
struct pc_struct pc[MAXPCS];
int total_circuits = 0;
long total_delay = 0;
int range;
int rval, key, prt_key;
long c_date;
int c_time;
double dev, sumdev = 0, sd;
int tmppc[MAXPCS], pcmin = 100, pcmax = 0, pcmid = 0;
float one_pc;
long record_count;

extern char survey_name[];
extern int out_type;

long mindate = 999999l;
long maxdate = 0l;
int mindelay = 9999;
int maxdelay = 0;
float avgdelay = 0, comfreq = 0;
int  initt = 0;
int  last = 0;
int numrec = 0;


/* Init the matrix arrays */
for ( i = 0; i < MAXRANGE+1; i++)
    {
    matrix[i].count = 0;
    matrix[i].delay = 0;
    matrix[i].freq = 0;
    matrix[i].mean = 0;
    }



outid = NULL;
printf("\n\n\tWorking...\n");

/* If output is to the disk, build the output file name and open the file */
if ( out_type == DISK || out_type == BOTH)
    {
    sprintf(out_name,"%s.DLY",survey_name);
    /*
    ** Open the output file 
    */
    if ( ( outid = fopen(out_name,"w") ) == NULL )
         {
         /*
         ** Unable to open file. Return to calling function
         */
         printf("\n\t Unable to open: %s for writting.  Aborting job.\n");
         return(FAILURE);
         }
    }

/* Get the current date */
rval = get_time(&c_date,&c_time);

/* Request the circuit information */
numchr = sprintf(stmt,"select node,cdate,");
numchr += sprintf(stmt+numchr,"delay ");
numchr += sprintf(stmt+numchr,"from qtodata where ");
numchr += sprintf(stmt+numchr,"cdate > 0 ");
numchr += sprintf(stmt+numchr,"and survey_name = \"%s\";",survey_name);
if (numchr > MAXQSTMT)
    {
    printf("\n\t Exceeded the max size of a QUERY statment.");
    return(FAILURE);
    }
status = d_query(stmt,&epos,&emsg);

/* Go through the circuit information a line at a time */
while (!last)
    {
    /* Get a line. */
    /* If another line is not availiable set the last flag to terminate */
    /* this loop                                                        */
    if  (q_nextrow(row) != Q_OKAY)
      {
      last = 1;
      }
    else
      {
      /* Get the values of the fields */
      sscanf(row,"%ld %ld %ld",&node,&date,&delay);
/*      printf("\n%ld %ld %ld",node,date,delay);*/

      /* Check if this is a valid field */
      if (delay != 0)
        {
        /* This is a valid record. Increment the record counter */
        numrec++;

        /* Add the interface delays to the node-to-node delay
        ** which is in the record.
        */
        delay = delay + d_parms.ti_delay + d_parms.hi_delay;

        /* Check if this date is the min or max date of snap */
        if ( date > 0 )
           {
           if ( date < mindate) mindate = date;
           if ( date > maxdate) maxdate = date;
           }

        /* Check if this delay is the min or max delay */
        if ( delay > 0 )
           {
           if ( delay < mindelay) mindelay = delay;
           if ( delay > maxdelay) maxdelay = delay;
           }

        /*
        ** Now find the proper range for this delay
        */
        for (range = 0; range < MAXRANGE; range++)
           {
           if ( delay >= ranges[range][0] && delay <= ranges[range][1] )
                break;
           }


        /*
        ** Increment the appropriate elements
        */
        if (!rval)
           {
           matrix[range].count++;
           total_circuits++;
           matrix[range].delay +=delay;
           total_delay +=delay;
           }
       
        }  /* End of if(delay>0) */
      }  /* End of else */

    /* Go read next line of circuit information */
    }  /* End of while (!last) */


/*
** Finished reading all circuit information.
** Check if there is anything to report.
*/
if (numrec == 0)
        {
        /* There is nothing to report */
        vidclr();
        printf("\n\tThere is no infomation for this survey in the");
        printf(" Delay data bases.");
        printf("\n                   ....Press any character to continue....\n");
        key = kbnec();
        if ( out_type == DISK || out_type == BOTH)
           fclose(outid);
        return(SUCCESS);
        }
/*
** Calculate the frequency that each range ocurred and the mean delay
** for each range.
*/

for (range = 0;  range < MAXRANGE+1; range++)
    {
     /* Insure a non-zero element */
     if (matrix[range].count != 0 )
        {
         /*
         ** Calculate frequency.
         */
         matrix[range].freq = comfreq + (100. * 
                  ( (1.*(matrix[range].count)) / (1.*(total_circuits)) ));
         comfreq = matrix[range].freq; 
        }
     else
        {
        /*
        ** There are no circuits in this range.  Therefore, the frequency
        ** will be the same as for the previous range, unless this is the
        ** first range.  If this is the first range the cumulative freq.
        ** will be zero.
        */
        if ( range != 0)
                matrix[range].freq = matrix[range-1].freq;
        }

     /* Calculate the mean delay */
     if ( matrix[range].delay != 0 )
          matrix[range].mean = ( (1. * matrix[range].delay) /
                        ( 1. * matrix[range].count ) );
    }

/* Calculate the survey wide average delay */
avgdelay = ( (1.*total_delay) / (1.*total_circuits) );


/* Place the three user defined percentiles into the percentile array
** in ascending order.
*/
tmppc[0] = d_parms.ddp1;
tmppc[1] = d_parms.ddp2;
tmppc[2] = d_parms.ddp3;

for ( i = 0; i < MAXPCS; i++)
        {
        if ( tmppc[i] < pcmin )
                pcmin = tmppc[i];
        if ( tmppc[i] > pcmax )
                pcmax = tmppc[i];
        }
for ( i = 0; i < MAXPCS; i++)
        {
        if ( tmppc[i] != pcmin && tmppc[i] != pcmax )
                pcmid = tmppc[i];
        }
pc[0].percentile = pcmin;
pc[1].percentile = pcmid;
pc[2].percentile = pcmax;

/* From the total number of records, find the number of records in one
** percentile.
*/
one_pc = (total_circuits*1.)/100.;


/* Now find the record_number for each user defined percentile.
** To do this just multiply the user defined percentile times the
** number of records for one percentile.
*/
for ( i = 0; i < MAXPCS; i++)
     {
     pc[i].record_number = (long) floor( (double) (pc[i].percentile * one_pc) );
     }


/*
** Now it is time to compute the Standard Deviation and the 3 user
** defined percentiles.  To do this
** it is necessary to go through the circuit information one more time.
** Request the circuit information sorted by delay in ascending order.
*/
/* Request the circuit information */
numchr = sprintf(stmt,"select node,cdate,");
numchr += sprintf(stmt+numchr,"delay ");
numchr += sprintf(stmt+numchr,"from qtodata where ");
numchr += sprintf(stmt+numchr,"cdate > 0 ");
numchr += sprintf(stmt+numchr,"and survey_name = \"%s\"",survey_name);
numchr += sprintf(stmt+numchr," order by delay;");
if (numchr > MAXQSTMT)
    {
    printf("\n\t Exceeded the max size of a QUERY statment.");
    return(FAILURE);
    }
status = d_query(stmt,&epos,&emsg);
last = 0;
record_count = 0;

/* Go through the circuit information a line at a time */
while (!last)
    {
    /* Get a line. */
    /* If another line is not availiable set the last flag to terminate */
    /* this loop                                                        */
    if  (q_nextrow(row) != Q_OKAY)
      {
      last = 1;
      }
    else
      {
      /* Get the values of the fields and increment the record count. */
      sscanf(row,"%ld %ld %ld",&node,&date,&delay);
      record_count++;

      /* Add  the interface delays to the node-to-node round trip
      ** delay which is in the record.
      */
      delay = delay + d_parms.hi_delay + d_parms.ti_delay;

      /* Check if this record number matches one of those for the
      ** three percentiles being tested for.  If so save this delay
      ** with its associated percentile.
      */
      for ( i = 0; i < MAXPCS; i++)
        {
        if ( record_count == pc[i].record_number )
                pc[i].delay = delay;
        }
         
      /* Determine the deviation of this delay value from the mean delay */
      dev = avgdelay - delay;
        
      /*
      ** Now sqare this deviation to nullify the effect of a possible
      ** negative deviation.
      */
      dev = pow(dev,(double)2);

      /* Sum all of the deviations. */
      sumdev += dev;

      }  /* End of else */
    } /* End of while(!last) */

/* Now divide the Sum of the Deviations by the number of circuits */
/* to get the mean deviation.                                     */
sumdev = sumdev/total_circuits;

/* Finally, take the square root of the above number to get the  */
/* Standard Deviation.                                           */
sd = sqrt(sumdev);

/* Output the report */
if ( out_type == DISK || out_type == BOTH)
    dly_rout(outid,c_date,mindate,maxdate,matrix,mindelay,maxdelay,avgdelay,
             total_circuits,sd,pc);
if ( out_type == PRINTER || out_type == BOTH)
    {
     vidclr();
     printf("\n\n\n                           MAKE SURE PRINTER IS ON");
     printf("\n                                     AND");
     printf("\n                                ALLIGN PAPER\n\n");
     printf("\n                   ....Press any character to continue....\n");
     key = kbnec();
     dly_rout(stdprn,c_date,mindate,maxdate,matrix,mindelay,maxdelay,avgdelay,
             total_circuits,sd);
    }

/*
** Fill out the page with blank lines.
*/
   if ( out_type == DISK || out_type == BOTH)
        endpage(outid,41,66);
   if ( out_type == PRINTER || out_type == BOTH)
        endpage(stdprn,41,66);

/* If Output was to the disk, close the file and tell user the file name */
if ( out_type == DISK || out_type == BOTH)
    {
    fclose(outid);
    vidclr();
    printf("\n\n\t Delay Performance Report has been written to file: %s\n",
         out_name);
    printf("\n\t\t Enter any character to continue.....");
    key = kbnec();
    }

/* If Output was to the printer, flush the print buffer */
if ( out_type == PRINTER || out_type == BOTH) 
    {
    fflush(stdprn);
    }
/* Return to calling function */
return(SUCCESS);
}

int dly_rout(outdev,c_date,mindate,maxdate,matrix,mindelay,maxdelay,avgdelay,
             total_circuits,sd,pc)
FILE *outdev;
long c_date,mindate,maxdate;
struct delay_struct matrix[MAXRANGE+1];
struct pc_struct pc[MAXPCS];
int mindelay,maxdelay,total_circuits;
float avgdelay;
double sd;

{
int range, i;
extern char survey_name[];

/* First output the header */
fprintf(outdev,"\n\n****************************************");
fprintf(outdev,"****************************************"); 
fprintf(outdev,"\n\n                                B T   T Y M N E T\n");
fprintf(outdev,"\n****************************************");
fprintf(outdev,"****************************************"); 
fprintf(outdev,"\n\n                 D E L A Y   P E R F O R M A N C E   ");
fprintf(outdev," R E P O R T\n");
fprintf(outdev,"\n                                SURVEY: %s",survey_name);
fprintf(outdev,"\n REPORT DATE: %6ld\t\t\t\t           R-T INTERFACE DELAYS",
                    c_date);
fprintf(outdev,"\n-SAMPLES TAKEN BETWEEN-     \t\t\t\t\tHOST: %4d msec\n",
                    d_parms.hi_delay);
fprintf(outdev,"   %ld and %ld\t\t\t\t\t    TERMINAL: %4d msec\n\n",
                   mindate,maxdate,d_parms.ti_delay);
fprintf(outdev,"\n\n          RANGE           NUMBER         CUMULATIVE %% ");
fprintf(outdev,"      MEAN OF RANGE\n");
fprintf(outdev,"     R-T DELAY [ms]     OF CIRCUITS     OF ALL CIRCUITS");
fprintf(outdev,"     R-T DELAY [ms]\n");
fprintf(outdev,"     --------------     -----------     ---------------");
fprintf(outdev,"     --------------\n");

/* Output the counts and frequencies */   

for (range = 0;  range < MAXRANGE; range++)
    {
    if (ranges[range][1] < 999)
       fprintf(outdev,"         %3d-%3d  ",ranges[range][0],ranges[range][1]);
    else
       fprintf(outdev,"        %3d-%4d  ",ranges[range][0],ranges[range][1]);
    fprintf(outdev,"         %5d             %3.0f                %5.0f\n",
            matrix[range].count,matrix[range].freq,matrix[range].mean);
    }
    fprintf(outdev,"       Over 1000  ",ranges[range][0],ranges[range][1]);
    fprintf(outdev,"         %5d             %3.0f                %5.0f\n",
            matrix[MAXRANGE].count,matrix[MAXRANGE].freq,matrix[MAXRANGE].mean);

/* Output the totals */
fprintf(outdev,"                        -----------\n");
fprintf(outdev,"                  Total:   %5d\n",total_circuits);
fprintf(outdev,"\n\n                              R-T DELAY STATISTICS\n");
fprintf(outdev,"                                For All Circuits\n");
fprintf(outdev,"\n                              MEAN:      %5.0f ms\n",avgdelay);
fprintf(outdev,"                               LOW:      %5d ms\n",mindelay);
fprintf(outdev,"                              HIGH:      %5d ms\n",maxdelay);
for ( i = 0; i < MAXPCS; i++)
   fprintf(outdev,"                     %2d-PERCENTILE:      %5d ms\n",
                                               pc[i].percentile,pc[i].delay);
fprintf(outdev,"                STANDARD DEVIATION:    %7.0f ms\n",sd); 

return(SUCCESS);

}

int sum_rpt()

{
FILE *fiddsr, *fidssr, *fidtmp, *fopen();
void dsr_header(), dsr_out(), get_dr();
char dsr_name[13], ssr_name[13], tmp_name[13];
int status, epos, numchr;
char *emsg;
static char stmt[MAXQSTMT];
long node;
int  i, j;
char row[MAXROW];
int t_delay = 0, delay;
int rval, key;
long c_date;
int c_time;
double dev, sumdev = 0, sd;
char applied_flag[9];
char forcast_flag, reliability_flag;
char filter_flag;
char loc_type[LOCTYPE_SIZE];

extern char survey_name[];
extern int out_type;
struct location loc, cloc;

long mindate = 0;
long maxdate = 0;
int mindelay = 9999;
int maxdelay = 0;
int survey_mindelay = 999;
int survey_maxdelay = 0;
float survey_mean = 0;
float loc_mean = 0;
float total_weight = 0;
int num_bad_locations = 0, num_good_locations = 0;
long num_bad_loc_samples = 0,num_good_loc_samples = 0 ;
long num_loc_samples = 0;
long loc_delay = 0;

int  initt = 0;
int  last = 0;
int  first = YES;
int numrec = 0;

int dline = 1;
int page = 1;
int pline = 1;
int maxline = 66;
int endline = 63;


fiddsr = NULL;
fidssr = NULL;
fidtmp = NULL;

strcpy(applied_flag,"have not");
printf("\n\tPlease Wait...");

/* If output is to the disk, build the output file names and open the files */
if ( out_type == DISK || out_type == BOTH)
    {
    sprintf(dsr_name,"%s.DSR",survey_name);
    sprintf(ssr_name,"%s.SSR",survey_name);

    /*
    ** Open the Delay Summary output file 
    */
    if ( ( fiddsr = fopen(dsr_name,"w") ) == NULL )
         {
         /*
         ** Unable to open file. Return to calling function
         */
         printf("\n\t Unable to open: %s for writting.  Aborting job.\n",
                   dsr_name);
         return(FAILURE);
         }
    /*
    ** Open the SURVEY Summary output file 
    */
    if ( ( fidssr = fopen(ssr_name,"w") ) == NULL )
         {
         /*
         ** Unable to open file. Return to calling function
         */
         printf("\n\t Unable to open: %s for writting.  Aborting job.\n",
                   ssr_name);
         return(FAILURE);
         }
    }

/* In order to compute the standard deviation from the mean for each
** location, we must have all of the delays available after the mean
** has been computed for the location.  To keep from having to go
** through the delay data from the data base a second time, the delays
** will be written to a temporary file, and then read from there
** when it is time to compute the standard deviation for the location.
*/
sprintf(tmp_name,"%s.TMP",survey_name);

/*
** Open the temporary output file 
*/
if ( ( fidtmp = fopen(tmp_name,"w") ) == NULL )
     {
     /*
     ** Unable to open file. Return to calling function
     */
     printf("\n\t Unable to open: %s for writting.  Aborting job.\n",
               tmp_name);
     return(FAILURE);
     }

/* Get the current date */
rval = get_time(&c_date,&c_time);

/* Get control of the output */
status = d_query("set output = null;",&epos,&emsg);

/* Get the date range of the survey */
get_dr(&mindate,&maxdate);

/* Get the location type from the user.  The summary reports will be
** generated for only one location type at a time.
*/
rval = ltype_sel(loc_type,stmt);
if (rval != SUCCESS)
        return(rval);

/* If the user supplied weighting factors are to be applied to
** the survy_wide mean, then sum the weighting factors at this
** point to make sure that they total 100%.
** ------------------------------------------------------------ */
if (d_parms.apply_weight[0] == 'Y' )
        {
        rval = ck_weight(loc_type);
        if (rval == FAILURE)
                return(FAILURE);
        }

/* Issue select command */
status = d_query(stmt,&epos,&emsg);

/* Go through theuit information a line at a time */
while (!last)
    {
    /* Get a line. */
    /* If another line is not availiable set the last flag to terminate */
    /* this loop                                                        */
    if  (q_nextrow(row) != Q_OKAY)
      {
      last = 1;
      }
    else
      {
      /* Get the values of the fields */
      sscanf(row,"%s %s %s %f %d %d %ld %d",loc.lid.city,loc.lid.state,
              loc.loc_id,&loc.weight_factor,&loc.forcast_delay,
              &loc.delay_threshold,&node,&delay);
      /*printf("\n%s %s %s %f %d %d %ld %d",loc.lid.city,loc.lid.state,
              loc.loc_id,loc.weight_factor,loc.forcast_delay,
              loc.delay_threshold,node,delay);*/

      /* If this is the first record set the current city and state
      ** to the city and state in the first record.
      */
      if ( first == YES)
        {
        strcpy( cloc.lid.city,loc.lid.city);
        strcpy( cloc.lid.state,loc.lid.state);
        strcpy( cloc.loc_id,loc.loc_id);
        cloc.weight_factor = loc.weight_factor;
        cloc.forcast_delay = loc.forcast_delay;
        first = NO;
        }

      /* If this is a not a valid value for delay, go get next record. */
      if (delay <= 0)
                break;

      /* This is a good delay value. Increment the number of valid records */
        numrec++;

      /* Add the interface delays to the node-to-node delay
      ** which is in the record.
      */
      delay = delay + d_parms.ti_delay + d_parms.hi_delay;

      } /* End of else ( all records have not been processed ) */

      /* Check if the location has changed or have reached the last 
      ** record. */
      if ( !(strcmp( cloc.lid.city,loc.lid.city)) && 
             !(strcmp( cloc.lid.state,loc.lid.state )) && !last )
           {
           /* Location has not changed, just process the record */
           rval = process_rec( fidtmp, delay, &num_loc_samples,
                  &loc_delay, &mindelay, &maxdelay );
           if (rval != SUCCESS)
                return(rval);
           }
        else
           {
           /* Location has changed ( or the last record has been read).
           ** Time to compute location statistics and output location
           ** information to the Delay Summary Report.  First close
           ** the temporary file containing the delays for all records
           ** for the previous location.
           ** ---------------------------------------------------*/
           fclose(fidtmp);

           /* Make sure that there are some samples for this location. */
           if ( num_loc_samples > 0 )
             {
             /* All computations are for the previous location.
             ** Compute the mean delay.
             ** --------------------------------------------------- */
             loc_mean = (loc_delay*1.) / (num_loc_samples*1.);

             /* Check if the mean exceeds the forcasted delay.
             ** If so set the forcast flag appropriately.
             ** --------------------------------------------------- */
             forcast_flag = ' ';
             if ( loc_mean > cloc.forcast_delay )
                forcast_flag = '!';

             /* If a location has only a few samples the statistics for
             ** the location may be unreliable.  A minumum number
             ** of samples has been hardcoded.  Use this number to set
             ** the reliablity flag.
             ** ------------------------------------------------------- */
             reliability_flag = ' ';
             if ( num_loc_samples < MIN_SAMPLES )
                  reliability_flag = '&';

             /* The user can specifiy a minimum number of samples which
             ** he requires that all locations have.  If a location falls
             ** below this minimum the location is flagged in the Delay
             ** Summary Report and the location is NOT included in the
             ** Survey-wide statistics.
             ** This user defined minimum number of samples is called
             ** the Sample Filter Size.  Check if the current location
             ** meets this minumum.
             */
             if ( num_loc_samples < d_parms.ss_filter )
                {
                /* This location does NOT meet the minimum.  Set the
                ** filter flag accordingly.  Then increment the number of
                ** unacceptable ( BAD ) locations and add the number
                ** of samples for the BAD location to the number of
                ** BAD location samples.
                ** -----------------------------------------------------*/
                filter_flag = '*';
                num_bad_locations++;
                num_bad_loc_samples += num_loc_samples;
                }
             else
                {
                /* This location DOES meet the minimum. Set the
                ** filter flag accordingly.  Then increment the number of
                ** acceptable ( GOOD ) locations and add the number
                ** of samples for the GOOD location to the number of
                ** GOOD location samples.
                ** -----------------------------------------------------*/
                filter_flag = ' ';
                num_good_locations++;
                num_good_loc_samples += num_loc_samples;

                /* Check if this loction's min or max delay is the
                ** min or max for the whole survey, so far.
                ** ---------------------------------------------------- */
                if ( mindelay < survey_mindelay) survey_mindelay = mindelay;
                if ( maxdelay > survey_maxdelay) survey_maxdelay = maxdelay;

                /* Check if the weighting factor is to be applied when
                ** computing the survey-wide mean.
                ** --------------------------------------------------------*/
                if ( d_parms.apply_weight[0] == 'Y')
                   { 
                   /* The weighting factor is to be applied, so multiply
                   ** the location mean * the weight_factor and then add
                   ** this to the accumulating survey_mean.
                   ** Also, set the applied flag to indicate that the
                   ** weighting factors HAVE been applied.
                   ** -------------------------------------------------- */
                   if (cloc.weight_factor != 0 )
                      survey_mean += loc_mean * (cloc.weight_factor/100.);
                   else
                      survey_mean += loc_mean;
                   strcpy(applied_flag,"have");

                   /* Accumulate the weight_factors.  Some of the locations
                   ** may be left out of the calculation of the survey_
                   ** wide mean because they do not have enough samples.
                   ** Their being left out will affect the mean.  This
                   ** effect will be reduced by using the accumulated
                   ** weight factors to standardize the mean.
                   ** --------------------------------------------------- */
                   total_weight += cloc.weight_factor;
   
                   }
                else
                   {
                   /* The weighting factor is not being applied, so the
                   ** mean needs to be weighted by the number of samples
                   ** in the location before it is used to compute the
                   ** survey_mean.
                   ** Also, set the applied flag to indicate that the
                   ** weighting facotrs HAVE NOT been applied.
                   ** --------------------------------------------------- */
                   survey_mean += loc_mean * num_loc_samples;
                   strcpy(applied_flag,"have not");
                   total_weight = 100.0;

                   }


                } /* End of else ( loctaion is GOOD ) */

             /* Now, open the temporary file and proceed to compute the
             ** standard deviaton from the location mean.
             ** ------------------------------------------------------ */
             if ( ( fidtmp = fopen(tmp_name,"r") ) == NULL )
               {
               /*
               ** Unable to open file. Return to calling function
               */
               printf("\n\t Unable to open: %s for reading.  Aborting job.\n",
                         tmp_name);
               return(FAILURE);
               }

             /* Read through the file */
             rval = 1;
             sumdev = 0;
             while ( rval > 0 )
               {
               /* Read a delay value from the file */
               rval = fscanf(fidtmp,"%d",&t_delay);
               if ( rval < 0 ) break;
         
               /* Determine the deviation of this delay value from
               **  the mean delay */
               dev = loc_mean - t_delay;
         
               /*
               ** Now sqare this deviation to nullify the effect of a possible
               ** negative deviation.
               */
               dev = pow(dev,(double)2);

               /* Sum the squares of all of the deviations. */
               sumdev += dev;

               }  /* End of while ( have any more records in the file) */

             /* End of records in temporary file. Close it */
             fclose(fidtmp);

             /* Now divide the Sum of the Deviations by the number of samples */
             /* to get the mean deviation.                                    */
             if (num_loc_samples > 0 )
                sumdev = sumdev/(num_loc_samples*1.);
             else
                sumdev = 0; 

             /* Finally, take the square root of the above number to get the  */
             /* Standard Deviation.                                           */
             sd = sqrt(sumdev);

             /* Output the information on this location to the Delay Summary
             ** Report.
             ** -------------------------------------------------------------- */
             if ( out_type == DISK || out_type == BOTH)
              {
              /* Check if this is the beginning of a new page, 
              ** if so output header */
              if ( dline == 1 )
                 dsr_header(fiddsr,c_date,page,&dline,mindate,maxdate,loc_type);

              /* Output the line of information on the current location */
              dsr_out(fiddsr,&dline,cloc,num_loc_samples,mindelay,maxdelay,
                      loc_mean,sd,filter_flag,reliability_flag,
                      forcast_flag);
              }

             if ( out_type == PRINTER || out_type == BOTH)
              {
              if ( page == 1 && pline == 1 )
                {
                vidclr();
                printf("\n\n\n                           MAKE SURE PRINTER IS ON");
                printf("\n                                     AND");
                printf("\n                                ALLIGN PAPER\n\n");
                printf("\n                   ....Press any character to continue....\n");
                key = kbnec();
                }
              /* Check if this is the beginning of a new page, 
              ** if so output header */
              if ( pline == 1 )
                 dsr_header(stdprn,c_date,page,&pline,mindate,maxdate,loc_type);

              /* Output the line of information on the current location */
              dsr_out(stdprn,&pline,cloc,num_loc_samples,mindelay,maxdelay,
                      loc_mean,sd,filter_flag,reliability_flag,
                      forcast_flag);
              }

             /* If the line count is over the max number
             ** of lines on a page, increment the page count and set line number
             ** to one. Then output enough blank lines to fill out the page.
             */
             if ( pline >= endline || dline >= endline)
              {
              if ( out_type == DISK || out_type == BOTH)
                   endpage(fiddsr,dline-1,maxline);
              if ( out_type == PRINTER || out_type == BOTH)
                   endpage(stdprn,pline-1,maxline);
              page += 1;
              pline = 1;
              dline = 1;
              }

             /* Finished with the previous location.  Reset all location
             ** variables.
             ------------------------------------------------------------ */
             mindelay = 9999;
             maxdelay = 0;
             num_loc_samples = 0;
             loc_delay = 0;
       
             /* Set the current city and state to the city and state of
             ** the new location.
             ----------------------------------------------------------- */
             strcpy( cloc.lid.city,loc.lid.city);
             strcpy( cloc.lid.state,loc.lid.state);
             strcpy( cloc.loc_id,loc.loc_id);
             cloc.weight_factor = loc.weight_factor;
             cloc.forcast_delay = loc.forcast_delay;

             } /* End of if ( there were any samples for the location) */ 

           /* If the last record has not been processed yet......  */
           if ( !last )
            {
             /* Process the first record of the new location, which has
             ** already been read.
             ---------------------------------------------------------- */
             process_rec(fidtmp,delay,&num_loc_samples,&loc_delay,
                       &mindelay,&maxdelay);

             /* Now, open the temporary file for writting again. So that
             ** the new location's delays can be written to it.
             ** ------------------------------------------------------ */
             if ( ( fidtmp = fopen(tmp_name,"w") ) == NULL )
               {
               /*
               ** Unable to open file. Return to calling function
               */
               printf("\n\t Unable to open: %s for reading.  Aborting job.\n",
                         tmp_name);
               return(FAILURE);
               }
            } /* End of if ( not last record ) */
           } /* End of else (location has changed or last record reached) */

    /* Go read next line of circuit information */
    }  /* End of while (!last) */


/*
** Finished reading all circuit information.
** Check if there is anything to report.
*/
if (numrec == 0)
        {
        /* There is nothing to report */
        vidclr();
        printf("\n\t\tThere is no information for survey: %s with \n",survey_name);
        printf("\t\tlocation type: %s in the Delay data bases.\n",loc_type);
        printf("\n\n\n                   ....Press any character to continue....\n");
        key = kbnec();
        if ( out_type == DISK || out_type == BOTH)
           {
           fclose(fiddsr);
           fclose(fidssr);
           }
        return(SUCCESS);
        }

/*
** The last record has been processed, so fill out the last page 
** with blank lines.
*/
if (last && numrec !=0)
   {
   if ( out_type == DISK || out_type == BOTH)
        endpage(fiddsr,dline-1,maxline);
   if ( out_type == PRINTER || out_type == BOTH)
        endpage(stdprn,pline-1,maxline);
   }

/* If Output was to the disk, close the file. */
if ( (out_type == DISK || out_type == BOTH) && numrec != 0 )
    {
    fclose(fiddsr);
    }
/* If Output was to the printer, flush the print buffer */
if ( (out_type == PRINTER || out_type == BOTH) && numrec != 0 )
    {
    fflush(stdprn);
    }

/* Finished with the first report. Calculate the survey_wide mean delay
** for the Survey-wide report.
** If the user supplied weighting factors were applied.  Then
** at this point the mean needs to be standardized because
** some of the locations were BAD and their means were not included
** in the survey_wide mean.
** Otherwise, the value accumulated in the mean variable needs
** to be divided by the total number of GOOD samples.
-----------------------------------------------------------------*/
if ( d_parms.apply_weight[0] == 'N')
        {
        /* The user supplied weighting factors were not applied.
        ** so.....
        -------------------------------------------------------- */
        if ( num_good_loc_samples > 0 )
           survey_mean = survey_mean/(num_good_loc_samples*1.);
        else
           survey_mean = 0;
        }
else
        {
        /* The user supplied weighting factors were applied.
        ** Standardize the mean using the accumulated weighting factors.
        ** ------------------------------------------------------------- */
        if (total_weight != 0 )
            survey_mean = survey_mean/(total_weight/100.);
        }

/* In case there were no GOOD locations, zero out the survey statistics. */
if ( survey_mean == 0 )
        {
        survey_mindelay = 0;
        survey_maxdelay = 0;
        }

/* Output the Survey_wide report */
if ( out_type == DISK || out_type == BOTH)
    ssr_rout(fidssr,c_date,mindate,maxdate,survey_mindelay,survey_maxdelay,
             survey_mean,num_good_locations,num_good_loc_samples,
             num_bad_locations,num_bad_loc_samples,applied_flag,
             loc_type);

if ( out_type == PRINTER || out_type == BOTH)
    {
     vidclr();
     printf("\n\n\n                           MAKE SURE PRINTER IS ON");
     printf("\n                                     AND");
     printf("\n                                ALLIGN PAPER\n\n");
     printf("\n                   ....Press any character to continue....\n");
     key = kbnec();
     ssr_rout(stdprn,c_date,mindate,maxdate,survey_mindelay,survey_maxdelay,
             survey_mean,num_good_locations,num_good_loc_samples,
             num_bad_locations,num_bad_loc_samples,applied_flag,
             loc_type);
    }

/*
** Fill out the page with blank lines.
*/
   if ( out_type == DISK || out_type == BOTH)
        endpage(fidssr,49,66);
   if ( out_type == PRINTER || out_type == BOTH)
        endpage(stdprn,49,66);

/* If Output was to the disk, close the file and tell user the file names */
if ( out_type == DISK || out_type == BOTH)
    {
    fclose(fidssr);
    vidclr();
    printf("\n\n\t Delay Summary Report has been written to file: %s\n",
         dsr_name);
    printf("\n\n\t Survey Summary Report has been written to file: %s\n",
         ssr_name);
    printf("\n\t\t Enter any character to continue.....");
    key = kbnec();
    }

/* If Output was to the printer, flush the print buffer */
if ( out_type == PRINTER || out_type == BOTH) 
    {
    fflush(stdprn);
    }
/* Return to calling function */
return(SUCCESS);
}

int ssr_rout(outdev,c_date,mindate,maxdate,mindelay,maxdelay,avgdelay,
             num_good_locations, num_good_loc_samples,num_bad_locations,
             num_bad_loc_samples, applied_flag, loc_type)
FILE *outdev;
long c_date,mindate,maxdate;
int mindelay,maxdelay;
float avgdelay;
int num_good_locations, num_bad_locations;
long num_good_loc_samples, num_bad_loc_samples;
char applied_flag[], loc_type[];

{
extern char survey_name[];
int total_locations = 0;
long total_samples = 0;

total_locations = num_good_locations + num_bad_locations;
total_samples = num_good_loc_samples + num_bad_loc_samples;

/* First output the header */
fprintf(outdev,"\n\n****************************************");
fprintf(outdev,"****************************************"); 
fprintf(outdev,"\n\n                               B T   T Y M N E T\n");
fprintf(outdev,"\n****************************************");
fprintf(outdev,"****************************************"); 
fprintf(outdev,"\n\n                          S U R V E Y   S U M M A R Y  \n");
fprintf(outdev,"                               By %s Location\n",
                             loc_type);
fprintf(outdev,"\n                                SURVEY: %s",survey_name);
fprintf(outdev,"\n                             SAMPLE SIZE FILTER: %d",
                             d_parms.ss_filter);
fprintf(outdev,"\n REPORT DATE: %6ld\t\t\t\t           R-T INTERFACE DELAYS",
                           c_date);
fprintf(outdev,"\n-SAMPLES TAKEN BETWEEN-     \t\t\t\t\tHOST: %4d msec\n",
                    d_parms.hi_delay);
fprintf(outdev,"   %ld and %ld\t\t\t\t\t    TERMINAL: %4d msec\n\n",
                   mindate,maxdate,d_parms.ti_delay);
fprintf(outdev,"NOTE: Delays from any location with an insufficient ");
fprintf(outdev,"number of samples\n      are excluded from the calculations");
fprintf(outdev," of the delay statistics in this\n      report.  A location");
fprintf(outdev," is considered to have an insufficient number\n      of");
fprintf(outdev," samples if it has less than the value of the SAMPLE SIZE");
fprintf(outdev," FILTER.\n\n\n\n");
fprintf(outdev,"\t\t\t\t   SURVEY DETAILS\n\t\t\t\t   --------------\n\n");
fprintf(outdev,"\t NUMBER OF LOCATIONS WITH SUFFICIENT SAMPLES:     %5d\n",
                 num_good_locations);
fprintf(outdev,"\t\tNUMBER OF SAMPLES FOR THOSE LOCATIONS:          %5ld\n",
                 num_good_loc_samples);
fprintf(outdev,"\t NUMBER OF LOCATIONS WITH INSUFFICIENT SAMPLES:   %5d\n",
                 num_bad_locations);
fprintf(outdev,"\t\tNUMBER OF SAMPLES FOR THOSE LOCATIONS:          %5ld\n",
                 num_bad_loc_samples);
fprintf(outdev,"\t\t\t\t\t\t\t  ----- -----\n");
fprintf(outdev,"\t TOTAL NUMBER OF LOCATIONS IN THE SURVEY:         %5d\n",
                total_locations);
fprintf(outdev,"\t TOTAL NUMBER OF SAMPLES FOR THE SURVEY: \t        %5ld\n",
                total_samples);


/* Output the totals */
fprintf(outdev,"\n\n\n                            SAMPLED DELAY STATISTICS\n");
fprintf(outdev,"                            (Covering %5ld samples)\n",
                 num_good_loc_samples);
fprintf(outdev,"                            ------------------------\n");
fprintf(outdev,"                            MINIMUM:      %5d ms\n",mindelay);
fprintf(outdev,"                            MAXIMUM:      %5d ms\n",maxdelay);
fprintf(outdev,"                               MEAN:      %5.0f ms *\n\n\n",
                      avgdelay);
fprintf(outdev,"========================================");
fprintf(outdev,"========================================"); 
fprintf(outdev,"\n\n========================================");
fprintf(outdev,"========================================\n\n"); 
fprintf(outdev,"\t* Location specific weighting factors %s been applied.\n",
               applied_flag);
return(SUCCESS);

}


/*
******************************************************************************
**
** FUNCTION: int ltype_sel(loc_type,stmt)
**
** This function builds the db_query selection statement to select
** delay information for a certain location_type.
** The function first inputs the location_type from the user.
**
** ARGUMENTS
**       char loc_type[] - This array will return the location type that
**                         the user has specified.
**       char stmt[] - This array will return the selection statement.
**
** RETURNS
**       0 - SUCCESS.  The select statement has been created.
**       1 - FAILURE.  Unable to create the select statement.
**       2 - ABORT.    The user wants to return to the main menu.
**
******************************************************************************
*/
                                        
int ltype_sel(loc_type,selstmt)
char loc_type[];
char selstmt[MAXQSTMT];
{
extern char survey_name[];
int numchr;
char answer[15];
char *prompt;
int epos, status;
char *emsg;
int key; 


/* Ask the user for the loction type */
loc_type[0] = '\0';
while ( loc_type[0] == '\0' )
        {
        vidclr();
        prompt = "\n\tEnter loction type to create reports for: ";
        if ( user_input(prompt,loc_type,LOCTYPE_SIZE-1) == ABORT )
                return (ABORT);
        }

/* Make sure that the location type is all upper case. */
strupr(loc_type);

/* Build the select statement */
numchr = sprintf(selstmt,"select city,state,loc_id,weight_factor,forcast_");
numchr += sprintf(selstmt+numchr,"delay,delay_threshold,ot_node,ot_delay ");
numchr += sprintf(selstmt+numchr,"from ltodata ");
numchr += sprintf(selstmt+numchr,"where loc_type = \"%s\"",
                              loc_type);
numchr += sprintf(selstmt+numchr," and ot_survey_name = \"%s\" ",survey_name);
numchr += sprintf(selstmt+numchr,"order by state,city;");
if (numchr > MAXQSTMT)
     {
     printf("\n\t EXCEEDED MAX SIZE OF QUERY STATEMENT!!");
     printf("\n\t UNABLE TO CONTINUE");
     return(FAILURE);
     }
/* Return to calling function */
vidclr();
printf("\n\n\tWorking...\n");
return(SUCCESS);
}

/***********************************************************************
**
** Function: process_rec() - This function processes one record's worth
**                           of data for the Delay Summary Report.
**
*************************************************************************
*/
process_rec( fidtmp,delay,num_loc_samples,loc_delay,mindelay,maxdelay)
FILE *fidtmp;
int delay, *mindelay, *maxdelay;
long *loc_delay;
long *num_loc_samples;
{

/* Check if this delay is the min or max delay for the location, so far. */
if ( delay < *mindelay) *mindelay = delay;
if ( delay > *maxdelay) *maxdelay = delay;

/* Increment the total number of samples for the location. */
(*num_loc_samples)++;

/* Add the delay for this record to the accumlating delay for the location. */
(*loc_delay) += delay;

/* Output the delay value to the temporary file.  This file is used
** to compute the standard deviation from  the location's mean delay.
*/
fprintf(fidtmp,"%d\n",delay);

return(SUCCESS);
}


/*
******************************************************************************
**
** FUNCTION: void dsr_header
**
** This function outputs the Delay Summary Report Page Header.
**
******************************************************************************
*/

void dsr_header(outdev,c_date,page,line,mindate,maxdate,loc_type)
FILE *outdev;
long c_date,mindate,maxdate;
int page;
int *line;
char loc_type[LOCTYPE_SIZE];

{
extern char survey_name[];

/*printf("\nIn dsr_header page = %d",page);*/


/* The Header for the first page is different  */
if ( page == 1)
    {
    fprintf(outdev,"\n************************************");
    fprintf(outdev,"********************************************\n");
    fprintf(outdev,"\n                               B ");
    fprintf(outdev,"T   T Y M N E T\n");
    fprintf(outdev,"\n************************************");
    fprintf(outdev,"********************************************");
    fprintf(outdev,"\n\n                    D E L A Y ");
    fprintf(outdev,"  S U M M A R Y   R E P O R T  ");
    fprintf(outdev,"\n                              By %s Location",
                             loc_type);
    fprintf(outdev,"\n\n                                SURVEY: %s\n",
                     survey_name);
    fprintf(outdev,"                             SAMPLE SIZE FILTER: %d",
                             d_parms.ss_filter);
    fprintf(outdev,"\n REPORT DATE: %6ld\t\t\t\t           R-T INTERFACE DELAYS",
                              c_date);
    fprintf(outdev,"\n-SAMPLES TAKEN BETWEEN-     \t\t\t\t\tHOST: %4d msec\n",
                    d_parms.hi_delay);
    fprintf(outdev,"   %ld and %ld\t\t\t\t\t    TERMINAL: %4d msec\n\n",
                   mindate,maxdate,d_parms.ti_delay);
    fprintf(outdev,"  FLAGS:  Locations preceeded by an asterisk (*) have");
    fprintf(outdev," been excluded from\n\t  the calculation of the ");
    fprintf(outdev,"SAMPLED DELAY STATISTICS based on the SAMPLE\n   (*)    ");
    fprintf(outdev,"SIZE FILTER.  These statistics are displayed in the");
    fprintf(outdev," SURVEY SUMMARY\n\t  at the end of this report.\n\n");
    fprintf(outdev,"   (&)    Locations preceeded by an ampersand (&) do not ");
    fprintf(outdev,"have enough samples\n\t  (at least %d) to ", MIN_SAMPLES );
    fprintf(outdev,"provide reliable data.\n\n");
    fprintf(outdev,"   (!)    Locations preceeded by an exclamation mark (!) have");
    fprintf(outdev," MEANs which\n\t  exceed their FORCASTED DELAY.\n\n");
    *line = 28;
    }
else
    {
    fprintf(outdev,"\n\nDELAY SUMMARY by %s location          ",loc_type);
    fprintf(outdev,"                      PAGE: %4d\n\n",page);
    *line = 5;
    }

    fprintf(outdev,"   ----------     LOCATION   -----------\n");
    fprintf(outdev,"\t\t\t\t    %%\t          --- SAMPLED DELAYS --  FOR-\n");
    fprintf(outdev,"\t\t\t\t  WEIGHT  # OF\t\t          STD.   CAST\n");
    fprintf(outdev,"   CITY\t\t  ST      ID\t  FACTOR SAMPLES  MIN  MAX  MEAN");
    fprintf(outdev,"  DEV.   DELAY\n");    
    fprintf(outdev,"   -------------- -- ------------ ------ -------  ");
    fprintf(outdev,"--------------------   -----\n");       
*line += 5;

}

/*
******************************************************************************
**
** FUNCTION: int dsr_out
**
** This function outputs the Delay Location Summary information.  One line is
** output for the specified location.
**
******************************************************************************
*/
                                        
void dsr_out(outdev,line,loc,num_loc_samples,min,max,mean,sd,flag1,flag2,
             flag3)
FILE *outdev;
struct location loc;
int *line, min, max;
float mean;
double sd;
char flag1,flag2,flag3;
long num_loc_samples;

{

fprintf(outdev,"\n%c%c%c%-14s %2s %-12s %6.2f %5ld   %4d %4d  %4.0f  %4.0lf",
        flag1,flag2,flag3,loc.lid.city,loc.lid.state,loc.loc_id,
        loc.weight_factor,num_loc_samples,min,max,mean,sd);
fprintf(outdev,"    %4d",loc.forcast_delay);
*line += 1;

}



/*
******************************************************************************
**
** FUNCTION: int ck_weight()
**
** This funtion sums the weighting factors for all
** locations to make sure that the sum totals 100%.  If the sum does
** not total 100%, then the user if given the choice of not generation
** the report or not applying the weighting factors.
**
** ARGUMENTS
**       NONE
**
** RETURNS
**       0 - SUCCESS.  The report can be generated.
**       1 - FAILURE.  The report can not be generated.
**
******************************************************************************
*/
                                        
int ck_weight(loc_type)
char loc_type[];
{
char answer[15];  
char *prompt;
int  status;
int epos, numchr;
char *emsg;
int key; 
char row[MAXROW];
char selstmt[MAXQSTMT];
float weight_factor;
double xint,fraction;
float sum_weight = 0;
float hundred = 100.00;
int response = 0;
extern survey_name[];



/* Build the select statement to look at each locations weight factor. */
numchr = sprintf(selstmt,"select weight_factor ");
numchr += sprintf(selstmt+numchr,"from location ");
numchr += sprintf(selstmt+numchr,"where loc_type = \"%s\";",
            loc_type);
if (numchr > MAXQSTMT)
     {
     printf("\n\t EXCEEDED MAX SIZE OF QUERY STATEMENT!!");
     printf("\n\t UNABLE TO CONTINUE");
     return(FAILURE);
     }

/* Issue select command */
status = d_query(selstmt,&epos,&emsg);

/* Go through the information a line at a time */
while  (q_nextrow(row) == Q_OKAY)
      {
      /* Get the values of the weight_factor for this location */
      sscanf(row,"%f",&weight_factor);
      sum_weight += weight_factor;
      }

/* Check if the sum is close to 100 %.  It must be within 2/10ths on either
** side of 100.00 to be acceptable.
*/
if (  sum_weight < 99.8  || sum_weight > 100.2 )
        {
        /* The sum is not 100. Ask the user what to do. */
        while (response != 1 && response != 2 )
          {
          vidclr(); 
          printf("\n\tThe weighting factors for the locations add up");
          printf("\n\tto %6.2f.  The sum of the weighting factors must",
                   sum_weight);
          printf("\n\tbe between 99.8 and 100.2.  Unable to apply weighting");
          printf("\n\tfactors.\n\t");
          printf("\n\tDo you want to 1) not generate the report, or");
          printf("\n\t               2) generate the report without");
          printf("\n\t                  applying the weighting factors.");
          prompt = "\n        Enter a 1 or 2: ";
          if ( user_input(prompt,answer,2) == ABORT)
               return(FAILURE);                    
          else
               sscanf(answer,"%d",&response);
          }

        /* If the user wants to not generate the report, return the 
        ** appropriate response.
        ** --------------------------------------------------------- */
        if ( response == 1 )
                return(FAILURE);

        /* The user wants to generate the report without applying the
        ** user supplied weighting factors.  Set the weighting parameter
        ** to reflect this and then write the updated parameter to the
        ** parameter file.
        */
        strcpy(d_parms.apply_weight,"NO");
        }

/* Return to calling function */
vidclr();
printf("\n\n\tWorking.....\n");
return(SUCCESS);
}












  xzHR"