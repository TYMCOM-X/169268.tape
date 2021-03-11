#include <stdio.h>
#include <\c\gp.h>
#define ABORT -2
#define SUCCESS 0
#define FAILURE 1
 
/*
***************************************************************************
**  FUNCTION: XRAY_CIRCUIT
**  AUTHOR: JO ANN JOELS
**  CREATION DATE: SEPTEMBER, 1987
**
**  This function builds a circuit to XRAY.  It will scan through the 
**  header information and leave the user at the command prompt.
**
**  CALLING SEQUENCE:
**       return = xray_circuit(kernel,password)
**
**  ARGUMENTS:
**            kernel    - string containing kernel host number to login to
**            password  - string containing login password for XRAY
**
**  RETURN:
**       0 - is returned if no errors are encountered and the circuit is
**           established.
**       1 - is returned if unable to build the circuit to XRAY
**       2 - is returned if a circuit is established but an unexpected 
**           response is received from XRAY.
**
***************************************************************************
*/
/*  Set up the XRAY 'no echo' command sequence.  The sequence is LE<CR>. */
char noecho[4] = { 'L', 'E', '\015', '\0' };
 
/*-------------------------BEGIN FUNCTION-------------------------------*/
xray_circuit(kernel,password)
long kernel;
char password[];
 
{
int login[30];
int result;
int prompt;
extern char noecho[];
 
 
/*  Set XRAY prompt character to the greater than sign ( > ). */
prompt = 62;
 
/* Create the XRAY login string, using the kernel host number and the */
/* XRAY password.                                                     */
create_login("XRAY",kernel,password,login);
 
/* Send the login string to the communications port */
result = str_to_modem(login);
 
/*
** Now XRAY should give the node and kernel number, the date and time, 
** and then the command prompt.  Look for the command prompt to confirm 
** that we are logged into XRAY.                                        
*/
result = scan_port(prompt);
 
    /* If unable to find the command prompt, return a 2 to calling */
    /* program.                                                    */
    if (result)
         {
         gp_clrbuf();
         return(2);
         }
 
/* The command prompt was found.  Send the 'no echo' command to XRAY */
result = str_to_xray(noecho);
 
/* XRAY will respond with another command prompt. Look for it. */
result = scan_port(prompt);
 
    /* If unable to find the command prompt, return a 2 to calling */
    /* program.                                                    */
    if (result)
         {
         return(2);
         }
 
/* Login to XRAY has been completed.  Return a 0 to the calling program */
return(0);
 
 
/*-------------------------END OF FUNCTION-------------------------------*/
}
 
/*
***************************************************************************
**  FUNCTION: XRAY_GCIRCUIT
**  AUTHOR: JO ANN JOELS
**  CREATION DATE: JANUARY, 1988
**
**  This function builds a circuit to XRAY through a gateway.
**  It will scan through the header information and leave the user at
**  the command prompt.
**
**  CALLING SEQUENCE:
**       return = xray_gcircuit(gname,ghost,xname,kernel,password)
**
**  ARGUMENTS:
**            gname     - Gateway username
**            ghost     - Gateway host number
**            xname     - Xray user name
**            kernel    - string containing kernel host number to login to
**            password  - string containing login password for XRAY
**
**  RETURN:
**       0 - is returned if no errors are encountered and the circuit is
**           established.
**       1 - is returned if unable to build the circuit to XRAY
**       2 - is returned if a circuit is established but an unexpected 
**           response is received from XRAY.
**
***************************************************************************
*/
 
/*-------------------------BEGIN FUNCTION-------------------------------*/
xray_gcircuit(gname,ghost,xname,kernel,password)
char gname[];
long ghost;
char xname[];
long kernel;
char password[];
 
{
int login[30];
int glogin[30];
int result;
int prompt, colon;
extern char noecho[];
 
/*  Set XRAY prompt character to the greater than sign ( > ). */
/*  Set another variable to contain a colon (:).*/
prompt = 62;
colon = 58;
 
/* Create the XRAY login string, using the kernel host number and the */
/* XRAY password.                                                     */
create_login(xname,kernel,password,login);
 
/* Create the Gateway login string, using the gateway username & host */
/* number, the xray username, and the kernel host number and XRAY     */
/* password.                                                          */
create_login(gname,ghost," ",glogin);
 
/* Send the gateway login string to the communications port */
result = str_to_modem(glogin);
 
/* At this stage, a circuit should have been established to the */
/* private network.  Scan for the PLEASE LOG IN: message */
/* and then issue the xray login string.         */
result = scan_pli();
 
    /* If unable to find the colon, return a 2 to calling */
    /* program.                                                    */
    if (result)
         {
         return(2);
         }
 
/* Send the XRAY login string to the communications port */
result = str_to_modem(login);
 
/*
** Now XRAY should give the node and kernel number, the date and time, 
** and then the command prompt.  Look for the command prompt to confirm 
** that we are logged into XRAY.                                        
*/
result = scan_port(prompt);
 
    /* If unable to find the command prompt, return a 2 to calling */
    /* program.                                                    */
    if (result)
         {
         return(2);
         }
 
/* The command prompt was found.  Send the 'no echo' command to XRAY */
result = str_to_xray(noecho);
 
/* XRAY will respond with another command prompt. Look for it. */
result = scan_port(prompt);
 
    /* If unable to find the command prompt, return a 2 to calling */
    /* program.                                                    */
    if (result)
         {
         return(2);
         }
 
/* Login to XRAY has been completed.  Return a 0 to the calling program */
return(0);
 
 
/*-------------------------END OF FUNCTION-------------------------------*/
}
 
/*
***************************************************************************
**  FUNCTION: void xray_zap()
**  AUTHOR: JO ANN JOELS
**  CREATION DATE: SEPTEMBER, 1987
**
**  This function outputs a ctrl-Z to the communications port.  This is
**  the way to terminate a circuit to XRAY.
**
**  ARGUMENTS:
**       NONE
**
**  RETURN:
**       NONE
**
***************************************************************************
*/
int ctrl_z = 26;
 
/*-------------------------BEGIN FUNCTION-------------------------------*/
xray_zap()
 
{
extern int ctrl_z;
 
/* Output the ctrl_z to the communications port */
gp_wc(ctrl_z);
 
 
/*-------------------------END OF FUNCTION-------------------------------*/
}
 
 
 
/*
******************************************************************
**
** FUNCTION: int password(type_net,xray_user,x_pass,gw_user,gw_host)
**
** This function input from the user the type of network (public or
** private) to be accessed, and then prompts for the appropriate
** gateway and password information.
**
** ARGUMENTS:
**      int type_net -- type of network 
**      char gw_user[] --  gateway user name 
**      long gw_host --  gateway host number 
**      char xray_user[] -- xray user name 
**      char x_pass[] --  xray password 
**
** RETURNS:
**      0 = Success. Input all necessary information
**      1 = Failure. Unable to input all necessary information
**     -2 = ABORT.
**
*************************************************************************
*/
 
 
int password(type_net,xray_user,x_pass,gw_user,gw_host)
int *type_net;
char xray_user[];
char x_pass[];
char gw_user[];
long *gw_host;
 
{
 
    int public = 1;
    int private = 2;
    int rval = 0;
    char temp[15];
    char *prompt;
    long host;
 
    /* Determine whether network to be accessed is public or private */
 
    *type_net = 0;
    printf("\n");
    while (*type_net != public && *type_net != private){
         prompt = "Access 1) the Public Network or 2) a Private Network: ";
         if (user_input(prompt,temp,2) == ABORT)
              return(ABORT);
         else
              sscanf(temp,"%d",type_net);
    }
 
    /* Depending on type of network being accessed, input necessary user */
    /* names and passwords. */
 
    if (*type_net == public)
    {
      rval = xray_pass(x_pass);
    }
 
    else
      {
      rval = xray_gpass(gw_user,&host,xray_user,x_pass);
      *gw_host = host;
      }
 
    /* Return to calling program */
    return(rval);
 
 
 
}
 
 
 
#define INVALID 1
 
/*
**************************************************************************
**
** FUNCTION: int xray_pass(xpass)
** AUTHOR: Jo Ann Joels
**
** This function gets the XRAY password from the user over the 
** standard input device.
**
** ARGUMENTS:
**      char xpass -- The user specified password is placed into this
**                    array.
**
** RETURNS:
**      0 -- The password was successfully input.
**     -2 -- ABORT. User typed an escape.
**
****************************************************************************
*/
    
int xray_pass(xpass)
char xpass[];
 
{
 
char *prompt;
char xpass2[14];
int rval = FAILURE;
 
/*
** Since the password is not echoed to the terminal, the user will 
** need to type the password twice to insure that it was typed correctly.
** Input passwords until receive two that match.
*/
while (rval)
    {
    /* Get the password from the user */
    prompt = "Enter XRAY password: ";
    if (user_neinput(prompt,xpass,12) == ABORT)
       return(ABORT);
 
    /* Get the password again */
    prompt = "Enter it again: ";
    if (user_neinput(prompt,xpass2,12) == ABORT)
       return(ABORT);
 
    /* Compare the two passwords, if they do not match exactly, start over */
    if (strcmp(xpass,xpass2))
        printf("\n\t Passwords do not match.  Please try again. ");
 
    else
        rval = SUCCESS;
 
    }
/* Return to calling program */
return(rval);
 
/*------------------------END OF FUNCTION-------------------------------*/
}
 
 
/*
**************************************************************************
**
** FUNCTION: int xray_gpass(guser,ghost,xuser,xpass)
** AUTHOR: Jo Ann Joels
**
** This function gets all of the information necessary to login to XRAY
** through a gateway.  The information is input over the standard input device.
**
** ARGUMENTS:
**      char guser -- The gateway username
**      int ghost  -- The gateway host number  
**      char xuser -- The xray username
**      char xpass -- The xray password
**
** RETURNS:
**      0 -- Success. All information input successfully.
**     -2 -- ABORT. User enter an escape.
**
****************************************************************************
*/
    
int xray_gpass(guser,ghost,xuser,xpass)
char guser[];
long *ghost;
char xuser[];
char xpass[];
 
{
char hnum[6];
int i;
char *prompt;
char temp[15];
long host;
 
for (i = 0; i < sizeof(hnum); i++)
        hnum[i] = NULL;
 
  /* Get the gateway user name */
  prompt = "Enter gateway username: ";
  if (user_input(prompt,guser,12) == ABORT)
         return(ABORT);
 
  /* Get the gateway host number */
  host = -1l;
  while (host < 0  || host > 9999999 )
     {
     prompt = "Enter the gateway host number: ";
     if (user_input(prompt,temp,8) == ABORT)
            return(ABORT);
         else
            sscanf(temp,"%ld",&host);
     }
  *ghost = host;
 
  /* Get the xray user name */
  prompt = "Enter XRAY username: ";
  if (user_input(prompt,xuser,12) == ABORT)
         return(ABORT);
 
  /* Get the xray password from the user */
  if (xray_pass(xpass) == ABORT)
         return(ABORT);
 
  /* Return to calling program */
  return(SUCCESS);
 
/*------------------------END OF FUNCTION-------------------------------*/
}
 
 
 
 
/*
**************************************************************************
**
** FUNCTION: int str_to_xray(string)
** AUTHOR: Ed Mooring
**         Adapted by Jo ann Joels
**   
** This function outputs a string, one character at a time, to the 
** communications port.  The high order bit in each character is turned on.
** If a character can not be sent within 5 seconds an error code is returned.
**
** ARGUMENTS:
**      char string - an array containing the string to be sent.
**                    It must be terminated by the NULL character.
**
** RETURNS:
**      0 = success in sending string.
**      non-zero = error in sending string.
****************************************************************************
*/
 
str_to_xray(string)
char string[];
{
int chr = 0;
int i = 0;
int result = 0;
int try_count = 0;
int max_try = 11;
int rval = 0;
 
 
/* Check to see if the communication port is ready for output */
 if (gp_outrdy())
 
 {
/* Loop through the string until find end-of-string marker */
/* or unable to send a character over the port             */
    while (*string && !rval)
        {
        /*
        ** Get a char from the string, turn on the high order bit
        ** and output it to the communications port.
        */
        chr = *string | 0200;
        string += (int)1;
        if (send_noecho(chr,5))
                rval = LOG_TIMEOUT;
        }
 
 }
 
/* Output completed.  Return. */
  return(rval);
 
}
 
/*
***************************************************************************
**  FUNCTION: MAKE_XRCOM
**  AUTHOR: JO ANN JOELS
**  CREATION DATE: SEPTEMBER, 1987
**
**  This function places an XRAY command into a string.  If the number
**  argument is non-zero then the number is added to the string.  Finally,
**  a carriage-return is appended to the string.
**
**  CALLING SEQUENCE:
**       make_xrcom(text,number,command)
**
**  ARGUMENTS:
**       INPUT:
**            text      - text portion of XRAY command
**            number    - optional number portion of XRAY command
**
**       OUTPUT:
**            command   - string containing the complete XRAY command
**
**  RETURN:
**
**       NONE
**
***************************************************************************
*/
 
/*-------------------------BEGIN FUNCTION-------------------------------*/
void make_xrcom(text,number,command)
char text[];
long number;
char command[];
 
{
int result;
 
/*
** If the number portion of the command is non-zero....... 
** Put the text and the number into the string
*/
if (number)
    {
        result = sprintf(command, "%s %6ld\r", text, number);
    }
/*
** Otherwise, just put the text into the command string
**
*/
else
    {
        result = sprintf(command, "%s\r", text);
    }
 
 
 
/*-----------------END OF FUNCTION-------------------------------------*/
}
 
/*
***************************************************************************
**  FUNCTION: int get_ns(fileid,node,stat_type)
**  AUTHOR: JO ANN JOELS
**  CREATION DATE: SEPTEMBER, 1987
**
**  This function sends a node statistics command to XRAY and then places the
**  output from the command into the specified output file.
**
**  ARGUMENTS:
**            FILE fileid -- file handle of file to write NS data to.
**            long node   -- node number for which to collect stats.
**            char stat_type[] -- array containing type of statistics to 
**                                collect. NS or ND
**
**  RETURN:
**
**       0 -- No errors encountered.
**       1 -- Unable to write data to specified file.
**
***************************************************************************
*/
 
/*-------------------------BEGIN FUNCTION-------------------------------*/
int get_ns(fileid,node,stat_type)
FILE *fileid;
long node;
char stat_type[];
 
{
void make_xrcom();
int result;
char command[15];
int gtsign;
long cdate;
int ctime;
int rval;
 
/* Set the return value to indicate no errors. */
result = 0;
 
/* Set the command prompt character for XRAY */
gtsign = 62;
 
/* Get the current date and time and write an NTRACK header to the file */
rval = get_time(&cdate,&ctime);
fprintf(fileid,"\n\nNTRACK: %6ld   %6ld %4d\n",node,cdate,ctime);
 
/* Create the XRAY  command */
make_xrcom(stat_type,0l,command);
 
/* Send the command to XRAY */
result = str_to_xray(command); 
 
/* Place the output from the command into the appropriate output file */
if (!result)
        {
        result = file_data(fileid,gtsign);
        fprintf(fileid,"\n");
        }
 
/* Return to the calling program */
return(result);
 
/*-----------------END OF FUNCTION-------------------------------------*/
}
 
/*
***************************************************************************
**  FUNCTION: int get_ks(fileid)
**  AUTHOR: JO ANN JOELS
**  CREATION DATE: SEPTEMBER, 1987
**
**  This function sends the KS command to XRAY and then places the output
**  from the command into the specified output file.
**
**  ARGUMENTS:
**            FILE fileid -- file handle of file to write KS data to.
**
**  RETURN:
**
**       0 -- No errors encountered.
**       1 -- Unable to write data to specified file.
**
***************************************************************************
*/
 
/*-------------------------BEGIN FUNCTION-------------------------------*/
int get_ks(fileid,node,neighbor)
FILE *fileid;
long node;
long neighbor;
 
{
void make_xrcom();
int result;
char command[15];
int gtsign;
long cdate;
int ctime;
int rval;
 
/* Set the return value to indicate no errors. */
result = 0;
 
/* Set the command prompt character for XRAY */
gtsign = 62;
 
/* Get the current date and time and write an N header to the file */
rval = get_time(&cdate,&ctime);
fprintf(fileid,"\n\nNTRACK: %6ld - %6ld   %6ld %4d\n",node,neighbor,cdate,ctime);
 
/* Create the XRAY KS command */
make_xrcom("KS",neighbor,command);
 
/* Send the KS command to XRAY */
result = str_to_xray(command); 
 
/* Place the output from the KS command into the appropriate output file */
if (!result)
        result = file_data(fileid,gtsign);
 
/* Return to the calling program */
return(result);
 
/*-----------------END OF FUNCTION-------------------------------------*/
}
 
  % O_