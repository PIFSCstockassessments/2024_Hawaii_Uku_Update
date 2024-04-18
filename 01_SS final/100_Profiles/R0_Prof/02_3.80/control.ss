#V3.30.05.03
#_data_and_control_files: data.ss_new // control.ss_new
#_SS-V3.30.05.03-trans;_2017_07_05;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.6
#_SS-V3.30.05.03-trans;user_support_available_at:NMFS.Stock.Synthesis@noaa.gov
0 # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters
1 #_N_Growth_Patterns
1 #_N_platoons_Within_GrowthPattern 
#_Cond 1 #_Morph_between/within_stdev_ratio (no read if N_morphs=1)
#_Cond  1 #vector_Morphdist_(-1_in_first_val_gives_normal_approx)
4 # recr_dist_method for parameters:  2=main effects for GP, Settle timing, Area; 3=each Settle entity; 4=none when N_GP*Nsettle*pop==1
1 # not yet implemented; Future usage: Spawner-Recruitment: 1=global; 2=by area
1 # number of recruitment settlement assignments 
0 # unused option
#GPattern month  area  age (for each settlement assignment)
 1 1 1 0
#_Cond 0 # N_movement_definitions goes here if Nareas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10
#
0 #_Nblock_Patterns
#_blocks_per_pattern 
# begin and end years of blocks
# controls for all timevary parameters 
1 #_env/block/dev_adjust_method for all time-vary parms (1=warn relative to base parm bounds; 3=no bound check)
#  autogen
1 1 1 1 1 # autogen
# where: 0 = autogen all time-varying parms; 1 = read each time-varying parm line; 2 = read then autogen if min=-12345
# setup for M, growth, maturity, fecundity, recruitment distibution, movement 
0 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
#No Additional input for selected M option; read 1P per morph
1  # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K; 4=not implemented
3  #_Growth_Age_for_L1
32 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (fixed at 0.2 in 3.24; value should approx initial Z; -999 replicates 3.24)
0  #_placeholder for future growth feature
0  #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0  #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=read fec and wt from wtatage.ss
#_placeholder for empirical age-maturity by growth pattern  
2 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option; 0=none; 1=age-specific fxn
1 #_parameter_offset_approach (1=none, 2=M,G,CV_G as offset from female GP1, 2=like SS2 v1.x)
#
#_growth_parms
#_ LO     HI    INIT  PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
 0.001     2   0.101  0.101    99    0    -2 0 0 0 0 0 0 0 # NatM_p_1_Fem_GP_1
 0        60    51.6   51.6    99    0    -4 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 40      120    76.5   76.5    99    0    -2 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
 0.05    0.4   0.136  0.136    99    0    -4 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 0.01    0.5    0.12   0.12    99    0    -3 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
 0.01    0.5    0.12   0.12    99    0    -3 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
 0         4 1.18e-5  1.18e-5  99    0    -3 0 0 0 0 0 0 0 # Wtlen_1_Fem
 0         4   3.043  3.043    99    0    -3 0 0 0 0 0 0 0 # Wtlen_2_Fem
 30       50    44.8   44.8    99    0    -3 0 0 0 0 0 0 0 # Mat50%_Fem
 -6        0   -3.44  -3.44    99    0    -3 0 0 0 0 0 0 0 # Mat_slope_Fem
 0         3       1      1    99    0    -3 0 0 0 0 0 0 0 # Eggs/kg_inter_Fem
 0         3       0      0    99    0    -3 0 0 0 0 0 0 0 # Eggs/kg_slope_wt_Fem
 1         1       1      1     1    0    -1 0 0 0 0 0 0 0 # CohortGrowDev
 0.0001 0.9999   0.5    0.5   0.5    0   -99 0 0 0 0 0 0 0 # FracFemale_GP_1
#
#_seasonal_effects_on_biology_parms
 0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
#_Cond  -4  #_MGparm_Dev_Phase  
#  
#_Spawner-Recruitment
3 #_SR_function: 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepard_3Parm
0 # 0/1 to use steepness in initial equ recruitment calculation
0 #  future feature:  0/1 to make realized sigmaR a function of SR curvature
#_    LO   HI    INIT   PRIOR   PR_SD    PR_type   PHASE env-var use_dev   dev_mnyr   dev_mxyr  dev_PH   Block Blk_Fxn #  parm_name
    3   6       4.3157   4.3157 99    0    -1    0    0    0    0    0    0    0 # SR_LN(R0)
  0.2    1       0.81    0.81   99    0   -4    0    0    0    0    0    0    0 # SR_BH_steep
    0    2       0.39    0.39   99    0   -3    0    0    0    0    0    0    0 # SR_sigmaR
   -5    5          0       0   99    0   -1    0    0    0    0    0    0    0 # SR_regime
    0    0          0       0   99    0   -1    0    0    0    0    0    0    0 # SR_autocorr
1 #do_recdev:  0=none; 1=devvector; 2=simple deviations
1948 # first year of main recr_devs; early devs can preceed this era
2022 # last year of main recr_devs; forecast devs start in following year
2 #_recdev phase 
1 # (0/1) to read 13 advanced options
-10  #_recdev_early_start (0=none; neg value makes relative to recdev_start)
1 #_recdev_early_phase
0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
1 #_lambda for Fcast_recr_like occurring before endyr+1
1938.8   #_last_early_yr_nobias_adj_in_MPD 
1964.4   #_first_yr_fullbias_adj_in_MPD 
1990.6   #_last_yr_fullbias_adj_in_MPD 
2017.3   #_first_recent_yr_nobias_adj_in_MPD 
0.445  #_max_bias_adj_in_MPD (1.0 to mimic pre-2009 models) 
0   #_period of cycles in recruitment (N parms read below)
-10 #min rec_dev
10  #max rec_dev
0   #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
#
#Fishing Mortality info 
0.1   # F ballpark
-1948 # F ballpark year (neg value to disable)
#
2 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
4 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
0.05 4 0 # if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
#4 # N iterations for tuning F in hybrid method (recommend 3 to 7)
#
#_initial_F_parms; count = 1
#_  LO  HI INIT  PRIOR PR_SD  PR_type  PHASE
 0.001   0.5 0.12 0.1 99  0   1 # InitF_seas_1_flt_Com
#
#_Q_setup
#_1:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm)
#_2:  extra input for link, i.e. mirror fleet
#_3:  0/1 to select extra sd parameter
#_4:  0/1 for biasadj or not
#_5:  0/1 to float
#_   fleet   link link_info  extra_se   biasadj  float  #  fleetname
   1   1   0   0   0   0  #  CPUE_DSH_old
   2   1   0   0   0   0  #  CPUE_DSH_recent
   3   1   0   0   0   0  #  CPUE_ISH_recent
   4   1   0   0   0   0  #  CPUE_Trol_recent
   7  1   0   0   0   0  #  OPUE_Divers
-9999 0 0 0 0 0
#
#_Cond  0 #_If q has random component then 0=read one parm for each fleet with random q; 1=read a parm for each year of index     
#_Q_parms(if_any);Qunits_are_ln(q)
#_    LO   HI    INIT PRIOR PR_SD PR_type PHASE env-var use_dev   dev_mnyr   dev_mxyr  dev_PH   Block Blk_Fxn  #  parm_name
     -10   0     -5    0    1    0   1    0    0    0    0    0    0    0  #  LnQ_base_CPUE_DSH_old(1)
     -15   0     -7    0    2    0   1    0    0    0    0    0    0    0  #  LnQ_base_CPUE_DSH_recent(2)
     -10   0     -7    0    2    0   1    0    0    0    0    0    0    0  #  LnQ_base_CPUE_ISH_recent(3)
     -15   0     -11   0    2    0   1    0    0    0    0    0    0    0  #  LnQ_base_CPUE_Trol_recent(4)
     -15   0     -10   0    2    0   1    0    0    0    0    0    0    0  #  LnQ_base_OPUE_Divers(7)    
#
#_size_selex_types
#_Pattern Discard Male Special
  1    0 0 0  # 1 Com_Deep_Old
  5    0 0 1  # 2 Com_Deep_Recent
  1    0 0 0  # 3 Com_Inshore
  1    0 0 0  # 4 Com_Trolling
  1    0 0 0  # 5 Com_Other
  1    0 0 0  # 6 Rec catch
  5    0 0 4  # 7 OPUE_Divers
#
#_age_selex_types
#_Pattern Discard Male Special
  0    0 0    0 # 1 Com_Deep_Old
  0    0 0    0 # 1 Com_Deep_Recent
  0    0 0    0 # 2 Com_Inshore 
  0    0 0    0 # 3 Com_Trolling 
  0    0 0    0 # 4 Com_Other 
  0    0 0    0 # 5 Rec 
  0    0 0    0 # 10 OPUE_Divers
#
#_  LO   HI    INIT   PRIOR   PR_SD    PR_type   PHASE env-var use_dev   dev_mnyr   dev_mxyr  dev_PH   Block Blk_Fxn  #  parm_name
    40   80   51.6    51.6   99    0     2    0    0    0    0    0    0    0  #  SizeSel_P1_Com_Deep(1)
    5   40   16.5    16.5   99     0     3    0    0    0    0    0    0    0  #  SizeSel_P2_Com_Deep(1)
   -1   -1      -1      -1   99    0    -4    0    0    0    0    0    0    0  #  SizeSel_P1_Com_Deep_Recent(2)
   -1   -1      -1      -1   99    0    -4    0    0    0    0    0    0    0  #  SizeSel_P2_Com_Deep_Recent(2)
    5   90    34.9    34.9   99    0    -2    0    0    0    0    0    0    0  #  SizeSel_P1_Com_Inshore(3)
    5   90    9.9     9.9    99    0    -3    0    0    0    0    0    0    0  #  SizeSel_P2_Com_Inshore(3)
    5   90    47.1    47.1   99    0    -2    0    0    0    0    0    0    0  #  SizeSel_P1_Com_Trolling(4)
    5   90    13.6    13.6   99    0    -3    0    0    0    0    0    0    0  #  SizeSel_P2_Com_Trolling(4)
    5   90    35.0    35.0   99    0    -2    0    0    0    0    0    0    0  #  SizeSel_P1_Com_Other(5)
    5   90    13.5    13.5   99    0    -3    0    0    0    0    0    0    0  #  SizeSel_P2_Com_Other(5)
    5   90    36.3    36.3   99    0    -2    0    0    0    0    0    0    0  #  SizeSel_P1_Rec(6)
    5   90    14.4    14.4   99    0    -3    0    0    0    0    0    0    0  #  SizeSel_P2_Rec(6)
   -1   -1      -1      -1   99    0    -4    0    0    0    0    0    0    0  #  SizeSel_P1_Diver(7)
   -1   -1      -1      -1   99    0    -4    0    0    0    0    0    0    0  #  SizeSel_P2_Diver(7)
#_no timevary selex parameters
#
0   #  use 2D_AR1 selectivity(0/1):  experimental feature
#_no 2D_AR1 selex offset used
#
# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read; 1=read if tags exist
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
# no timevary parameters
#
# Input variance adjustments factors: 
 #_1=add_to_survey_CV
 #_2=add_to_discard_stddev
 #_3=add_to_bodywt_CV
 #_4=mult_by_lencomp_N
 #_5=mult_by_agecomp_N
 #_6=mult_by_size-at-age_N
 #_7=mult_by_generalized_sizecomp
#_Factor  Fleet  Value
 1 1  0.1  # DSH-Old
 1 2  0.1  # DSH-Rec
 1 3  0.1  # ISH-Rec
 1 4  0.1  # TROL-Rec
 1 7 0.1  # Diver
-9999   1  0  # terminator
#
#
5 #_maxlambdaphase
1 #_sd_offset
#
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark
#like_comp fleet  phase  value  sizefreq_method
 9  1   1   1  1
 -9999   1   1   1  1  #  terminator
0 # (0/1) read specs for more stddev reporting 
# placeholder for vector of selex bins to be reported
# placeholder for vector of growth ages to be reported
# placeholder for vector of NatAges ages to be reported
999

