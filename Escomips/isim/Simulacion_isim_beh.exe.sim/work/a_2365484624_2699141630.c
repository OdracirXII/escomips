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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Escomips/Pila.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );
char *ieee_p_3620187407_sub_436279890_3965413181(char *, char *, char *, char *, int );


static void work_a_2365484624_2699141630_p_0(char *t0)
{
    char t23[16];
    char t24[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    unsigned int t6;
    char *t7;
    unsigned char t8;
    unsigned int t9;
    char *t10;
    char *t11;
    unsigned char t12;
    unsigned char t13;
    unsigned char t14;
    unsigned char t15;
    unsigned char t16;
    unsigned char t17;
    char *t18;
    char *t19;
    int t20;
    int t21;
    unsigned int t22;
    int t25;
    unsigned int t26;
    int t27;
    int t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;

LAB0:    xsi_set_current_line(27, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1312U);
    t3 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB7;

LAB8:
LAB3:    xsi_set_current_line(44, ng0);
    t1 = (t0 + 2528U);
    t2 = *((char **)t1);
    t1 = (t0 + 2408U);
    t5 = *((char **)t1);
    t20 = *((int *)t5);
    t21 = (t20 - 7);
    t6 = (t21 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, t20);
    t9 = (16U * t6);
    t22 = (0 + t9);
    t1 = (t2 + t22);
    t7 = (t0 + 3912);
    t10 = (t7 + 56U);
    t11 = *((char **)t10);
    t18 = (t11 + 56U);
    t19 = *((char **)t18);
    memcpy(t19, t1, 16U);
    xsi_driver_first_trans_fast_port(t7);
    t1 = (t0 + 3832);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(28, ng0);
    t1 = xsi_get_transient_memory(128U);
    memset(t1, 0, 128U);
    t5 = t1;
    t6 = (16U * 1U);
    t7 = t5;
    memset(t7, (unsigned char)2, t6);
    t8 = (t6 != 0);
    if (t8 == 1)
        goto LAB5;

LAB6:    t10 = (t0 + 2528U);
    t11 = *((char **)t10);
    t10 = (t11 + 0);
    memcpy(t10, t1, 128U);
    xsi_set_current_line(29, ng0);
    t1 = (t0 + 2408U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((int *)t1) = 0;
    goto LAB3;

LAB5:    t9 = (128U / t6);
    xsi_mem_set_data(t5, t5, t6, t9);
    goto LAB6;

LAB7:    xsi_set_current_line(31, ng0);
    t2 = (t0 + 1992U);
    t5 = *((char **)t2);
    t12 = *((unsigned char *)t5);
    t13 = (t12 == (unsigned char)3);
    if (t13 == 1)
        goto LAB15;

LAB16:    t8 = (unsigned char)0;

LAB17:    if (t8 == 1)
        goto LAB12;

LAB13:    t4 = (unsigned char)0;

LAB14:    if (t4 != 0)
        goto LAB9;

LAB11:    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t8 = *((unsigned char *)t2);
    t12 = (t8 == (unsigned char)3);
    if (t12 == 1)
        goto LAB23;

LAB24:    t4 = (unsigned char)0;

LAB25:    if (t4 == 1)
        goto LAB20;

LAB21:    t3 = (unsigned char)0;

LAB22:    if (t3 != 0)
        goto LAB18;

LAB19:    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t8 = *((unsigned char *)t2);
    t12 = (t8 == (unsigned char)2);
    if (t12 == 1)
        goto LAB31;

LAB32:    t4 = (unsigned char)0;

LAB33:    if (t4 == 1)
        goto LAB28;

LAB29:    t3 = (unsigned char)0;

LAB30:    if (t3 != 0)
        goto LAB26;

LAB27:    xsi_set_current_line(40, ng0);
    t1 = (t0 + 2528U);
    t2 = *((char **)t1);
    t1 = (t0 + 2408U);
    t5 = *((char **)t1);
    t20 = *((int *)t5);
    t21 = (t20 - 7);
    t6 = (t21 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, t20);
    t9 = (16U * t6);
    t22 = (0 + t9);
    t1 = (t2 + t22);
    t7 = (t24 + 0U);
    t10 = (t7 + 0U);
    *((int *)t10) = 15;
    t10 = (t7 + 4U);
    *((int *)t10) = 0;
    t10 = (t7 + 8U);
    *((int *)t10) = -1;
    t25 = (0 - 15);
    t26 = (t25 * -1);
    t26 = (t26 + 1);
    t10 = (t7 + 12U);
    *((unsigned int *)t10) = t26;
    t10 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t23, t1, t24, 1);
    t11 = (t0 + 2528U);
    t18 = *((char **)t11);
    t11 = (t0 + 2408U);
    t19 = *((char **)t11);
    t27 = *((int *)t19);
    t28 = (t27 - 7);
    t26 = (t28 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, t27);
    t29 = (16U * t26);
    t30 = (0 + t29);
    t11 = (t18 + t30);
    t31 = (t23 + 12U);
    t32 = *((unsigned int *)t31);
    t33 = (1U * t32);
    memcpy(t11, t10, t33);

LAB10:    goto LAB3;

LAB9:    xsi_set_current_line(32, ng0);
    t2 = (t0 + 1032U);
    t11 = *((char **)t2);
    t2 = (t0 + 2528U);
    t18 = *((char **)t2);
    t2 = (t0 + 2408U);
    t19 = *((char **)t2);
    t20 = *((int *)t19);
    t21 = (t20 - 7);
    t6 = (t21 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, t20);
    t9 = (16U * t6);
    t22 = (0 + t9);
    t2 = (t18 + t22);
    memcpy(t2, t11, 16U);
    goto LAB10;

LAB12:    t2 = (t0 + 1832U);
    t10 = *((char **)t2);
    t16 = *((unsigned char *)t10);
    t17 = (t16 == (unsigned char)2);
    t4 = t17;
    goto LAB14;

LAB15:    t2 = (t0 + 1672U);
    t7 = *((char **)t2);
    t14 = *((unsigned char *)t7);
    t15 = (t14 == (unsigned char)2);
    t8 = t15;
    goto LAB17;

LAB18:    xsi_set_current_line(34, ng0);
    t1 = (t0 + 2408U);
    t10 = *((char **)t1);
    t20 = *((int *)t10);
    t21 = (t20 + 1);
    t1 = (t0 + 2408U);
    t11 = *((char **)t1);
    t1 = (t11 + 0);
    *((int *)t1) = t21;
    xsi_set_current_line(35, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 2528U);
    t5 = *((char **)t1);
    t1 = (t0 + 2408U);
    t7 = *((char **)t1);
    t20 = *((int *)t7);
    t21 = (t20 - 7);
    t6 = (t21 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, t20);
    t9 = (16U * t6);
    t22 = (0 + t9);
    t1 = (t5 + t22);
    memcpy(t1, t2, 16U);
    goto LAB10;

LAB20:    t1 = (t0 + 1832U);
    t7 = *((char **)t1);
    t15 = *((unsigned char *)t7);
    t16 = (t15 == (unsigned char)2);
    t3 = t16;
    goto LAB22;

LAB23:    t1 = (t0 + 1672U);
    t5 = *((char **)t1);
    t13 = *((unsigned char *)t5);
    t14 = (t13 == (unsigned char)3);
    t4 = t14;
    goto LAB25;

LAB26:    xsi_set_current_line(37, ng0);
    t1 = (t0 + 2408U);
    t10 = *((char **)t1);
    t20 = *((int *)t10);
    t21 = (t20 - 1);
    t1 = (t0 + 2408U);
    t11 = *((char **)t1);
    t1 = (t11 + 0);
    *((int *)t1) = t21;
    xsi_set_current_line(38, ng0);
    t1 = (t0 + 2528U);
    t2 = *((char **)t1);
    t1 = (t0 + 2408U);
    t5 = *((char **)t1);
    t20 = *((int *)t5);
    t21 = (t20 - 7);
    t6 = (t21 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, t20);
    t9 = (16U * t6);
    t22 = (0 + t9);
    t1 = (t2 + t22);
    t7 = (t24 + 0U);
    t10 = (t7 + 0U);
    *((int *)t10) = 15;
    t10 = (t7 + 4U);
    *((int *)t10) = 0;
    t10 = (t7 + 8U);
    *((int *)t10) = -1;
    t25 = (0 - 15);
    t26 = (t25 * -1);
    t26 = (t26 + 1);
    t10 = (t7 + 12U);
    *((unsigned int *)t10) = t26;
    t10 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t23, t1, t24, 1);
    t11 = (t0 + 2528U);
    t18 = *((char **)t11);
    t11 = (t0 + 2408U);
    t19 = *((char **)t11);
    t27 = *((int *)t19);
    t28 = (t27 - 7);
    t26 = (t28 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, t27);
    t29 = (16U * t26);
    t30 = (0 + t29);
    t11 = (t18 + t30);
    t31 = (t23 + 12U);
    t32 = *((unsigned int *)t31);
    t33 = (1U * t32);
    memcpy(t11, t10, t33);
    goto LAB10;

LAB28:    t1 = (t0 + 1832U);
    t7 = *((char **)t1);
    t15 = *((unsigned char *)t7);
    t16 = (t15 == (unsigned char)3);
    t3 = t16;
    goto LAB30;

LAB31:    t1 = (t0 + 1672U);
    t5 = *((char **)t1);
    t13 = *((unsigned char *)t5);
    t14 = (t13 == (unsigned char)2);
    t4 = t14;
    goto LAB33;

}


extern void work_a_2365484624_2699141630_init()
{
	static char *pe[] = {(void *)work_a_2365484624_2699141630_p_0};
	xsi_register_didat("work_a_2365484624_2699141630", "isim/Simulacion_isim_beh.exe.sim/work/a_2365484624_2699141630.didat");
	xsi_register_executes(pe);
}
