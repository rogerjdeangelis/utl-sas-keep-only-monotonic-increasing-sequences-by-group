%let pgm=utl-sas-keep-only-monotonic-increasing-sequences-by-group;

SAS keep only monotonic increasing sequences by group

I know this is an easy sas problem but traffic for these types of solutions is
greater than mor complex problems


github
https://tinyurl.com/2e32h76w
https://github.com/rogerjdeangelis/utl-sas-keep-only-monotonic-increasing-sequences-by-group

/*               _     _
 _ __  _ __ ___ | |__ | | ___ _ __ ___
| `_ \| `__/ _ \| `_ \| |/ _ \ `_ ` _ \
| |_) | | | (_) | |_) | |  __/ | | | | |
| .__/|_|  \___/|_.__/|_|\___|_| |_| |_|
|_|
*/

/**************************************************************************************************************************/
/*                           |                                          |                                                 */
/*        INPUT              |      PROCESS                             |      OUTPUT                                     */
/*        =====              |      =======                             |      ======                                     */
/*                           |                                          |                                                 */
/*  data have;               |   data want;                             |   CLASS    SCORE                                */
/*  input                    |     retain maxscr .;                     |                                                 */
/*   class $ score @@;       |     set have;                            |    C1        42                                 */
/*  cards4;                  |     by class;                            |    C1        45                                 */
/*  C1 42 C1 45 C1 47 C1 32  |     if first.class then do;              |    C1        47                                 */
/*  C1 49 C2 50 C2 51 C2 28  |        output;                           |    C1        49                                 */
/*  C2 54 C2 55 C3 56 C3 12  |        maxscr=score;                     |                                                 */
/*  C3 13 C3 61 C3 64        |     end;                                 |    C2        50                                 */
/*  ;;;;                     |     if max(maxscr,score)>maxscr then do; |    C2        51                                 */
/*  run;quit;                |        maxscr=score;                     |    C2        54                                 */
/*                           |        output;                           |    C2        55                                 */
/*   HAVE total obs=15       |     end;                                 |                                                 */
/*                           |   run;quit;                              |    C3        56                                 */
/*   CLASS SCORE             |                                          |    C3        61                                 */
/*                           |                                          |    C3        64                                 */
/*    C1     42              |                                          |                                                 */
/*    C1     45              |                                          |                                                 */
/*    C1     47              |                                          |                                                 */
/*    C1     32  remove      |                                          |                                                 */
/*    C1     49              |                                          |                                                 */
/*               42,45,47,49 |                                          |                                                 */
/*    C2     50              |                                          |                                                 */
/*    C2     51              |                                          |                                                 */
/*    C2     28  remove      |                                          |                                                 */
/*    C2     54              |                                          |                                                 */
/*    C2     55              |                                          |                                                 */
/*               50,51,54,55 |                                          |                                                 */
/*    C3     56              |                                          |                                                 */
/*    C3     12  remove      |                                          |                                                 */
/*    C3     13  remove      |                                          |                                                 */
/*    C3     61              |                                          |                                                 */
/*    C3     64  56,61,64    |                                          |                                                 */
/*                           |                                          |                                                 */
/**************************************************************************************************************************/

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/

