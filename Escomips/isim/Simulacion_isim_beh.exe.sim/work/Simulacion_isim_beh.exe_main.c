/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_1242562249;
char *WORK_P_3903357176;
char *WORK_P_2956383795;
char *STD_STANDARD;
char *IEEE_P_3620187407;
char *IEEE_P_3499444699;
char *IEEE_P_3039841270;
char *IEEE_P_2592010699;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    work_p_3903357176_init();
    work_p_2956383795_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    ieee_p_1242562249_init();
    ieee_p_3039841270_init();
    work_a_2365484624_2699141630_init();
    work_a_1429187435_3212880686_init();
    work_a_2495716330_3212880686_init();
    work_a_3175194644_0701277094_init();
    work_a_2389712931_3212880686_init();
    work_a_2175728961_3212880686_init();
    work_a_1061504304_3212880686_init();
    work_a_2774614600_3212880686_init();
    work_a_1036709522_3212880686_init();
    work_a_2253722718_3212880686_init();
    work_a_3604004464_3212880686_init();
    work_a_1193459281_3212880686_init();
    work_a_3207103433_3212880686_init();
    work_a_1833681793_3212880686_init();
    work_a_4072460770_2372691052_init();


    xsi_register_tops("work_a_4072460770_2372691052");

    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    WORK_P_3903357176 = xsi_get_engine_memory("work_p_3903357176");
    WORK_P_2956383795 = xsi_get_engine_memory("work_p_2956383795");
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_3039841270 = xsi_get_engine_memory("ieee_p_3039841270");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);

    return xsi_run_simulation(argc, argv);

}
