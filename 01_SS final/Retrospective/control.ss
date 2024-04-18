#V3.30.14.08-safe;_2019_12_02;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.0
#Stock Synthesis (SS) is a work of the U.S. Government and is not subject to copyright protection in the United States.
#Foreign copyrights may apply. See copyright.txt for more information.
#_user_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_user_info_available_at:https://vlab.ncep.noaa.gov/group/stock-synthesis
#_data_and_control_files: data.ss // control.ss
0  # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters
1  #_N_Growth_Patterns (Growth Patterns, Morphs, Bio Patterns, GP are terms used interchangeably in SS)
1 #_N_platoons_Within_GrowthPattern 
#_Cond 1 #_Platoon_between/within_stdev_ratio (no read if N_platoons=1)
#_Cond  1 #vector_platoon_dist_(-1_in_first_val_gives_normal_approx)
#
4 # recr_dist_method for parameters:  2=main effects for GP, Area, Settle timing; 3=each Settle entity; 4=none (only when N_GP*Nsettle*pop==1)
1 # not yet implemented; Future usage: Spawner-Recruitment: 1=global; 2=by area
1 #  number of recruitment settlement assignments 
0 # unused option
#GPattern month  area  age (for each settlement assignment)
 1 1 1 0
#
#_Cond 0 # N_movement_definitions goes here if Nareas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10
#
0 #_Nblock_Patterns
#_Cond 0 #_blocks_per_pattern 
# begin and end years of blocks
#
# controls for all timevary parameters 
1 #_env/block/dev_adjust_method for all time-vary parms (1=warn relative to base parm bounds; 3=no bound check)
#
# AUTOGEN
 1 1 1 1 1 # autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex
# where: 0 = autogen time-varying parms of this category; 1 = read each time-varying parm line; 2 = read then autogen if parm min==-12345
#
#_Available timevary codes
#_Block types: 0: P_block=P_base*exp(TVP); 1: P_block=P_base+TVP; 2: P_block=TVP; 3: P_block=P_block(-1) + TVP
#_Block_trends: -1: trend bounded by base parm min-max and parms in transformed units (beware); -2: endtrend and infl_year direct values; -3: end and infl as fraction of base range
#_EnvLinks:  1: P(y)=P_base*exp(TVP*env(y));  2: P(y)=P_base+TVP*env(y);  3: null;  4: P(y)=2.0/(1.0+exp(-TVP1*env(y) - TVP2))
#_DevLinks:  1: P(y)*=exp(dev(y)*dev_se;  2: P(y)+=dev(y)*dev_se;  3: random walk;  4: zero-reverting random walk with rho;  21-24 keep last dev for rest of years
#
#_Prior_codes:  0=none; 6=normal; 1=symmetric beta; 2=CASAL's beta; 3=lognormal; 4=lognormal with biascorr; 5=gamma
#
# setup for M, growth, maturity, fecundity, recruitment distibution, movement 
#
0 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
  #_no additional input for selected M option; read 1P per morph
#
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K_incr; 4=age_specific_K_decr; 5=age_specific_K_each; 6=NA; 7=NA; 8=growth cessation
3 #_Age(post-settlement)_for_L1;linear growth below this
32 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0  #_placeholder for future growth feature
#
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
#
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
2 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
1 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
# Sex: 1  BioPattern: 1  NatMort
 0.001 2 0.101 0.101 99 0 -2 0 0 0 0 0 0 0 # NatM_p_1_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 0 60 51.6 51.6 99 0 -4 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 40 120 76.5 76.5 99 0 -2 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
 0.05 0.4 0.136 0.136 99 0 -4 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 0.01 0.5 0.12 0.12 99 0 -3 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
 0.01 0.5 0.12 0.12 99 0 -3 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
# Sex: 1  BioPattern: 1  WtLen
 0 4 1.18e-005 1.18e-005 99 0 -3 0 0 0 0 0 0 0 # Wtlen_1_Fem_GP_1
 0 4 3.043 3.043 99 0 -3 0 0 0 0 0 0 0 # Wtlen_2_Fem_GP_1
# Sex: 1  BioPattern: 1  Maturity&Fecundity
 30 50 44.8 44.8 99 0 -3 0 0 0 0 0 0 0 # Mat50%_Fem_GP_1
 -6 0 -3.44 -3.44 99 0 -3 0 0 0 0 0 0 0 # Mat_slope_Fem_GP_1
 0 3 1 1 99 0 -3 0 0 0 0 0 0 0 # Eggs/kg_inter_Fem_GP_1
 0 3 0 0 99 0 -3 0 0 0 0 0 0 0 # Eggs/kg_slope_wt_Fem_GP_1
# Hermaphroditism
#  Recruitment Distribution  
#  Cohort growth dev base
 0.1 10 1 1 1 0 -1 0 0 0 0 0 0 0 # CohortGrowDev
#  Movement
#  Age Error from parameters
#  catch multiplier
#  fraction female, by GP
 0.0001 0.9999 0.5 0.5 0.5 0 -99 0 0 0 0 0 0 0 # FracFemale_GP_1
#
#_no timevary MG parameters
#
#_seasonal_effects_on_biology_parms
 0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
3 #_Spawner-Recruitment; Options: 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepherd_3Parm; 9=RickerPower_3parm
0  # 0/1 to use steepness in initial equ recruitment calculation
0  #  future feature:  0/1 to make realized sigmaR a function of SR curvature
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn #  parm_name
             3             6       3.92094        4.3157            99             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
           0.2             1          0.81          0.81            99             0         -4          0          0          0          0          0          0          0 # SR_BH_steep
             0             2          0.39          0.39            99             0         -3          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0            99             0         -1          0          0          0          0          0          0          0 # SR_regime
             0             0             0             0            99             0         -1          0          0          0          0          0          0          0 # SR_autocorr
#_no timevary SR parameters
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1948 # first year of main recr_devs; early devs can preceed this era
2022 # last year of main recr_devs; forecast devs start in following year
2 #_recdev phase 
1 # (0/1) to read 13 advanced options
 -10 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 1 #_recdev_early_phase
 0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1938.8 #_last_yr_nobias_adj_in_MPD; begin of ramp
 1964.4 #_first_yr_fullbias_adj_in_MPD; begin of plateau
 1990.6 #_last_yr_fullbias_adj_in_MPD
 2017.3 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS sets bias_adj to 0.0 for fcast yrs)
 0.445 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
 0 #_period of cycles in recruitment (N parms read below)
 -10 #min rec_dev
 10 #max rec_dev
 0 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
#
# all recruitment deviations
#  1938E 1939E 1940E 1941E 1942E 1943E 1944E 1945E 1946E 1947E 1948R 1949R 1950R 1951R 1952R 1953R 1954R 1955R 1956R 1957R 1958R 1959R 1960R 1961R 1962R 1963R 1964R 1965R 1966R 1967R 1968R 1969R 1970R 1971R 1972R 1973R 1974R 1975R 1976R 1977R 1978R 1979R 1980R 1981R 1982R 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013R 2014R 2015R 2016R 2017R 2018R 2019R 2020R 2021R 2022R 2023F 2024F
#  0.00683901 0.0159151 0.0284807 0.0453251 0.068638 0.10343 0.158284 0.23975 0.22396 -0.0179261 0.0292155 -0.0601746 -0.047441 -0.107031 -0.227881 -0.277715 -0.388698 -0.404067 -0.345393 -0.39286 -0.385106 -0.336944 -0.329464 -0.321666 -0.347999 -0.260585 -0.1568 -0.186839 -0.245396 -0.0791188 -0.0138995 -0.00481089 0.307206 0.218064 -0.135351 -0.265528 -0.0300582 0.200429 -0.0905276 -0.142963 0.0350922 -0.104636 0.0747435 -0.105267 0.449871 0.203984 0.0459243 -0.312049 -0.291399 -0.0245998 0.589745 -0.259799 -0.148272 -0.1313 -0.183089 -0.265656 -0.0834876 0.192826 0.0653765 -0.0806192 -0.0730515 -0.169059 -0.150741 -0.0454051 0.333535 0.752 0.410418 0.199676 0.03076 0.0593396 0.270343 0.238759 0.425126 0.424439 0.278727 0.85897 0.587573 0.183297 0.305354 0.229056 0.120852 -0.0171794 -0.0414575 -0.0474579 -0.00186002 0 0
# implementation error by year in forecast:  0
#
#Fishing Mortality info 
0.1 # F ballpark
-1948 # F ballpark year (neg value to disable)
2 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
4 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
 0.05 4 0 # overall start F value; overall phase; N detailed inputs to read
#Fleet Yr Seas F_value se phase (for detailed setup of F_Method=2; -Yr to fill remaining years)

#
#_initial_F_parms; count = 1
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
 0.001 0.5 0.110311 0.1 99 0 1 # InitF_seas_1_flt_1Catch_Com_DSH
#2024 2074
# F rates by fleet
# Yr:  1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023 2024
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# Catch_Com_DSH 0.0616791 0.0484678 0.0322476 0.0219158 0.0331278 0.0295759 0.0214583 0.018516 0.0252031 0.0501576 0.0398819 0.0258832 0.0246077 0.0228455 0.034434 0.0374983 0.0623502 0.0354714 0.0423037 0.04259 0.0364249 0.0421771 0.0350194 0.0354112 0.0341956 0.046318 0.0530381 0.040229 0.035737 0.0374179 0.0417401 0.0543235 0.0483613 0.0560392 0.0680852 0.0895059 0.10061 0.0346455 0.0575335 0.0332299 0.245941 0.177492 0.0796535 0.06285 0.061723 0.054997 0.0520667 0.0471438 0.0369252 0.042488 0.0384844 0.0647438 0.0585239 0.0334835 0.0366602 0.0269706 0.0481473 0.0358455 0.0283862 0.0314962 0.0417522 0.0425569 0.0521067 0.0470837 0.045316 0.0445188 0.0322671 0.0355641 0.0375473 0.0422711 0.0166394 0.0231776 0.0123088 0.0175005 0.0162741 0.0139839 0.0166394
# Catch_Com_ISH 0.00511582 0.00392701 0.00316849 0.00373767 0.00406773 0.00977615 0.0107034 0.0131645 0.0132473 0.00665229 0.00411353 0.00224359 0.00281094 0.00347005 0.00423269 0.0039083 0.000618496 0.000315423 1.51445e-005 0.000507479 4.40774e-005 2.14061e-005 9.68028e-006 1.24834e-005 2.06736e-005 6.58308e-005 0.000107347 0.000916968 0.00389551 0.00429442 0.00994762 0.00224166 0.000677497 0.000327161 0.000382761 0.000776788 0.000147147 0.000312476 0.00518519 0.00354392 0.00654507 0.00207456 0.00321079 0.00778162 0.0104555 0.00341572 0.00811171 0.0034673 0.00616176 0.0123092 0.00959912 0.00795413 0.00887442 0.01057 0.00659957 0.00436089 0.00513647 0.00326297 0.00533136 0.00607277 0.00667503 0.00536738 0.00851305 0.00884873 0.00927884 0.00865013 0.00541721 0.0052934 0.00454153 0.00656776 0.00659143 0.00629379 0.00305325 0.00190093 0.00268989 0.00148026 0.00659143
# Catch_Com_Trol 5.02672e-005 0.000300029 2.76457e-006 2.03318e-005 2.87631e-005 0 0 9.83327e-006 5.25398e-006 5.39847e-006 0 0 0 0 2.73254e-005 2.432e-005 0 0 0 5.16774e-005 3.68171e-005 7.91153e-006 0 2.19091e-005 0.000165842 0.000134389 0.000210456 0.000679667 0.000819674 0.00106848 0.000203976 0.000549464 0.000906526 0.000400242 0.000825816 0.00183789 0.000718832 0.000165095 0.000920198 0.00089675 0.00387344 0.00268518 0.004917 0.00442575 0.00153591 0.00108218 0.000564614 0.00126085 0.00141264 0.00103672 0.00078991 0.000937591 0.00128087 0.00242131 0.000987512 0.0039896 0.00589599 0.00638213 0.0044551 0.00491735 0.00720797 0.0030529 0.00502706 0.00337408 0.00548587 0.00604864 0.00595836 0.00404527 0.00630868 0.00644389 0.00388091 0.00325045 0.0019053 0.00297101 0.00175899 0.00163759 0.00388091
# Catch_Com_Other 0.00151184 0.00117354 0.000728336 0.00100902 0.000663066 0.00106119 0.00154101 0.00852335 0.00081532 0.000594971 0.000629695 0.000716635 0.00122008 0.000588091 0.00255422 0.00110218 0.000400076 0.000303509 0.000186861 0.000172011 0.000501955 0.000821325 0.000333925 0.000400354 0.000262304 0.000223803 0.000229142 0.000362014 0.00089186 0.00197835 0.00207071 0.001438 0.00101513 0.00167236 0.001202 0.00238793 0.00113152 0.00041246 0.00690784 0.00107484 0.00495473 0.00107858 0.00155143 0.00189978 0.00150635 0.00175052 0.00123232 0.000973026 0.00133863 0.000972748 0.00128998 0.0013635 0.000967187 0.000901311 0.00210368 0.00159291 0.00219943 0.00255058 0.00251962 0.00196055 0.00189491 0.00260107 0.00544203 0.00391431 0.00502582 0.00636688 0.00701825 0.00662318 0.00785494 0.00552107 0.0056054 0.00657623 0.00332995 0.00371326 0.00244564 0.00290493 0.0056054
# Catch_Rec 0.00984132 0.00957518 0.0092945 0.0092851 0.00912372 0.00899453 0.00896727 0.00970856 0.0102844 0.0111815 0.0122307 0.0127649 0.0132699 0.0137325 0.0145527 0.0149856 0.0160073 0.0165693 0.0168876 0.0171244 0.0176142 0.0179732 0.0182285 0.0185637 0.0186272 0.0185912 0.0191987 0.0201001 0.020589 0.020005 0.0208604 0.0221842 0.0226708 0.0227926 0.0229265 0.0236926 0.0233359 0.0219628 0.0216802 0.0216943 0.0253708 0.0299334 0.0297399 0.0293312 0.0304606 0.0314441 0.031876 0.0319554 0.0314871 0.0306901 0.0292374 0.0292347 0.0304796 0.0310946 0.0307856 0.0230521 0.0331627 0.0377473 0.0151899 0.0183455 0.00984356 0.00451388 0.0194098 0.0032331 0.0125452 0.0146228 0.0153042 0.0137558 0.00692617 0.0245546 0.0337491 0.0150349 0.0131134 0.0253324 0.0345995 0.0354169 0.0337491
#
#_Q_setup for fleets with cpue or survey data
#_1:  fleet number
#_2:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm; 4=mirror with offset, 2 parm)
#_3:  extra input for link, i.e. mirror fleet# or dev index number
#_4:  0/1 to select extra sd parameter
#_5:  0/1 for biasadj or not
#_6:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         6         1         0         0         0         0  #  CPUE_DSH_old
         7         1         0         0         0         0  #  CPUE_DSH_recent
         8         1         0         0         0         0  #  CPUE_ISH_recent
         9         1         0         0         0         0  #  CPUE_Trol_recent
        10         1         0         0         0         0  #  OPUE_Divers
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -10             0      -4.32282             0             1             0          1          0          0          0          0          0          0          0  #  LnQ_base_CPUE_DSH_old(6)
           -15             0      -6.42908             0             2             0          1          0          0          0          0          0          0          0  #  LnQ_base_CPUE_DSH_recent(7)
           -10             0      -6.49689             0             2             0          1          0          0          0          0          0          0          0  #  LnQ_base_CPUE_ISH_recent(8)
           -15             0      -9.35526             0             2             0          1          0          0          0          0          0          0          0  #  LnQ_base_CPUE_Trol_recent(9)
           -15             0      -8.52533             0             2             0          1          0          0          0          0          0          0          0  #  LnQ_base_OPUE_Divers(10)
#_no timevary Q parameters
#
#_size_selex_patterns
#Pattern:_0; parm=0; selex=1.0 for all sizes
#Pattern:_1; parm=2; logistic; with 95% width specification
#Pattern:_5; parm=2; mirror another size selex; PARMS pick the min-max bin to mirror
#Pattern:_15; parm=0; mirror another age or length selex
#Pattern:_6; parm=2+special; non-parm len selex
#Pattern:_43; parm=2+special+2;  like 6, with 2 additional param for scaling (average over bin range)
#Pattern:_8; parm=8; New doublelogistic with smooth transitions and constant above Linf option
#Pattern:_9; parm=6; simple 4-parm double logistic with starting length; parm 5 is first length; parm 6=1 does desc as offset
#Pattern:_21; parm=2+special; non-parm len selex, read as pairs of size, then selex
#Pattern:_22; parm=4; double_normal as in CASAL
#Pattern:_23; parm=6; double_normal where final value is directly equal to sp(6) so can be >1.0
#Pattern:_24; parm=6; double_normal with sel(minL) and sel(maxL), using joiners
#Pattern:_25; parm=3; exponential-logistic in size
#Pattern:_27; parm=3+special; cubic spline 
#Pattern:_42; parm=2+special+3; // like 27, with 2 additional param for scaling (average over bin range)
#_discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all_discarded_dead;_4=define_dome-shaped_retention
#_Pattern Discard Male Special
 1 0 0 0 # 1 Catch_Com_DSH
 1 0 0 0 # 2 Catch_Com_ISH
 1 0 0 0 # 3 Catch_Com_Trol
 1 0 0 0 # 4 Catch_Com_Other
 1 0 0 0 # 5 Catch_Rec
 5 0 0 1 # 6 CPUE_DSH_old
 5 0 0 1 # 7 CPUE_DSH_recent
 5 0 0 2 # 8 CPUE_ISH_recent
 5 0 0 3 # 9 CPUE_Trol_recent
 5 0 0 3 # 10 OPUE_Divers
#
#_age_selex_patterns
#Pattern:_0; parm=0; selex=1.0 for ages 0 to maxage
#Pattern:_10; parm=0; selex=1.0 for ages 1 to maxage
#Pattern:_11; parm=2; selex=1.0  for specified min-max age
#Pattern:_12; parm=2; age logistic
#Pattern:_13; parm=8; age double logistic
#Pattern:_14; parm=nages+1; age empirical
#Pattern:_15; parm=0; mirror another age or length selex
#Pattern:_16; parm=2; Coleraine - Gaussian
#Pattern:_17; parm=nages+1; empirical as random walk  N parameters to read can be overridden by setting special to non-zero
#Pattern:_41; parm=2+nages+1; // like 17, with 2 additional param for scaling (average over bin range)
#Pattern:_18; parm=8; double logistic - smooth transition
#Pattern:_19; parm=6; simple 4-parm double logistic with starting age
#Pattern:_20; parm=6; double_normal,using joiners
#Pattern:_26; parm=3; exponential-logistic in age
#Pattern:_27; parm=3+special; cubic spline in age
#Pattern:_42; parm=2+special+3; // cubic spline; with 2 additional param for scaling (average over bin range)
#_Pattern Discard Male Special
 0 0 0 0 # 1 Catch_Com_DSH
 0 0 0 0 # 2 Catch_Com_ISH
 0 0 0 0 # 3 Catch_Com_Trol
 0 0 0 0 # 4 Catch_Com_Other
 0 0 0 0 # 5 Catch_Rec
 0 0 0 0 # 6 CPUE_DSH_old
 0 0 0 0 # 7 CPUE_DSH_recent
 0 0 0 0 # 8 CPUE_ISH_recent
 0 0 0 0 # 9 CPUE_Trol_recent
 0 0 0 0 # 10 OPUE_Divers
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
# 1   Catch_Com_DSH LenSelex
            40            80       53.0903          51.6            99             0          2          0          0          0          0          0          0          0  #  Size_inflection_Catch_Com_DSH(1)
             5            40       20.3013          16.5            99             0          3          0          0          0          0          0          0          0  #  Size_95%width_Catch_Com_DSH(1)
# 2   Catch_Com_ISH LenSelex
             5            90          34.9          34.9            99             0         -2          0          0          0          0          0          0          0  #  Size_inflection_Catch_Com_ISH(2)
             5            90           9.9           9.9            99             0         -3          0          0          0          0          0          0          0  #  Size_95%width_Catch_Com_ISH(2)
# 3   Catch_Com_Trol LenSelex
             5            90          47.1          47.1            99             0         -2          0          0          0          0          0          0          0  #  Size_inflection_Catch_Com_Trol(3)
             5            90          13.6          13.6            99             0         -3          0          0          0          0          0          0          0  #  Size_95%width_Catch_Com_Trol(3)
# 4   Catch_Com_Other LenSelex
             5            90            35            35            99             0         -2          0          0          0          0          0          0          0  #  Size_inflection_Catch_Com_Other(4)
             5            90          13.5          13.5            99             0         -3          0          0          0          0          0          0          0  #  Size_95%width_Catch_Com_Other(4)
# 5   Catch_Rec LenSelex
             5            90          36.3          36.3            99             0         -2          0          0          0          0          0          0          0  #  Size_inflection_Catch_Rec(5)
             5            90          14.4          14.4            99             0         -3          0          0          0          0          0          0          0  #  Size_95%width_Catch_Rec(5)
# 6   CPUE_DSH_old LenSelex
            -1            -1            -1            -1            99             0         -4          0          0          0          0          0          0          0  #  SizeSel_P1_CPUE_DSH_old(6)
            -1            -1            -1            -1            99             0         -4          0          0          0          0          0          0          0  #  SizeSel_P2_CPUE_DSH_old(6)
# 7   CPUE_DSH_recent LenSelex
            -1            -1            -1            -1            99             0         -4          0          0          0          0          0          0          0  #  SizeSel_P1_CPUE_DSH_recent(7)
            -1            -1            -1            -1            99             0         -4          0          0          0          0          0          0          0  #  SizeSel_P2_CPUE_DSH_recent(7)
# 8   CPUE_ISH_recent LenSelex
            -1            -1            -1            -1            99             0         -4          0          0          0          0          0          0          0  #  SizeSel_P1_CPUE_ISH_recent(8)
            -1            -1            -1            -1            99             0         -4          0          0          0          0          0          0          0  #  SizeSel_P2_CPUE_ISH_recent(8)
# 9   CPUE_Trol_recent LenSelex
            -1            -1            -1            -1            99             0         -4          0          0          0          0          0          0          0  #  SizeSel_P1_CPUE_Trol_recent(9)
            -1            -1            -1            -1            99             0         -4          0          0          0          0          0          0          0  #  SizeSel_P2_CPUE_Trol_recent(9)
# 10   OPUE_Divers LenSelex
            -1            -1            -1            -1            99             0         -4          0          0          0          0          0          0          0  #  SizeSel_P1_OPUE_Divers(10)
            -1            -1            -1            -1            99             0         -4          0          0          0          0          0          0          0  #  SizeSel_P2_OPUE_Divers(10)
# 1   Catch_Com_DSH AgeSelex
# 2   Catch_Com_ISH AgeSelex
# 3   Catch_Com_Trol AgeSelex
# 4   Catch_Com_Other AgeSelex
# 5   Catch_Rec AgeSelex
# 6   CPUE_DSH_old AgeSelex
# 7   CPUE_DSH_recent AgeSelex
# 8   CPUE_ISH_recent AgeSelex
# 9   CPUE_Trol_recent AgeSelex
# 10   OPUE_Divers AgeSelex
#_no timevary selex parameters
#
0   #  use 2D_AR1 selectivity(0/1):  experimental feature
#_no 2D_AR1 selex offset used
#
# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read and autogen if tag data exist; 1=read
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
# no timevary parameters
#
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
      1      6       0.1
      1      7       0.1
      1      8       0.1
      1      9       0.1
      1     10       0.1
 -9999   1    0  # terminator
#
5 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 7 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark; 18=initEQregime
#like_comp fleet  phase  value  sizefreq_method
 1 6 1 1 1
 1 7 1 1 1
 1 8 1 1 1
 1 9 1 1 1
 1 10 1 1 1
 6 1 1 1 1
 9 1 1 0 1
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  0 0 0 0 0 #_CPUE/survey:_1
#  0 0 0 0 0 #_CPUE/survey:_2
#  0 0 0 0 0 #_CPUE/survey:_3
#  0 0 0 0 0 #_CPUE/survey:_4
#  0 0 0 0 0 #_CPUE/survey:_5
#  1 1 1 1 1 #_CPUE/survey:_6
#  1 1 1 1 1 #_CPUE/survey:_7
#  1 1 1 1 1 #_CPUE/survey:_8
#  1 1 1 1 1 #_CPUE/survey:_9
#  1 1 1 1 1 #_CPUE/survey:_10
#  1 1 1 1 1 #_sizefreq:_1
#  0 0 0 0 0 #_init_equ_catch
#  1 1 1 1 1 #_recruitments
#  1 1 1 1 1 #_parameter-priors
#  1 1 1 1 1 #_parameter-dev-vectors
#  1 1 1 1 1 #_crashPenLambda
#  0 0 0 0 0 # F_ballpark_lambda
0 # (0/1) read specs for more stddev reporting 
 # 0 0 0 0 0 0 0 0 0 # placeholder for # selex_fleet, 1=len/2=age/3=both, year, N selex bins, 0 or Growth pattern, N growth ages, 0 or NatAge_area(-1 for all), NatAge_yr, N Natages
 # placeholder for vector of selex bins to be reported
 # placeholder for vector of growth ages to be reported
 # placeholder for vector of NatAges ages to be reported
999

