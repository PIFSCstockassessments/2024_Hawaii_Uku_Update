 #V3.30.05.03
#_SS-V3.30.05.03-trans;_2017_07_05;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.6
#_SS-V3.30.05.03-trans;user_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_SS-V3.30.05.03-trans;user_info_available_at:https://vlab.ncep.noaa.gov/group/stock-synthesis
#_Start_time: Tue Jun 11 13:53:55 2019
#_Number_of_datafiles: 1
#
#_observed data: 
#V3.30.05.03-trans
1948 #_StartYr
2022 #_EndYr
1    #_Nseas
12   #_months/season
2    #_Nsubseasons (even number, minimum is 2)
1    #_spawn_month
-1    #_Ngenders
32   #_Nages=accumulator age
1    #_Nareas
10    #_Nfleets (including surveys)
#_fleet_type: 1=catch fleet; 2=bycatch only fleet; 3=survey; 4=ignore 
#_survey_timing: -1=for use of catch-at-age to override the month value associated with a datum 
#_fleet_area:  area the fleet/survey operates in 
#_units of catch:  1=bio; 2=num (ignored for surveys; their units read later)
#_catch_mult: 0=no; 1=yes
#_rows are fleets
#_fleet_type timing area units need_catch_mult fleetname
           1     -1    1     1               0     Catch_Com_DSH        # 1
           1     -1    1     1               0     Catch_Com_ISH        # 2
           1     -1    1     1               0     Catch_Com_Trol       # 3
           1     -1    1     1               0     Catch_Com_Other      # 4
           1     -1    1     1               0     Catch_Rec            # 5
           3    0.5    1     2               0     CPUE_DSH_old         # 6
           3    0.5    1     2               0     CPUE_DSH_recent      # 7
           3    0.5    1     2               0     CPUE_ISH_recent      # 8
           3    0.5    1     2               0     CPUE_Trol_recent     # 9
           3    0.5    1     2               0     OPUE_Divers          #10
#_Catch data: yr, seas, fleet, catch, catch_se
#_catch_se:  standard error of log(catch); can be overridden in control file with detailed F input
-999  1     1     40.43500525 0.05  #     Com_Deep
1948  1     1     40.43500525 0.05  #     Com_Deep
1949  1     1     33.00057584 0.05  #     Com_Deep
1950  1     1     22.75371251 0.05  #     Com_Deep
1951  1     1     16.05966673 0.05  #     Com_Deep
1952  1     1     24.96164224 0.05  #     Com_Deep
1953  1     1     22.62639128 0.05  #     Com_Deep
1954  1     1     16.55247926 0.05  #     Com_Deep
1955  1     1     14.26410762 0.05  #     Com_Deep
1956  1     1     19.19964218 0.05  #     Com_Deep
1957  1     1     37.2852624  0.05  #     Com_Deep
1958  1     1     28.79516976 0.05  #     Com_Deep
1959  1     1     18.37487505 0.05  #     Com_Deep
1960  1     1     17.23921755 0.05  #     Com_Deep
1961  1     1     15.79452703 0.05  #     Com_Deep
1962  1     1     23.37327554 0.05  #     Com_Deep
1963  1     1     24.84051229 0.05  #     Com_Deep
1964  1     1     39.97506296 0.05  #     Com_Deep
1965  1     1     22.15866623 0.05  #     Com_Deep
1966  1     1     26.08925106 0.05  #     Com_Deep
1967  1     1     26.0193979  0.05  #     Com_Deep
1968  1     1     22.10488178 0.05  #     Com_Deep
1969  1     1     25.47327313 0.05  #     Com_Deep
1970  1     1     21.25214598 0.05  #     Com_Deep
1971  1     1     21.76561212 0.05  #     Com_Deep
1972  1     1     21.46533422 0.05  #     Com_Deep
1973  1     1     29.99694614 0.05  #     Com_Deep
1974  1     1     34.92426381 0.05  #     Com_Deep
1975  1     1     26.57096577 0.05  #     Com_Deep
1976  1     1     23.64620455 0.05  #     Com_Deep
1977  1     1     24.97576746 0.05  #     Com_Deep
1978  1     1     28.04105744 0.05  #     Com_Deep
1979  1     1     36.07417176 0.05  #     Com_Deep
1980  1     1     31.82764346 0.05  #     Com_Deep
1981  1     1     36.67518116 0.05  #     Com_Deep
1982  1     1     43.90044813 0.05  #     Com_Deep
1983  1     1     56.30822421 0.05  #     Com_Deep
1984  1     1     61.51030693 0.05  #     Com_Deep
1985  1     1     21.66271487 0.05  #     Com_Deep
1986  1     1     36.75748405 0.05  #     Com_Deep
1987  1     1     21.36728864 0.05  #     Com_Deep
1988  1     1     145.1841175 0.05  #     Com_Deep
1989  1     1     90.90279948 0.05  #     Com_Deep
1990  1     1     39.30799627 0.05  #     Com_Deep
1991  1     1     32.01866927 0.05  #     Com_Deep
1992  1     1     31.22486445 0.05  #     Com_Deep
1993  1     1     13.85154959 0.05  #     Com_Deep
1994  1     1     26.28610999 0.05  #     Com_Deep
1995  1     1     23.72966548 0.05  #     Com_Deep
1996  1     1     18.60816274 0.05  #     Com_Deep
1997  1     1     21.62560641 0.05  #     Com_Deep
1998  1     1     20.01635272 0.05  #     Com_Deep
1999  1     1     34.49045983 0.05  #     Com_Deep
2000  1     1     30.51766976 0.05  #     Com_Deep
2001  1     1     17.48456546 0.05  #     Com_Deep
2002  1     1     20.35926373 0.05  #     Com_Deep
2003  1     1     14.26084176 0.05  #     Com_Deep
2004  1     1     25.82830866 0.05  #     Com_Deep
2005  1     1     20.2723555  0.05  #     Com_Deep
2006  1     1     17.43159953 0.05  #     Com_Deep
2007  1     1     20.66828235 0.05  #     Com_Deep
2008  1     1     28.59375929 0.05  #     Com_Deep
2009  1     1     30.21723763 0.05  #     Com_Deep
2010  1     1     37.74992204 0.05  #     Com_Deep
2011  1     1     35.08588551 0.05  #     Com_Deep
2012  1     1     34.14726758 0.05  #     Com_Deep
2013  1     1     34.60258323 0.05  #     Com_Deep
2014  1     1     25.75753923 0.05  #     Com_Deep
2015  1     1     29.52126421 0.05  #     Com_Deep
2016  1     1     33.27628023 0.05  #     Com_Deep
2017  1     1     38.81255202 0.05  #     Com_Deep
2018  1     1     15.42852365 0.05  #     Com_Deep
2019  1     1     21.85873456 0.05  #     Com_Deep
2020  1     1     11.93409624 0.05  #     Com_Deep
2021  1     1     17.19898394 0.05  #     Com_Deep
2022  1     1     15.90611066 0.05  #     Com_Deep
-999  1     2     0     0.1   #     Com_Inshore
1948  1     2     4.328628456 0.1   #     Com_Inshore
1949  1     2     3.41781572  0.1   #     Com_Inshore
1950  1     2     2.83041408  0.1   #     Com_Inshore
1951  1     2     3.43142348  0.1   #     Com_Inshore
1952  1     2     3.80790484  0.1   #     Com_Inshore
1953  1     2     9.224246912 0.1   #     Com_Inshore
1954  1     2     10.09468996 0.1   #     Com_Inshore
1955  1     2     12.30005426 0.1   #     Com_Inshore
1956  1     2     12.14719376 0.1   #     Com_Inshore
1957  1     2     5.927086664 0.1   #     Com_Inshore
1958  1     2     3.555254096 0.1   #     Com_Inshore
1959  1     2     1.90281844  0.1   #     Com_Inshore
1960  1     2     2.34960656  0.1   #     Com_Inshore
1961  1     2     2.863526296 0.1   #     Com_Inshore
1962  1     2     3.434145032 0.1   #     Com_Inshore
1963  1     2     3.101208504 0.1   #     Com_Inshore
1964  1     2     0.476725192 0.1   #     Com_Inshore
1965  1     2     0.237682208 0.1   #     Com_Inshore
1966  1     2     0.0113398   0.1   #     Com_Inshore
1967  1     2     0.377842136 0.1   #     Com_Inshore
1968  1     2     0.032658624 0.1   #     Com_Inshore
1969  1     2     0.01587572  0.1   #     Com_Inshore
1970  1     2     0.007257472 0.1   #     Com_Inshore
1971  1     2     0.009525432 0.1   #     Com_Inshore
1972  1     2     0.016329312 0.1   #     Com_Inshore
1973  1     2     0.053977448 0.1   #     Com_Inshore
1974  1     2     0.088904032 0.1   #     Com_Inshore
1975  1     2     0.753869904 0.1   #     Com_Inshore
1976  1     2     3.198277192 0.1   #     Com_Inshore
1977  1     2     3.57657292  0.1   #     Com_Inshore
1978  1     2     8.294836904 0.1   #     Com_Inshore
1979  1     2     1.847026624 0.1   #     Com_Inshore
1980  1     2     0.554289424 0.1   #     Com_Inshore
1981  1     2     0.265804912 0.1   #     Com_Inshore
1982  1     2     0.307535376 0.1   #     Com_Inshore
1983  1     2     0.609174056 0.1   #     Com_Inshore
1984  1     2     0.114305184 0.1   #     Com_Inshore
1985  1     2     0.249022008 0.1   #     Com_Inshore
1986  1     2     4.20026192  0.1   #     Com_Inshore
1987  1     2     2.851279312 0.1   #     Com_Inshore
1988  1     2     4.808528792 0.1   #     Com_Inshore
1989  1     2     1.338549992 0.1   #     Com_Inshore
1990  1     2     2.067018744 0.1   #     Com_Inshore
1991  1     2     5.111528248 0.1   #     Com_Inshore
1992  1     2     6.76305672  0.1   #     Com_Inshore
1993  1     2     1.404320832 0.1   #     Com_Inshore
1994  1     2     5.17775268  0.1   #     Com_Inshore
1995  1     2     2.193570912 0.1   #     Com_Inshore
1996  1     2     3.906334304 0.1   #     Com_Inshore
1997  1     2     7.9718794   0.1   #     Com_Inshore
1998  1     2     6.372514008 0.1   #     Com_Inshore
1999  1     2     5.3070264   0.1   #     Com_Inshore
2000  1     2     5.873109216 0.1   #     Com_Inshore
2001  1     2     6.971255448 0.1   #     Com_Inshore
2002  1     2     4.429461958 0.1   #     Com_Inshore
2003  1     2     2.927618846 0.1   #     Com_Inshore
2004  1     2     3.479549591 0.1   #     Com_Inshore
2005  1     2     2.439553854 0.1   #     Com_Inshore
2006  1     2     4.333391172 0.1   #     Com_Inshore
2007  1     2     5.211000974 0.1   #     Com_Inshore
2008  1     2     5.888848858 0.1   #     Com_Inshore
2009  1     2     4.843137862 0.1   #     Com_Inshore
2010  1     2     7.780191421 0.1   #     Com_Inshore
2011  1     2     8.270070781 0.1   #     Com_Inshore
2012  1     2     8.976177447 0.1   #     Com_Inshore
2013  1     2     8.60182797  0.1   #     Com_Inshore
2014  1     2     5.513864352 0.1   #     Com_Inshore
2015  1     2     5.742021128 0.1   #     Com_Inshore
2016  1     2     5.224291219 0.1   #     Com_Inshore
2017  1     2     7.690289486 0.1   #     Com_Inshore
2018  1     2     7.875853974 0.1   #     Com_Inshore
2019  1     2     7.459774032 0.1   #     Com_Inshore
2020  1     2     3.646607525 0.1   #     Com_Inshore
2021  1     2     2.298305305 0.1   #     Com_Inshore
2022  1     2     3.166435034 0.1   #     Com_Inshore
-999  1     3     0     0.1   #     Com_Trolling
1948  1     3     0.03855532  0.1   #     Com_Trolling
1949  1     3     0.238589392 0.1   #     Com_Trolling
1950  1     3     0.00226796  0.1   #     Com_Trolling
1951  1     3     0.017236496 0.1   #     Com_Trolling
1952  1     3     0.02494756  0.1   #     Com_Trolling
1953  1     3     0     0.1   #     Com_Trolling
1954  1     3     0     0.1   #     Com_Trolling
1955  1     3     0.008618248 0.1   #     Com_Trolling
1956  1     3     0.00453592  0.1   #     Com_Trolling
1957  1     3     0.00453592  0.1   #     Com_Trolling
1958  1     3     0     0.1   #     Com_Trolling
1959  1     3     0     0.1   #     Com_Trolling
1960  1     3     0     0.1   #     Com_Trolling
1961  1     3     0     0.1   #     Com_Trolling
1962  1     3     0.020865232 0.1   #     Com_Trolling
1963  1     3     0.01814368  0.1   #     Com_Trolling
1964  1     3     0     0.1   #     Com_Trolling
1965  1     3     0     0.1   #     Com_Trolling
1966  1     3     0     0.1   #     Com_Trolling
1967  1     3     0.035833768 0.1   #     Com_Trolling
1968  1     3     0.025401152 0.1   #     Com_Trolling
1969  1     3     0.005443104 0.1   #     Com_Trolling
1970  1     3     0     0.1   #     Com_Trolling
1971  1     3     0.015422128 0.1   #     Com_Trolling
1972  1     3     0.119748288 0.1   #     Com_Trolling
1973  1     3     0.100697424 0.1   #     Com_Trolling
1974  1     3     0.160571568 0.1   #     Com_Trolling
1975  1     3     0.518002064 0.1   #     Com_Trolling
1976  1     3     0.623689    0.1   #     Com_Trolling
1977  1     3     0.820146008 0.1   #     Com_Trolling
1978  1     3     0.157850016 0.1   #     Com_Trolling
1979  1     3     0.420026192 0.1   #     Com_Trolling
1980  1     3     0.685831104 0.1   #     Com_Trolling
1981  1     3     0.301185088 0.1   #     Com_Trolling
1982  1     3     0.6123492   0.1   #     Com_Trolling
1983  1     3     1.3311031   0.1   #     Com_Trolling
1984  1     3     0.507569448 0.1   #     Com_Trolling
1985  1     3     0.119748288 0.1   #     Com_Trolling
1986  1     3     0.682202368 0.1   #     Com_Trolling
1987  1     3     0.66678024  0.1   #     Com_Trolling
1988  1     3     2.638998256 0.1   #     Com_Trolling
1989  1     3     1.590293552 0.1   #     Com_Trolling
1990  1     3     2.826029585 0.1   #     Com_Trolling
1991  1     3     2.642602172 0.1   #     Com_Trolling
1992  1     3     0.907615092 0.1   #     Com_Trolling
1993  1     3     0.196858928 0.1   #     Com_Trolling
1994  1     3     0.33112216  0.1   #     Com_Trolling
1995  1     3     0.73481904  0.1   #     Com_Trolling
1996  1     3     0.822362296 0.1   #     Com_Trolling
1997  1     3     0.610988424 0.1   #     Com_Trolling
1998  1     3     0.477178784 0.1   #     Com_Trolling
1999  1     3     0.57152592  0.1   #     Com_Trolling
2000  1     3     0.77564232  0.1   #     Com_Trolling
2001  1     3     1.466009344 0.1   #     Com_Trolling
2002  1     3     0.606951455 0.1   #     Com_Trolling
2003  1     3     2.591008222 0.1   #     Com_Trolling
2004  1     3     3.709067143 0.1   #     Com_Trolling
2005  1     3     4.2297454   0.1   #     Com_Trolling
2006  1     3     3.232296592 0.1   #     Com_Trolling
2007  1     3     3.798424767 0.1   #     Com_Trolling
2008  1     3     5.799581953 0.1   #     Com_Trolling
2009  1     3     2.615230035 0.1   #     Com_Trolling
2010  1     3     4.221762181 0.1   #     Com_Trolling
2011  1     3     2.883302907 0.1   #     Com_Trolling
2012  1     3     4.757363614 0.1   #     Com_Trolling
2013  1     3     5.587164819 0.1   #     Com_Trolling
2014  1     3     5.532008032 0.1   #     Com_Trolling
2015  1     3     3.91563294  0.1   #     Com_Trolling
2016  1     3     6.517799526 0.1   #     Com_Trolling
2017  1     3     6.953474642 0.1   #     Com_Trolling
2018  1     3     4.311528038 0.1   #     Com_Trolling
2019  1     3     3.550173866 0.1   #     Com_Trolling
2020  1     3     2.124715646 0.1   #     Com_Trolling
2021  1     3     3.348506862 0.1   #     Com_Trolling
2022  1     3     1.961966837 0.1   #     Com_Trolling
-999  1     4     0     0.1   #     Com_Other
1948  1     4     1.270511192 0.1   #     Com_Other
1949  1     4     1.015138896 0.1   #     Com_Other
1950  1     4     0.646822192 0.1   #     Com_Other
1951  1     4     0.921245352 0.1   #     Com_Other
1952  1     4     0.617338712 0.1   #     Com_Other
1953  1     4     0.996088032 0.1   #     Com_Other
1954  1     4     1.44695848  0.1   #     Com_Other
1955  1     4     7.930602528 0.1   #     Com_Other
1956  1     4     0.745251656 0.1   #     Com_Other
1957  1     4     0.52843468  0.1   #     Com_Other
1958  1     4     0.542496032 0.1   #     Com_Other
1959  1     4     0.60554532  0.1   #     Com_Other
1960  1     4     1.01604608  0.1   #     Com_Other
1961  1     4     0.483529072 0.1   #     Com_Other
1962  1     4     2.064297192 0.1   #     Com_Other
1963  1     4     0.871350232 0.1   #     Com_Other
1964  1     4     0.307081784 0.1   #     Com_Other
1965  1     4     0.227703184 0.1   #     Com_Other
1966  1     4     0.139252744 0.1   #     Com_Other
1967  1     4     0.127459352 0.1   #     Com_Other
1968  1     4     0.370131072 0.1   #     Com_Other
1969  1     4     0.605998912 0.1   #     Com_Other
1970  1     4     0.249022008 0.1   #     Com_Other
1971  1     4     0.30390664  0.1   #     Com_Other
1972  1     4     0.205930768 0.1   #     Com_Other
1973  1     4     0.182343984 0.1   #     Com_Other
1974  1     4     0.188694272 0.1   #     Com_Other
1975  1     4     0.296195576 0.1   #     Com_Other
1976  1     4     0.729375936 0.1   #     Com_Other
1977  1     4     1.639281488 0.1   #     Com_Other
1978  1     4     1.722288824 0.1   #     Com_Other
1979  1     4     1.1793392   0.1   #     Com_Other
1980  1     4     0.825991032 0.1   #     Com_Other
1981  1     4     1.351250568 0.1   #     Com_Other
1982  1     4     0.960254264 0.1   #     Com_Other
1983  1     4     1.862902344 0.1   #     Com_Other
1984  1     4     0.8731646   0.1   #     Com_Other
1985  1     4     0.32658624  0.1   #     Com_Other
1986  1     4     5.56103792  0.1   #     Com_Other
1987  1     4     0.860010432 0.1   #     Com_Other
1988  1     4     3.622839304 0.1   #     Com_Other
1989  1     4     0.692634984 0.1   #     Com_Other
1990  1     4     0.990644928 0.1   #     Com_Other
1991  1     4     1.240120528 0.1   #     Com_Other
1992  1     4     0.968872512 0.1   #     Com_Other
1993  1     4     0.624596184 0.1   #     Com_Other
1994  1     4     0.7824462   0.1   #     Com_Other
1995  1     4     0.6123492   0.1   #     Com_Other
1996  1     4     0.844134712 0.1   #     Com_Other
1997  1     4     0.62595696  0.1   #     Com_Other
1998  1     4     0.850485    0.1   #     Com_Other
1999  1     4     0.904008856 0.1   #     Com_Other
2000  1     4     0.63616278  0.1   #     Com_Other
2001  1     4     0.591030376 0.1   #     Com_Other
2002  1     4     1.456075679 0.1   #     Com_Other
2003  1     4     1.062947493 0.1   #     Com_Other
2004  1     4     1.518762094 0.1   #     Com_Other
2005  1     4     1.890798252 0.1   #     Com_Other
2006  1     4     2.029869559 0.1   #     Com_Other
2007  1     4     1.667948502 0.1   #     Com_Other
2008  1     4     1.658241634 0.1   #     Com_Other
2009  1     4     2.329330998 0.1   #     Com_Other
2010  1     4     4.968238535 0.1   #     Com_Other
2011  1     4     3.636492423 0.1   #     Com_Other
2012  1     4     4.909135498 0.1   #     Com_Other
2013  1     4     6.315860367 0.1   #     Com_Other
2014  1     4     7.189705355 0.1   #     Com_Other
2015  1     4     7.071680717 0.1   #     Com_Other
2016  1     4     8.776188734 0.1   #     Com_Other
2017  1     4     6.75112725  0.1   #     Com_Other
2018  1     4     6.535988565 0.1   #     Com_Other
2019  1     4     7.751751202 0.1   #     Com_Other
2020  1     4     3.985985059 0.1   #     Com_Other
2021  1     4     4.468017278 0.1   #     Com_Other
2022  1     4     2.943676002 0.1   #     Com_Other
-999  1     5     0     0     #     Rec
1948  1     5     23.17023592 0.4   #     Rec
1949  1     5     24.03162486 0.4   #     Rec
1950  1     5     23.29150448 0.4   #     Rec
1951  1     5     23.78151382 0.4   #     Rec
1952  1     5     23.98460115 0.4   #     Rec
1953  1     5     24.31898287 0.4   #     Rec
1954  1     5     23.92809528 0.4   #     Rec
1955  1     5     25.23256769 0.4   #     Rec
1956  1     5     26.44134335 0.4   #     Rec
1957  1     5     28.10315088 0.4   #     Rec
1958  1     5     28.9737678  0.4   #     Rec
1959  1     5     29.3962891  0.4   #     Rec
1960  1     5     29.77239196 0.4   #     Rec
1961  1     5     30.69401676 0.4   #     Rec
1962  1     5     32.56165205 0.4   #     Rec
1963  1     5     32.16366448 0.4   #     Rec
1964  1     5     33.17249533 0.4   #     Rec
1965  1     5     33.11348397 0.4   #     Rec
1966  1     5     32.86026981 0.4   #     Rec
1967  1     5     33.70340872 0.4   #     Rec
1968  1     5     34.91486001 0.4   #     Rec
1969  1     5     35.19077349 0.4   #     Rec
1970  1     5     36.04562711 0.4   #     Rec
1971  1     5     37.3698619  0.4   #     Rec
1972  1     5     39.23727077 0.4   #     Rec
1973  1     5     39.71335102 0.4   #     Rec
1974  1     5     41.36160763 0.4   #     Rec
1975  1     5     41.77214764 0.4   #     Rec
1976  1     5     42.54307433 0.4   #     Rec
1977  1     5     43.14483559 0.4   #     Rec
1978  1     5     44.194042   0.4   #     Rec
1979  1     5     46.90011219 0.4   #     Rec
1980  1     5     44.79656519 0.4   #     Rec
1981  1     5     46.29031334 0.4   #     Rec
1982  1     5     46.54757168 0.4   #     Rec
1983  1     5     47.63234248 0.4   #     Rec
1984  1     5     48.64382114 0.4   #     Rec
1985  1     5     49.4602822  0.4   #     Rec
1986  1     5     48.76868693 0.4   #     Rec
1987  1     5     49.53619139 0.4   #     Rec
1988  1     5     50.92226363 0.4   #     Rec
1989  1     5     51.75683362 0.4   #     Rec
1990  1     5     52.07513801 0.4   #     Rec
1991  1     5     53.20698226 0.4   #     Rec
1992  1     5     55.66452121 0.4   #     Rec
1993  1     5     54.7685433  0.4   #     Rec
1994  1     5     54.9901365  0.4   #     Rec
1995  1     5     54.90333295 0.4   #     Rec
1996  1     5     54.17150716 0.4   #     Rec
1997  1     5     55.23671728 0.4   #     Rec
1998  1     5     56.08344579 0.4   #     Rec
1999  1     5     55.88936115 0.4   #     Rec
2000  1     5     57.55548468 0.4   #     Rec
2001  1     5     58.10962251 0.4   #     Rec
2002  1     5     59.43699926 0.4   #     Rec
2003  1     5     50.18336004 0.4   #     Rec
2004  1     5     65.81542327 0.4   #     Rec
2005  1     5     84.81535084 0.4   #     Rec
2006  1     5     48.7158653  0.4   #     Rec
2007  1     5     30.02221494 0.4   #     Rec
2008  1     5     19.82450091 0.4   #     Rec
2009  1     5     25.13273286 0.4   #     Rec
2010  1     5     45.23714063 0.4   #     Rec
2011  1     5     58.58861002 0.4   #     Rec
2012  1     5     93.76434366 0.4   #     Rec
2013  1     5     26.85942935 0.4   #     Rec
2014  1     5     47.92594918 0.4   #     Rec
2015  1     5     32.68120054 0.4   #     Rec
2016  1     5     26.81721769 0.4   #     Rec
2017  1     5     58.60001106 0.4   #     Rec
2018  1     5     90.67567762 0.4   #     Rec
2019  1     5     33.18908826 0.4   #     Rec
2020  1     5     99.35624916 0.4   #     Rec
2021  1     5     77.02662796 0.4   #     Rec
2022  1     5     116.6824797 0.4   #     Rec
-9999 0     0     0     0           
#
#_CPUE_and_surveyabundance_observations
#_Units:  0=numbers; 1=biomass; 2=F; >=30 for special types
#_Errtype:  -1=normal; 0=lognormal; >0=T
#_SD_Report: 0=no sdreport; 1=enable sdreport
#_Fleet Units Errtype SD_Report
      1     1       0 0  # Catch_Com_DSH
      2     1       0 0  # Catch_Com_ISH
      3     1       0 0  # Catch_Com_Trol
      4     1       0 0  # Catch_Com_Other
      5	    1       0 0  # Catch_Rec
      6     1       0 0  # CPUE_DSH_old
      7     1       0 0  # CPUE_DSH_recent
      8     1       0 0  # CPUE_ISH_recent
      9     1       0 0  # CPUE_Trol_recent
      10    0       0 0  # OPUE_Divers
#
#_yr month fleet obs stderr
1948  1     6     9.701196695 0.072442477 #_    COM_DSH_Old                   
1949  1     6     9.43364381  0.073841775 #_    COM_DSH_Old                   
1950  1     6     8.795995394 0.088218796 #_    COM_DSH_Old                   
1951  1     6     8.552905881 0.093698333 #_    COM_DSH_Old                   
1952  1     6     9.004530974 0.099982357 #_    COM_DSH_Old                   
1953  1     6     12.12936145 0.104191761 #_    COM_DSH_Old                   
1954  1     6     11.80563774 0.100569296 #_    COM_DSH_Old                   
1955  1     6     11.31490591 0.108071281 #_    COM_DSH_Old                   
1956  1     6     10.06636741 0.124411391 #_    COM_DSH_Old                   
1957  1     6     11.53793585 0.115976662 #_    COM_DSH_Old                   
1958  1     6     13.14743506 0.096145889 #_    COM_DSH_Old                   
1959  1     6     7.947533466 0.105359768 #_    COM_DSH_Old                   
1960  1     6     7.374461614 0.103408524 #_    COM_DSH_Old                   
1961  1     6     7.745646255 0.107748504 #_    COM_DSH_Old                   
1962  1     6     8.727628277 0.101426417 #_    COM_DSH_Old                   
1963  1     6     9.615048296 0.092605702 #_    COM_DSH_Old                   
1964  1     6     9.007683696 0.090684872 #_    COM_DSH_Old                   
1965  1     6     8.547469527 0.086879018 #_    COM_DSH_Old                   
1966  1     6     8.491386325 0.087366299 #_    COM_DSH_Old                   
1967  1     6     7.175077959 0.084923877 #_    COM_DSH_Old                   
1968  1     6     8.527018814 0.084696628 #_    COM_DSH_Old                   
1969  1     6     7.995060353 0.081779504 #_    COM_DSH_Old                   
1970  1     6     7.949869635 0.088298592 #_    COM_DSH_Old                   
1971  1     6     7.990783777 0.084066443 #_    COM_DSH_Old                   
1972  1     6     9.401309348 0.080124397 #_    COM_DSH_Old                   
1973  1     6     9.97332808  0.081434147 #_    COM_DSH_Old                   
1974  1     6     11.11357615 0.080999876 #_    COM_DSH_Old                   
1975  1     6     10.31612307 0.092084372 #_    COM_DSH_Old                   
1976  1     6     9.414609781 0.092084372 #_    COM_DSH_Old                   
1977  1     6     7.631260581 0.077269959 #_    COM_DSH_Old                   
1978  1     6     11.88909055 0.086098294 #_    COM_DSH_Old                   
1979  1     6     10.73191115 0.076381031 #_    COM_DSH_Old                   
1980  1     6     9.117670723 0.074335044 #_    COM_DSH_Old                   
1981  1     6     8.530882068 0.074867893 #_    COM_DSH_Old                   
1982  1     6     7.933229309 0.076024711 #_    COM_DSH_Old                   
1983  1     6     8.045764221 0.074303258 #_    COM_DSH_Old                   
1984  1     6     7.183300049 0.074215095 #_    COM_DSH_Old                   
1985  1     6     6.341220995 0.077646278 #_    COM_DSH_Old                   
1986  1     6     8.085915298 0.07681643  #_    COM_DSH_Old                   
1987  1     6     6.819257014 0.082959865 #_    COM_DSH_Old                   
1988  1     6     11.74246355 0.069191733 #_    COM_DSH_Old                   
1989  1     6     8.208214519 0.073522777 #_    COM_DSH_Old                   
1990  1     6     6.423845862 0.073145865 #_    COM_DSH_Old                   
1991  1     6     6.563551034 0.077365168 #_    COM_DSH_Old                   
1992  1     6     7.076085491 0.075318732 #_    COM_DSH_Old                   
1993  1     6     7.287897037 0.083555907 #_    COM_DSH_Old                   
1994  1     6     6.59246218  0.077089574 #_    COM_DSH_Old                   
1995  1     6     6.187487436 0.080251389 #_    COM_DSH_Old                   
1996  1     6     6.106289259 0.080395564 #_    COM_DSH_Old                   
1997  1     6     6.75305243  0.078889048 #_    COM_DSH_Old                   
1998  1     6     6.011250709 0.081310644 #_    COM_DSH_Old                   
1999  1     6     7.372295909 0.078539103 #_    COM_DSH_Old                   
2000  1     6     7.291850225 0.07974824  #_    COM_DSH_Old                   
2001  1     6     7.025071987 0.085064865 #_    COM_DSH_Old                   
2002  1     6     6.099904817 0.085285286 #_    COM_DSH_Old                   
2003  1     7     1.001763427 0.067679043 #_    COM_DSH_Recent                      
2004  1     7     1.373421062 0.061605946 #_    COM_DSH_Recent                      
2005  1     7     1.360258615 0.065136086 #_    COM_DSH_Recent                      
2006  1     7     1.324075196 0.066178304 #_    COM_DSH_Recent                      
2007  1     7     1.518853357 0.065620851 #_    COM_DSH_Recent                      
2008  1     7     1.475542013 0.062853016 #_    COM_DSH_Recent                      
2009  1     7     1.164035295 0.063518577 #_    COM_DSH_Recent                      
2010  1     7     1.663132254 0.062645072 #_    COM_DSH_Recent                      
2011  1     7     1.516525729 0.065165941 #_    COM_DSH_Recent                      
2012  1     7     1.407106607 0.067150202 #_    COM_DSH_Recent                      
2013  1     7     1.778049865 0.061917347 #_    COM_DSH_Recent                      
2014  1     7     1.545377423 0.068312476 #_    COM_DSH_Recent                      
2015  1     7     2.061639099 0.067178691 #_    COM_DSH_Recent                      
2016  1     7     1.951495624 0.066375184 #_    COM_DSH_Recent                      
2017  1     7     2.211236958 0.065266963 #_    COM_DSH_Recent                      
2018  1     7     1.746879095 0.074475391 #_    COM_DSH_Recent                      
2019  1     7     2.138387893 0.074026347 #_    COM_DSH_Recent                      
2020  1     7     1.890030797 0.073969531 #_    COM_DSH_Recent                      
2021  1     7     2.419050928 0.071534134 #_    COM_DSH_Recent                      
2022  1     7     1.927082586 0.075856495 #_    COM_DSH_Recent                      
2003  1     8     0.659177896 0.120135294 #_    COM_ISH_Recent                      
2004  1     8     1.041206323 0.107077893 #_    COM_ISH_Recent                      
2005  1     8     1.018745728 0.122799408 #_    COM_ISH_Recent                      
2006  1     8     1.443704859 0.116171971 #_    COM_ISH_Recent                      
2007  1     8     1.547061605 0.111867013 #_    COM_ISH_Recent                      
2008  1     8     1.187884963 0.10734792  #_    COM_ISH_Recent                      
2009  1     8     0.934112828 0.110779269 #_    COM_ISH_Recent                      
2010  1     8     1.245574332 0.11412818  #_    COM_ISH_Recent                      
2011  1     8     1.4123687   0.107322109 #_    COM_ISH_Recent                      
2012  1     8     1.436791158 0.101808246 #_    COM_ISH_Recent                      
2013  1     8     1.449699352 0.111102674 #_    COM_ISH_Recent                      
2014  1     8     1.585787431 0.117386004 #_    COM_ISH_Recent                      
2015  1     8     1.804154808 0.112028625 #_    COM_ISH_Recent                      
2016  1     8     1.915235193 0.121569271 #_    COM_ISH_Recent                      
2017  1     8     2.233473127 0.11402563  #_    COM_ISH_Recent                      
2018  1     8     2.321844004 0.102275506 #_    COM_ISH_Recent                      
2019  1     8     2.011637642 0.108067629 #_    COM_ISH_Recent                      
2020  1     8     1.983546642 0.106660006 #_    COM_ISH_Recent                      
2021  1     8     1.545420715 0.126444572 #_    COM_ISH_Recent                      
2022  1     8     1.734309393 0.147261554 #_    COM_ISH_Recent                      
2003  1     9     0.034054535 0.171607851 #_    COM_Trol_Recent                     
2004  1     9     0.034024485 0.171142579 #_    COM_Trol_Recent                     
2005  1     9     0.040051112 0.160674179 #_    COM_Trol_Recent                     
2006  1     9     0.028025485 0.16554201  #_    COM_Trol_Recent                     
2007  1     9     0.038405385 0.159247278 #_    COM_Trol_Recent                     
2008  1     9     0.046646318 0.15798254  #_    COM_Trol_Recent                     
2009  1     9     0.040800409 0.160038762 #_    COM_Trol_Recent                     
2010  1     9     0.077490294 0.156244204 #_    COM_Trol_Recent                     
2011  1     9     0.060685568 0.155748048 #_    COM_Trol_Recent                     
2012  1     9     0.062846412 0.154083474 #_    COM_Trol_Recent                     
2013  1     9     0.110795423 0.147487563 #_    COM_Trol_Recent                     
2014  1     9     0.095561672 0.149728478 #_    COM_Trol_Recent                     
2015  1     9     0.083822153 0.160414919 #_    COM_Trol_Recent                     
2016  1     9     0.083082629 0.161171062 #_    COM_Trol_Recent                     
2017  1     9     0.102769747 0.168909592 #_    COM_Trol_Recent                     
2018  1     9     0.090592769 0.14966946  #_    COM_Trol_Recent                     
2019  1     9     0.106751129 0.153430618 #_    COM_Trol_Recent                     
2020  1     9     0.137734225 0.163601244 #_    COM_Trol_Recent                     
2021  1     9     0.14493282  0.156809368 #_    COM_Trol_Recent                     
2022  1     9     0.101632015 0.165856097 #_    COM_Trol_Recent                     
2005  1     10    0.013773475 0.572700837 #_    Divers                        
2008  1     10    0.123065751 0.492798162 #_    Divers                        
2010  1     10    0.075102188 0.437647652 #_    Divers                        
2012  1     10    0.042595909 0.215817989 #_    Divers                        
2015  1     10    0.044845282 0.385283026 #_    Divers                        
2016  1     10    0.045212114 0.313540663 #_    Divers                        
2019  1     10    0.059053681 0.420806921 #_    Divers                        
-9999 1     1     1     1     #     terminator  for   survey      observations      
#
0 #_N_fleets_with_discard
#_discard_units (1=same_as_catchunits(bio/num); 2=fraction; 3=numbers)
#_discard_errtype:  >0 for DF of T-dist(read CV below); 0 for normal with CV; -1 for normal with se; -2 for lognormal; -3 for trunc normal with CV
# note, only have units and errtype for fleets with discard 
#_Fleet units errtype
# -9999 0 0 0.0 0.0 # terminator for discard data 
#
0  #_use meanbodysize_data (0/1)
#30 #_DF_for_meanbodysize_T-distribution_like
# note:  use positive partition value for mean body wt, negative partition for mean body length 
#_yr month fleet part type obs stderr
#
# set up population length bin structure (note - irrelevant if not using size data and using empirical wtatage
2 # length bin method: 1=use databins; 2=generate from binwidth,min,max below; 3=read vector
1 # binwidth for population size comp 
1 # minimum size in the population (lower edge of first bin and size at age 0.00) 
113 # maximum size in the population (lower edge of last bin) 
0 # use length composition data (0/1)
#_mintailcomp: upper and lower distribution for females and males separately are accumulated until exceeding this level.
#_addtocomp:  after accumulation of tails; this value added to all bins
#_males and females treated as combined gender below this bin number 
#_compressbins: accumulate upper tail by this number of bins; acts simultaneous with mintailcomp; set=0 for no forced accumulation
#_Comp_Error:  0=multinomial, 1=dirichlet
#_Comp_Error2:  parm number  for dirichlet
#_minsamplesize: minimum sample size; set to 1 to match 3.24, minimum value is 0.001
#_mintailcomp addtocomp combM+F CompressBins CompError ParmSelect minsamplesize
#-0.005 0.001 0 0 0 0 1 #_fleet:1_Deep7
#-0.005 0.001 0 0 0 0 1 #_fleet:2_S1_early
#-0.005 0.001 0 0 0 0 1 #_fleet:3_S2_late
#-0.005 0.001 0 0 0 0 1 #_fleet:4_Survey2016
# sex codes:  0=combined; 1=use female only; 2=use male only; 3=use both as joint sexxlength distribution
# partition codes:  (0=combined; 1=discard; 2=retained
#88 #_N_LengthBins; then enter lower edge of each length bin
# 4.5 5.5 6.5 7.5 8.5 9.5 10.5 11.5 12.5 13.5 14.5 15.5 16.5 17.5 18.5 19.5 20.5 21.5 22.5 23.5 24.5 25.5 26.5 27.5 28.5 29.5 30.5 31.5 32.5 33.5 34.5 35.5 36.5 37.5 38.5 39.5 40.5 41.5 42.5 43.5 44.5 45.5 46.5 47.5 48.5 49.5 50.5 51.5 52.5 53.5 54.5 55.5 56.5 57.5 58.5 59.5 60.5 61.5 62.5 63.5 64.5 65.5 66.5 67.5 68.5 69.5 70.5 71.5 72.5 73.5 74.5 75.5 76.5 77.5 78.5 79.5 80.5 81.5 82.5 83.5 84.5 85.5 86.5 87.5 88.5 89.5 90.5 91.5
#_yr month fleet sex part Nsamp datavector(female-male)
#-9999 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
#
0 #_N_age_bins
# 1	2
# 0 #_N_ageerror_definitions
#_mintailcomp: upper and lower distribution for females and males separately are accumulated until exceeding this level.
#_addtocomp:  after accumulation of tails; this value added to all bins
#_males and females treated as combined gender below this bin number 
#_compressbins: accumulate upper tail by this number of bins; acts simultaneous with mintailcomp; set=0 for no forced accumulation
#_Comp_Error:  0=multinomial, 1=dirichlet
#_Comp_Error2:  parm number  for dirichlet
#_minsamplesize: minimum sample size; set to 1 to match 3.24, minimum value is 0.001
#_mintailcomp addtocomp combM+F CompressBins CompError ParmSelect minsamplesize
# -0.005 0.001 0 0 0 0 1 #_fleet:1_Deep7
# -0.005 0.001 0 0 0 0 1 #_fleet:2_S1_early
# -0.005 0.001 0 0 0 0 1 #_fleet:3_S2_late
#1 #_Lbin_method_for_Age_Data: 1=poplenbins; 2=datalenbins; 3=lengths
# sex codes:  0=combined; 1=use female only; 2=use male only; 3=use both as joint sexxlength distribution
# partition codes:  (0=combined; 1=discard; 2=retained
#_yr month fleet sex part ageerr Lbin_lo Lbin_hi Nsamp datavector(female-male)
#-9999  0 0 0 0 0 0 0 0 0 0 
#
0 #_Use_MeanSize-at-Age_obs (0/1)
#
0 #_N_environ_variables
#Yr Variable Value
#
1 # N sizefreq methods to read 
32 # N bins per method
2 # Units of counts (1=biomass, 2=numbers)
1 # Scale (kg)
1e-9 # Tail compression
75 # Number of years
# Bin definition (lowest edge)
0.226796  0.680388  1.13398 1.587572  2.041164  2.494756  2.948348  3.40194 3.855532  4.309124  4.762716  5.216308  5.6699  6.123492  6.577084  7.030676  7.484268  7.93786 8.391452  8.845044  9.298636  9.752228  10.20582  10.659412 11.113004 11.566596 12.020188 12.47378  12.927372 13.380964 13.834556 14.288148
#Method Year  Season  Fleet Gender  Partition SampSize  1 2 3 4 5 6 7 8 9 10  11  12  13  14  15  16  17  18  19  20  21  22  23  24  25  26  27  28  29  30  31  32
1     1948  1     1     0     2     46    0     3     10    16    11    20    15    8     17    6     11    8     8     3     4     5     1     0     0     1     0     0     1     0     0     0     0     0     0     1     0     0
1     1949  1     1     0     2     38    1     3     3     12    15    17    7     15    8     9     14    4     2     4     6     3     0     0     1     2     1     0     0     0     0     0     0     0     0     0     0     0
1     1950  1     1     0     2     42    0     4     5     8     12    16    20    21    15    19    9     8     2     9     2     1     0     1     0     1     1     0     0     1     0     1     0     0     0     1     0     0
1     1951  1     1     0     2     21    0     1     1     4     9     4     6     8     4     9     4     1     6     4     3     1     1     1     0     0     0     0     0     0     0     1     0     0     0     0     0     0
1     1952  1     1     0     2     28    0     1     3     6     5     7     10    12    17    10    7     8     3     6     2     0     1     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
1     1953  1     1     0     2     16    0     1     2     2     5     5     4     5     2     5     3     6     5     1     5     0     1     0     0     0     0     0     0     0     0     0     1     0     0     0     0     0
1     1954  1     1     0     2     23    0     0     3     4     8     7     11    12    6     12    11    5     8     0     1     0     0     0     0     0     0     1     0     0     0     0     0     0     0     0     0     0
1     1955  1     1     0     2     14    0     0     3     2     3     1     3     6     1     4     4     5     3     1     2     1     2     0     0     0     1     0     0     0     0     0     0     0     0     0     0     0
1     1956  1     1     0     2     12    0     0     0     1     5     2     4     3     7     12    1     1     1     0     1     1     0     1     1     0     0     0     0     0     0     0     0     0     1     0     0     0
1     1957  1     1     0     2     21    0     0     0     0     1     7     2     11    7     9     5     6     6     4     2     1     0     1     0     0     0     0     0     0     0     0     0     0     0     0     0     0
1     1958  1     1     0     2     25    0     1     2     4     2     5     4     11    6     7     9     4     5     3     5     1     1     1     0     1     0     0     0     0     0     0     0     0     0     0     0     0
1     1959  1     1     0     2     20    0     0     1     8     4     5     1     8     3     4     4     7     5     3     4     3     1     3     1     2     0     1     0     0     0     0     0     0     0     0     0     0
1     1960  1     1     0     2     17    0     0     1     1     3     5     3     5     2     10    4     5     2     5     2     1     4     0     1     0     1     0     1     0     1     0     0     0     0     0     0     0
1     1961  1     1     0     2     14    0     1     2     3     4     5     2     8     4     4     0     8     6     7     6     0     0     0     1     0     0     2     1     0     0     1     0     0     0     0     0     0
1     1962  1     1     0     2     13    0     0     2     1     2     7     1     1     1     7     4     6     3     4     4     5     1     0     1     2     0     0     0     0     1     1     0     0     0     0     0     1
1     1963  1     1     0     2     34    0     0     4     10    3     6     7     10    5     8     10    6     7     4     7     6     4     2     1     0     0     0     0     0     0     0     0     0     0     0     0     0
1     1964  1     1     0     2     36    0     2     1     9     8     11    3     14    7     17    11    8     5     3     6     5     0     1     0     0     0     0     0     0     0     0     1     0     0     0     0     0
1     1965  1     1     0     2     23    0     3     3     7     8     3     6     6     7     20    5     6     5     9     1     5     1     2     1     1     0     1     0     0     0     1     0     0     0     0     0     0
1     1966  1     1     0     2     30    1     8     1     16    6     9     7     8     10    9     5     8     3     9     5     2     1     3     2     0     0     1     1     1     1     0     0     0     1     0     0     0
1     1967  1     1     0     2     36    0     3     7     12    8     7     2     22    10    19    9     4     6     6     2     1     3     2     1     1     1     2     0     0     0     0     0     0     0     0     0     0
1     1968  1     1     0     2     35    1     3     2     10    7     11    11    14    6     11    3     2     7     3     7     3     2     6     1     3     1     1     1     0     3     0     0     0     0     0     0     0
1     1969  1     1     0     2     39    2     4     6     14    7     9     9     19    9     15    6     9     4     4     5     2     6     1     0     0     0     1     0     0     0     0     2     0     0     0     1     0
1     1970  1     1     0     2     28    0     4     4     10    7     9     7     7     7     9     6     7     5     2     7     3     0     4     0     1     1     0     1     0     2     0     0     1     0     0     0     1
1     1971  1     1     0     2     37    3     5     4     17    11    15    10    19    5     12    9     10    3     2     5     0     1     2     4     1     0     0     0     0     0     0     0     1     0     0     0     0
1     1972  1     1     0     2     47    3     11    7     18    6     25    15    10    3     17    10    14    6     10    7     2     1     4     0     1     0     2     2     1     0     0     0     1     1     0     0     0
1     1973  1     1     0     2     49    1     9     11    20    16    23    11    16    4     14    10    6     3     5     4     2     3     4     1     2     1     0     0     0     2     0     0     0     0     0     1     0
1     1974  1     1     0     2     53    0     3     9     16    21    23    20    16    16    20    9     11    3     6     6     5     2     1     0     2     1     1     0     1     0     1     0     0     0     0     0     0
1     1975  1     1     0     2     57    2     1     3     16    22    26    18    24    13    23    5     10    5     3     6     3     1     3     2     1     0     1     0     0     0     0     0     0     0     0     0     0
1     1976  1     1     0     2     62    5     3     12    17    22    25    22    15    12    28    19    11    7     4     4     2     1     3     2     2     1     1     0     0     0     0     0     0     1     1     0     0
1     1977  1     1     0     2     66    5     11    12    26    19    24    30    22    11    24    11    12    14    7     6     6     3     2     1     2     1     1     1     0     1     0     0     0     0     1     0     0
1     1978  1     1     0     2     46    2     6     4     11    23    22    17    9     13    10    8     6     2     3     8     4     0     3     0     0     0     0     1     0     0     0     1     0     0     0     0     0
1     1979  1     1     0     2     69    3     5     14    20    31    18    38    28    19    15    11    15    5     5     8     5     4     2     1     3     0     0     0     0     0     1     0     0     0     0     0     0
1     1980  1     1     0     2     115   3     10    21    30    29    31    30    30    29    33    16    17    15    10    8     11    7     10    5     6     3     1     2     0     0     2     0     0     1     1     0     0
1     1981  1     1     0     2     160   4     9     28    27    52    45    44    46    32    44    23    27    17    17    11    10    6     4     3     7     1     3     2     1     0     1     2     0     0     0     0     0
1     1982  1     1     0     2     170   8     19    30    39    44    59    44    59    49    37    28    45    24    17    23    10    11    7     7     1     4     0     4     3     0     1     1     0     0     0     1     0
1     1983  1     1     0     2     210   2     15    25    55    50    79    46    62    50    72    35    33    23    26    15    15    8     13    6     9     3     5     2     1     3     2     1     0     1     1     0     1
1     1984  1     1     0     2     199   11    57    29    53    54    78    48    48    40    64    40    36    29    41    24    13    11    12    5     7     3     2     0     1     0     1     0     1     0     6     1     0
1     1985  1     1     0     2     114   5     22    11    32    22    33    17    47    14    29    13    15    17    19    12    6     4     6     4     0     0     0     0     1     1     0     0     1     0     1     0     0
1     1986  1     1     0     2     84    3     16    15    15    19    35    29    23    21    30    14    22    14    11    13    10    4     6     1     2     4     2     2     1     0     0     1     0     0     0     0     0
1     1987  1     1     0     2     91    1     3     6     15    30    52    39    42    32    23    22    20    16    7     11    6     7     1     0     6     0     3     1     1     0     0     0     0     0     0     0     0
1     1988  1     1     0     2     217   2     8     29    47    78    93    80    86    60    74    47    41    32    32    28    27    11    19    6     10    3     10    7     2     1     1     1     2     0     0     1     0
1     1989  1     1     0     2     218   6     18    22    36    68    71    66    76    66    67    51    40    39    39    28    10    10    6     14    5     3     4     3     2     3     0     4     1     0     1     1     0
1     1990  1     1     0     2     140   3     19    40    41    54    32    49    39    24    31    24    24    20    19    20    14    6     5     3     3     1     0     1     2     0     1     1     0     0     0     0     0
1     1991  1     1     0     2     110   0     1     13    34    40    46    33    35    31    25    16    19    18    11    7     5     7     3     1     4     1     2     1     0     0     1     1     1     0     0     1     0
1     1992  1     1     0     2     107   4     9     7     21    46    32    37    43    29    35    17    22    18    10    13    4     5     1     1     7     0     1     0     1     2     0     0     0     0     0     0     0
1     1993  1     1     0     2     104   0     1     18    23    27    30    42    26    34    34    14    21    13    14    11    4     2     3     2     3     0     1     0     0     0     1     0     0     0     0     1     0
1     1994  1     1     0     2     105   1     5     12    16    41    32    41    42    33    32    24    39    17    13    18    4     1     4     1     0     0     0     0     0     1     0     1     0     1     0     1     0
1     1995  1     1     0     2     91    2     1     5     21    41    35    34    35    36    43    32    23    15    12    8     6     2     6     1     3     1     1     1     0     0     0     0     0     0     0     1     0
1     1996  1     1     0     2     84    0     2     5     12    23    37    31    36    23    31    20    15    9     9     9     7     5     1     3     0     2     0     2     1     0     0     0     0     0     0     0     0
1     1997  1     1     0     2     117   3     10    11    27    38    36    42    29    23    38    31    20    15    17    8     6     5     1     1     0     1     1     0     0     0     0     0     0     0     1     0     0
1     1998  1     1     0     2     111   1     7     12    27    39    47    29    30    17    40    18    18    13    16    5     8     2     0     2     2     0     1     1     2     0     0     2     0     0     0     0     0
1     1999  1     1     0     2     90    3     3     6     20    33    27    35    29    31    29    22    22    12    11    13    9     2     2     3     4     3     0     0     0     0     0     0     0     0     0     0     0
1     2000  1     1     0     2     103   1     1     7     28    40    37    32    43    40    28    27    26    22    9     21    4     4     3     2     2     1     3     1     1     1     0     0     0     0     1     0     0
1     2001  1     1     0     2     84    0     0     4     12    31    36    37    35    22    19    19    13    16    10    14    4     3     3     2     1     1     1     0     0     1     0     1     0     0     0     0     0
1     2002  1     1     0     2     69    0     0     4     15    29    28    23    28    17    31    15    13    11    7     8     3     1     1     0     3     0     3     0     0     2     0     0     0     0     0     0     0
1     2003  1     1     0     2     72    0     1     1     10    14    42    20    35    16    25    10    16    8     8     4     4     2     4     1     2     0     0     1     0     1     0     0     0     1     0     0     0
1     2004  1     1     0     2     70    2     4     4     17    18    22    19    27    12    30    21    10    5     6     3     5     2     1     0     1     0     0     0     0     0     0     0     0     2     0     0     0
1     2005  1     1     0     2     66    1     1     10    25    17    16    14    36    12    27    9     13    6     7     10    4     1     6     0     3     0     1     0     0     0     1     0     0     0     0     0     0
1     2006  1     1     0     2     71    1     1     6     28    23    27    21    33    14    26    6     13    11    5     9     5     3     1     2     1     0     0     0     0     0     1     0     0     0     0     0     0
1     2007  1     1     0     2     57    0     1     3     8     20    34    19    31    11    21    14    12    2     2     5     4     4     2     0     0     0     1     0     0     0     0     0     0     0     1     0     0
1     2008  1     1     0     2     63    0     2     5     13    20    42    22    27    7     17    5     16    4     6     5     5     0     1     1     0     0     0     0     0     0     0     1     0     0     0     0     0
1     2009  1     1     0     2     74    0     0     4     13    13    34    15    36    14    33    12    17    7     10    2     8     1     3     1     0     2     0     0     0     0     0     0     0     0     0     0     0
1     2010  1     1     0     2     80    0     4     3     19    12    10    20    31    16    25    11    17    6     8     9     5     4     2     0     4     1     0     0     1     0     0     0     2     0     0     0     0
1     2011  1     1     0     2     73    0     2     4     13    12    18    16    35    18    24    9     19    9     8     5     4     4     3     0     0     0     0     0     0     0     0     0     0     0     0     0     0
1     2012  1     1     0     2     74    0     2     7     12    14    22    22    20    17    25    9     16    8     8     9     4     1     0     3     5     1     1     0     0     1     0     0     0     0     0     0     0
1     2013  1     1     0     2     68    0     1     4     13    14    19    19    14    13    27    11    21    7     10    14    4     1     5     2     2     0     1     0     0     0     0     1     0     0     0     0     0
1     2014  1     1     0     2     67    3     0     0     18    14    22    20    27    10    14    9     13    5     9     8     7     2     5     1     0     0     0     0     0     0     0     0     1     0     0     0     0
1     2015  1     1     0     2     63    1     6     2     13    14    28    13    23    18    22    4     17    12    10    4     3     2     3     0     0     0     0     0     0     0     0     0     0     0     0     0     0
1     2016  1     1     0     2     75    1     6     8     23    35    27    17    32    21    27    10    12    3     10    6     3     1     1     0     3     1     0     0     0     0     0     0     0     0     0     0     0
1     2017  1     1     0     2     82    0     1     4     19    22    35    12    34    13    27    9     16    11    6     7     3     5     2     3     4     1     0     0     0     0     0     1     0     0     0     0     0
1     2018  1     1     0     2     49    0     1     4     9     13    20    12    17    11    18    7     8     5     7     5     3     2     0     0     1     1     1     0     0     0     0     0     0     0     0     0     0
1     2019  1     1     0     2     46    0     2     3     17    14    23    11    13    8     17    7     12    2     1     8     1     2     1     1     1     1     0     0     0     1     0     0     0     0     0     0     0
1     2020  1     1     0     2     36    1     2     6     3     15    17    8     21    5     13    7     8     4     8     6     3     1     4     0     0     0     0     0     0     0     0     0     0     0     0     0     0
1     2021  1     1     0     2     28    0     0     1     2     7     18    5     13    3     18    5     4     3     9     2     3     0     1     0     3     0     1     0     0     0     0     0     0     0     0     0     0
1     2022  1     1     0     2     41    0     0     3     7     10    18    13    25    13    12    8     7     3     10    4     1     1     0     1     0     1     2     1     1     0     0     0     0     0     0     0     0
#
0 # do tags (0/1)
#
0 #    morphcomp data(0/1) 
#  Nobs, Nmorphs, mincomp
#  yr, seas, type, partition, Nsamp, datavector_by_Nmorphs
#
0  #  Do dataread for selectivity priors(0/1)
# Yr, Seas, Fleet,  Age/Size,  Bin,  selex_prior,  prior_sd
# feature not yet implemented
#
999

ENDDATA



