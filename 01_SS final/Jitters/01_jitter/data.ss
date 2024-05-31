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
2023 #_EndYr
1    #_Nseas
12   #_months/season
2    #_Nsubseasons (even number, minimum is 2)
1    #_spawn_month
-1    #_Ngenders
32   #_Nages=accumulator age
1    #_Nareas
7    #_Nfleets (including surveys)
#_fleet_type: 1=catch fleet; 2=bycatch only fleet; 3=survey; 4=ignore 
#_survey_timing: -1=for use of catch-at-age to override the month value associated with a datum 
#_fleet_area:  area the fleet/survey operates in 
#_units of catch:  1=bio; 2=num (ignored for surveys; their units read later)
#_catch_mult: 0=no; 1=yes
#_rows are fleets
#_fleet_type timing area units need_catch_mult fleetname
           1     -1    1     1               0     Com_DSH_Old    # 1
           1     -1    1     1               0     Com_DSH_Recent # 2
           1     -1    1     1               0     Com_ISH        # 3
           1     -1    1     1               0     Com_Trol       # 4
           1     -1    1     1               0     Com_Other      # 5
           1     -1    1     1               0     Rec            # 6
           1     -1    1     1               0     Divers         # 7
#_Catch data: yr, seas, fleet, catch, catch_se
#_catch_se:  standard error of log(catch); can be overridden in control file with detailed F input
-999    1   1   40.43500525 0.4 #   Com_Deep
1948    1   1   40.43500525 0.05    #   Com_Deep
1949    1   1   33.00057584 0.05    #   Com_Deep
1950    1   1   22.75371251 0.05    #   Com_Deep
1951    1   1   16.05966673 0.05    #   Com_Deep
1952    1   1   24.96164224 0.05    #   Com_Deep
1953    1   1   22.62639128 0.05    #   Com_Deep
1954    1   1   16.55247926 0.05    #   Com_Deep
1955    1   1   14.26410762 0.05    #   Com_Deep
1956    1   1   19.19964218 0.05    #   Com_Deep
1957    1   1   37.2852624  0.05    #   Com_Deep
1958    1   1   28.79516976 0.05    #   Com_Deep
1959    1   1   18.37487505 0.05    #   Com_Deep
1960    1   1   17.23921755 0.05    #   Com_Deep
1961    1   1   15.79452703 0.05    #   Com_Deep
1962    1   1   23.37327554 0.05    #   Com_Deep
1963    1   1   24.84051229 0.05    #   Com_Deep
1964    1   1   39.97506296 0.05    #   Com_Deep
1965    1   1   22.15866623 0.05    #   Com_Deep
1966    1   1   26.08925106 0.05    #   Com_Deep
1967    1   1   26.0193979  0.05    #   Com_Deep
1968    1   1   22.10488178 0.05    #   Com_Deep
1969    1   1   25.47327313 0.05    #   Com_Deep
1970    1   1   21.25214598 0.05    #   Com_Deep
1971    1   1   21.76561212 0.05    #   Com_Deep
1972    1   1   21.46533422 0.05    #   Com_Deep
1973    1   1   29.99694614 0.05    #   Com_Deep
1974    1   1   34.92426381 0.05    #   Com_Deep
1975    1   1   26.57096577 0.05    #   Com_Deep
1976    1   1   23.64620455 0.05    #   Com_Deep
1977    1   1   24.97576746 0.05    #   Com_Deep
1978    1   1   28.04105744 0.05    #   Com_Deep
1979    1   1   36.07417176 0.05    #   Com_Deep
1980    1   1   31.82764346 0.05    #   Com_Deep
1981    1   1   36.67518116 0.05    #   Com_Deep
1982    1   1   43.90044813 0.05    #   Com_Deep
1983    1   1   56.30822421 0.05    #   Com_Deep
1984    1   1   61.51030693 0.05    #   Com_Deep
1985    1   1   21.66271487 0.05    #   Com_Deep
1986    1   1   36.75748405 0.05    #   Com_Deep
1987    1   1   21.36728864 0.05    #   Com_Deep
1988    1   1   145.1841175 0.05    #   Com_Deep
1989    1   1   90.90279948 0.05    #   Com_Deep
1990    1   1   39.30799627 0.05    #   Com_Deep
1991    1   1   32.01866927 0.05    #   Com_Deep
1992    1   1   31.22486445 0.05    #   Com_Deep
1993    1   1   27.76625612 0.05    #   Com_Deep
1994    1   1   26.28832112 0.05    #   Com_Deep
1995    1   1   23.73280509 0.05    #   Com_Deep
1996    1   1   18.60634838 0.05    #   Com_Deep
1997    1   1   21.62424564 0.05    #   Com_Deep
1998    1   1   20.01635272 0.05    #   Com_Deep
1999    1   1   33.96565388 0.05    #   Com_Deep
2000    1   1   30.51766976 0.05    #   Com_Deep
2001    1   1   17.48456546 0.05    #   Com_Deep
2002    1   1   19.24660256 0.05    #   Com_Deep
2003    1   1   14.37077622 0.05    #   Com_Deep
2004    1   1   26.14840853 0.05    #   Com_Deep
2005    1   1   20.2723555  0.05    #   Com_Deep
2006    1   1   17.43159953 0.05    #   Com_Deep
2007    1   1   20.66828235 0.05    #   Com_Deep
2008    1   1   28.62665238 0.05    #   Com_Deep
2009    1   1   30.21723763 0.05    #   Com_Deep
2010    1   1   37.75500228 0.05    #   Com_Deep
2011    1   1   34.7678268  0.05    #   Com_Deep
2012    1   1   34.35138398 0.05    #   Com_Deep
2013    1   1   34.60258323 0.05    #   Com_Deep
2014    1   1   25.75753923 0.05    #   Com_Deep
2015    1   1   29.52126421 0.05    #   Com_Deep
2016    1   1   33.28594174 0.05    #   Com_Deep
2017    1   1   38.75485512 0.05    #   Com_Deep
2018    1   1   15.38987761 0.05    #   Com_Deep
2019    1   1   21.85873456 0.05    #   Com_Deep
2020    1   1   11.90688072 0.05    #   Com_Deep
2021    1   1   17.19898394 0.05    #   Com_Deep
2022    1   1   15.90928581 0.05    #   Com_Deep
2023    1   1   13.48796635 0.05    #   Com_Deep
-999    1   3   0   0.1 #   Com_Inshore
1948    1   3   4.328628456 0.1 #   Com_Inshore
1949    1   3   3.41781572  0.1 #   Com_Inshore
1950    1   3   2.83041408  0.1 #   Com_Inshore
1951    1   3   3.43142348  0.1 #   Com_Inshore
1952    1   3   3.80790484  0.1 #   Com_Inshore
1953    1   3   9.224246912 0.1 #   Com_Inshore
1954    1   3   10.09468996 0.1 #   Com_Inshore
1955    1   3   12.30005426 0.1 #   Com_Inshore
1956    1   3   12.14719376 0.1 #   Com_Inshore
1957    1   3   5.927086664 0.1 #   Com_Inshore
1958    1   3   3.555254096 0.1 #   Com_Inshore
1959    1   3   1.90281844  0.1 #   Com_Inshore
1960    1   3   2.34960656  0.1 #   Com_Inshore
1961    1   3   2.863526296 0.1 #   Com_Inshore
1962    1   3   3.434145032 0.1 #   Com_Inshore
1963    1   3   3.101208504 0.1 #   Com_Inshore
1964    1   3   0.476725192 0.1 #   Com_Inshore
1965    1   3   0.237682208 0.1 #   Com_Inshore
1966    1   3   0.0113398   0.1 #   Com_Inshore
1967    1   3   0.377842136 0.1 #   Com_Inshore
1968    1   3   0.032658624 0.1 #   Com_Inshore
1969    1   3   0.01587572  0.1 #   Com_Inshore
1970    1   3   0.007257472 0.1 #   Com_Inshore
1971    1   3   0.009525432 0.1 #   Com_Inshore
1972    1   3   0.016329312 0.1 #   Com_Inshore
1973    1   3   0.053977448 0.1 #   Com_Inshore
1974    1   3   0.088904032 0.1 #   Com_Inshore
1975    1   3   0.753869904 0.1 #   Com_Inshore
1976    1   3   3.198277192 0.1 #   Com_Inshore
1977    1   3   3.57657292  0.1 #   Com_Inshore
1978    1   3   8.294836904 0.1 #   Com_Inshore
1979    1   3   1.847026624 0.1 #   Com_Inshore
1980    1   3   0.554289424 0.1 #   Com_Inshore
1981    1   3   0.265804912 0.1 #   Com_Inshore
1982    1   3   0.307535376 0.1 #   Com_Inshore
1983    1   3   0.609174056 0.1 #   Com_Inshore
1984    1   3   0.114305184 0.1 #   Com_Inshore
1985    1   3   0.249022008 0.1 #   Com_Inshore
1986    1   3   4.20026192  0.1 #   Com_Inshore
1987    1   3   2.851279312 0.1 #   Com_Inshore
1988    1   3   4.808528792 0.1 #   Com_Inshore
1989    1   3   1.338549992 0.1 #   Com_Inshore
1990    1   3   2.067018744 0.1 #   Com_Inshore
1991    1   3   5.111528248 0.1 #   Com_Inshore
1992    1   3   6.76305672  0.1 #   Com_Inshore
1993    1   3   2.193570912 0.1 #   Com_Inshore
1994    1   3   5.17775268  0.1 #   Com_Inshore
1995    1   3   2.193570912 0.1 #   Com_Inshore
1996    1   3   3.906334304 0.1 #   Com_Inshore
1997    1   3   7.9718794   0.1 #   Com_Inshore
1998    1   3   6.372514008 0.1 #   Com_Inshore
1999    1   3   5.3070264   0.1 #   Com_Inshore
2000    1   3   5.873109216 0.1 #   Com_Inshore
2001    1   3   6.971255448 0.1 #   Com_Inshore
2002    1   3   4.360969566 0.1 #   Com_Inshore
2003    1   3   2.927618846 0.1 #   Com_Inshore
2004    1   3   3.570267991 0.1 #   Com_Inshore
2005    1   3   2.439553854 0.1 #   Com_Inshore
2006    1   3   4.333391172 0.1 #   Com_Inshore
2007    1   3   5.211000974 0.1 #   Com_Inshore
2008    1   3   5.888848858 0.1 #   Com_Inshore
2009    1   3   4.843137862 0.1 #   Com_Inshore
2010    1   3   7.832717374 0.1 #   Com_Inshore
2011    1   3   8.292659662 0.1 #   Com_Inshore
2012    1   3   8.975270263 0.1 #   Com_Inshore
2013    1   3   8.60182797  0.1 #   Com_Inshore
2014    1   3   5.513864352 0.1 #   Com_Inshore
2015    1   3   5.711176872 0.1 #   Com_Inshore
2016    1   3   5.226559179 0.1 #   Com_Inshore
2017    1   3   7.703897246 0.1 #   Com_Inshore
2018    1   3   7.737417695 0.1 #   Com_Inshore
2019    1   3   7.459774032 0.1 #   Com_Inshore
2020    1   3   3.673823045 0.1 #   Com_Inshore
2021    1   3   2.298305305 0.1 #   Com_Inshore
2022    1   3   3.207258314 0.1 #   Com_Inshore
2023    1   3   1.73104315  0.1 #   Com_Inshore
-999    1   4   0   0.1 #   Com_Trolling
1948    1   4   0.03855532  0.1 #   Com_Trolling
1949    1   4   0.238589392 0.1 #   Com_Trolling
1950    1   4   0.00226796  0.1 #   Com_Trolling
1951    1   4   0.017236496 0.1 #   Com_Trolling
1952    1   4   0.02494756  0.1 #   Com_Trolling
1953    1   4   0   0.1 #   Com_Trolling
1954    1   4   0   0.1 #   Com_Trolling
1955    1   4   0.008618248 0.1 #   Com_Trolling
1956    1   4   0.00453592  0.1 #   Com_Trolling
1957    1   4   0.00453592  0.1 #   Com_Trolling
1958    1   4   0   0.1 #   Com_Trolling
1959    1   4   0   0.1 #   Com_Trolling
1960    1   4   0   0.1 #   Com_Trolling
1961    1   4   0   0.1 #   Com_Trolling
1962    1   4   0.020865232 0.1 #   Com_Trolling
1963    1   4   0.01814368  0.1 #   Com_Trolling
1964    1   4   0   0.1 #   Com_Trolling
1965    1   4   0   0.1 #   Com_Trolling
1966    1   4   0   0.1 #   Com_Trolling
1967    1   4   0.035833768 0.1 #   Com_Trolling
1968    1   4   0.025401152 0.1 #   Com_Trolling
1969    1   4   0.005443104 0.1 #   Com_Trolling
1970    1   4   0   0.1 #   Com_Trolling
1971    1   4   0.015422128 0.1 #   Com_Trolling
1972    1   4   0.119748288 0.1 #   Com_Trolling
1973    1   4   0.100697424 0.1 #   Com_Trolling
1974    1   4   0.160571568 0.1 #   Com_Trolling
1975    1   4   0.518002064 0.1 #   Com_Trolling
1976    1   4   0.623689    0.1 #   Com_Trolling
1977    1   4   0.820146008 0.1 #   Com_Trolling
1978    1   4   0.157850016 0.1 #   Com_Trolling
1979    1   4   0.420026192 0.1 #   Com_Trolling
1980    1   4   0.685831104 0.1 #   Com_Trolling
1981    1   4   0.301185088 0.1 #   Com_Trolling
1982    1   4   0.6123492   0.1 #   Com_Trolling
1983    1   4   1.3311031   0.1 #   Com_Trolling
1984    1   4   0.507569448 0.1 #   Com_Trolling
1985    1   4   0.119748288 0.1 #   Com_Trolling
1986    1   4   0.682202368 0.1 #   Com_Trolling
1987    1   4   0.66678024  0.1 #   Com_Trolling
1988    1   4   2.638998256 0.1 #   Com_Trolling
1989    1   4   1.590293552 0.1 #   Com_Trolling
1990    1   4   2.826029585 0.1 #   Com_Trolling
1991    1   4   2.642602172 0.1 #   Com_Trolling
1992    1   4   0.907615092 0.1 #   Com_Trolling
1993    1   4   0.636389576 0.1 #   Com_Trolling
1994    1   4   0.33112216  0.1 #   Com_Trolling
1995    1   4   0.73481904  0.1 #   Com_Trolling
1996    1   4   0.822362296 0.1 #   Com_Trolling
1997    1   4   0.610988424 0.1 #   Com_Trolling
1998    1   4   0.477178784 0.1 #   Com_Trolling
1999    1   4   0.57152592  0.1 #   Com_Trolling
2000    1   4   0.77564232  0.1 #   Com_Trolling
2001    1   4   1.466009344 0.1 #   Com_Trolling
2002    1   4   0.599693983 0.1 #   Com_Trolling
2003    1   4   2.455837806 0.1 #   Com_Trolling
2004    1   4   3.709067143 0.1 #   Com_Trolling
2005    1   4   4.2297454   0.1 #   Com_Trolling
2006    1   4   3.232296592 0.1 #   Com_Trolling
2007    1   4   3.807496607 0.1 #   Com_Trolling
2008    1   4   5.799581953 0.1 #   Com_Trolling
2009    1   4   2.520383948 0.1 #   Com_Trolling
2010    1   4   4.221762181 0.1 #   Com_Trolling
2011    1   4   2.883302907 0.1 #   Com_Trolling
2012    1   4   4.819052126 0.1 #   Com_Trolling
2013    1   4   5.462427019 0.1 #   Com_Trolling
2014    1   4   5.532008032 0.1 #   Com_Trolling
2015    1   4   3.91563294  0.1 #   Com_Trolling
2016    1   4   6.557488826 0.1 #   Com_Trolling
2017    1   4   6.908115442 0.1 #   Com_Trolling
2018    1   4   4.177219446 0.1 #   Com_Trolling
2019    1   4   3.550173866 0.1 #   Com_Trolling
2020    1   4   2.124715646 0.1 #   Com_Trolling
2021    1   4   3.348506862 0.1 #   Com_Trolling
2022    1   4   1.961966837 0.1 #   Com_Trolling
2023    1   4   1.794908903 0.1 #   Com_Trolling
-999    1   5   0   0.1 #   Com_Other
1948    1   5   1.270511192 0.1 #   Com_Other
1949    1   5   1.015138896 0.1 #   Com_Other
1950    1   5   0.646822192 0.1 #   Com_Other
1951    1   5   0.921245352 0.1 #   Com_Other
1952    1   5   0.617338712 0.1 #   Com_Other
1953    1   5   0.996088032 0.1 #   Com_Other
1954    1   5   1.44695848  0.1 #   Com_Other
1955    1   5   7.930602528 0.1 #   Com_Other
1956    1   5   0.745251656 0.1 #   Com_Other
1957    1   5   0.52843468  0.1 #   Com_Other
1958    1   5   0.542496032 0.1 #   Com_Other
1959    1   5   0.60554532  0.1 #   Com_Other
1960    1   5   1.01604608  0.1 #   Com_Other
1961    1   5   0.483529072 0.1 #   Com_Other
1962    1   5   2.064297192 0.1 #   Com_Other
1963    1   5   0.871350232 0.1 #   Com_Other
1964    1   5   0.307081784 0.1 #   Com_Other
1965    1   5   0.227703184 0.1 #   Com_Other
1966    1   5   0.139252744 0.1 #   Com_Other
1967    1   5   0.127459352 0.1 #   Com_Other
1968    1   5   0.370131072 0.1 #   Com_Other
1969    1   5   0.605998912 0.1 #   Com_Other
1970    1   5   0.249022008 0.1 #   Com_Other
1971    1   5   0.30390664  0.1 #   Com_Other
1972    1   5   0.205930768 0.1 #   Com_Other
1973    1   5   0.182343984 0.1 #   Com_Other
1974    1   5   0.188694272 0.1 #   Com_Other
1975    1   5   0.296195576 0.1 #   Com_Other
1976    1   5   0.729375936 0.1 #   Com_Other
1977    1   5   1.639281488 0.1 #   Com_Other
1978    1   5   1.722288824 0.1 #   Com_Other
1979    1   5   1.1793392   0.1 #   Com_Other
1980    1   5   0.825991032 0.1 #   Com_Other
1981    1   5   1.351250568 0.1 #   Com_Other
1982    1   5   0.960254264 0.1 #   Com_Other
1983    1   5   1.862902344 0.1 #   Com_Other
1984    1   5   0.8731646   0.1 #   Com_Other
1985    1   5   0.32658624  0.1 #   Com_Other
1986    1   5   5.56103792  0.1 #   Com_Other
1987    1   5   0.860010432 0.1 #   Com_Other
1988    1   5   3.622839304 0.1 #   Com_Other
1989    1   5   0.692634984 0.1 #   Com_Other
1990    1   5   0.990644928 0.1 #   Com_Other
1991    1   5   1.240120528 0.1 #   Com_Other
1992    1   5   0.968872512 0.1 #   Com_Other
1993    1   5   1.117650688 0.1 #   Com_Other
1994    1   5   0.7824462   0.1 #   Com_Other
1995    1   5   0.6123492   0.1 #   Com_Other
1996    1   5   0.844134712 0.1 #   Com_Other
1997    1   5   0.62595696  0.1 #   Com_Other
1998    1   5   0.850485    0.1 #   Com_Other
1999    1   5   0.904008856 0.1 #   Com_Other
2000    1   5   0.63616278  0.1 #   Com_Other
2001    1   5   0.591030376 0.1 #   Com_Other
2002    1   5   1.382140183 0.1 #   Com_Other
2003    1   5   1.062947493 0.1 #   Com_Other
2004    1   5   1.518762094 0.1 #   Com_Other
2005    1   5   1.890798252 0.1 #   Com_Other
2006    1   5   2.029869559 0.1 #   Com_Other
2007    1   5   1.667948502 0.1 #   Com_Other
2008    1   5   1.658241634 0.1 #   Com_Other
2009    1   5   2.329330998 0.1 #   Com_Other
2010    1   5   4.968238535 0.1 #   Com_Other
2011    1   5   3.636492423 0.1 #   Com_Other
2012    1   5   4.817509914 0.1 #   Com_Other
2013    1   5   6.282748151 0.1 #   Com_Other
2014    1   5   7.110099959 0.1 #   Com_Other
2015    1   5   7.097535461 0.1 #   Com_Other
2016    1   5   8.987018296 0.1 #   Com_Other
2017    1   5   6.435291141 0.1 #   Com_Other
2018    1   5   6.539934815 0.1 #   Com_Other
2019    1   5   7.751751202 0.1 #   Com_Other
2020    1   5   3.985985059 0.1 #   Com_Other
2021    1   5   4.468017278 0.1 #   Com_Other
2022    1   5   2.902852722 0.1 #   Com_Other
2023    1   5   3.382299466 0.1 #   Com_Other
-999    1   6   0   0.4 #   Rec
1948    1   6   29.4682865  0.4 #   Rec
1949    1   6   29.4682865  0.4 #   Rec
1950    1   6   29.4682865  0.4 #   Rec
1951    1   6   30.41505876 0.4 #   Rec
1952    1   6   30.59257856 0.4 #   Rec
1953    1   6   30.17836569 0.4 #   Rec
1954    1   6   29.88249936 0.4 #   Rec
1955    1   6   31.89439041 0.4 #   Rec
1956    1   6   33.07785573 0.4 #   Rec
1957    1   6   34.55718738 0.4 #   Rec
1958    1   6   35.79982597 0.4 #   Rec
1959    1   6   36.80577149 0.4 #   Rec
1960    1   6   37.98923681 0.4 #   Rec
1961    1   6   38.99518234 0.4 #   Rec
1962    1   6   40.47451399 0.4 #   Rec
1963    1   6   40.35616746 0.4 #   Rec
1964    1   6   41.42128625 0.4 #   Rec
1965    1   6   41.65797931 0.4 #   Rec
1966    1   6   42.01301891 0.4 #   Rec
1967    1   6   42.78227137 0.4 #   Rec
1968    1   6   43.43317729 0.4 #   Rec
1969    1   6   44.37994955 0.4 #   Rec
1970    1   6   45.5582668  0.4 #   Rec
1971    1   6   47.4358937  0.4 #   Rec
1972    1   6   49.01505065 0.4 #   Rec
1973    1   6   50.39165752 0.4 #   Rec
1974    1   6   51.36109313 0.4 #   Rec
1975    1   6   52.43698146 0.4 #   Rec
1976    1   6   53.50393462 0.4 #   Rec
1977    1   6   54.33638412 0.4 #   Rec
1978    1   6   55.1248679  0.4 #   Rec
1979    1   6   56.41022958 0.4 #   Rec
1980    1   6   57.26256131 0.4 #   Rec
1981    1   6   57.882993   0.4 #   Rec
1982    1   6   58.80520835 0.4 #   Rec
1983    1   6   59.92577249 0.4 #   Rec
1984    1   6   60.825502   0.4 #   Rec
1985    1   6   61.52232638 0.4 #   Rec
1986    1   6   62.23619266 0.4 #   Rec
1987    1   6   63.19219595 0.4 #   Rec
1988    1   6   63.89694955 0.4 #   Rec
1989    1   6   64.77034696 0.4 #   Rec
1990    1   6   65.84227067 0.4 #   Rec
1991    1   6   66.94934331 0.4 #   Rec
1992    1   6   68.04487715 0.4 #   Rec
1993    1   6   68.73022192 0.4 #   Rec
1994    1   6   69.46367456 0.4 #   Rec
1995    1   6   69.85344886 0.4 #   Rec
1996    1   6   70.08682822 0.4 #   Rec
1997    1   6   70.37606714 0.4 #   Rec
1998    1   6   70.4441164  0.4 #   Rec
1999    1   6   70.1497294  0.4 #   Rec
2000    1   6   71.80788266 0.4 #   Rec
2001    1   6   72.54334719 0.4 #   Rec
2002    1   6   73.35194987 0.4 #   Rec
2003    1   6   62.64352642 0.4 #   Rec
2004    1   6   84.64340532 0.4 #   Rec
2005    1   6   117.1348517 0.4 #   Rec
2006    1   6   71.10402179 0.4 #   Rec
2007    1   6   45.71914546 0.4 #   Rec
2008    1   6   31.37578955 0.4 #   Rec
2009    1   6   40.89959835 0.4 #   Rec
2010    1   6   78.68465671 0.4 #   Rec
2011    1   6   117.8051397 0.4 #   Rec
2012    1   6   194.5590092 0.4 #   Rec
2013    1   6   54.82023711 0.4 #   Rec
2014    1   6   98.5568213  0.4 #   Rec
2015    1   6   68.40658067 0.4 #   Rec
2016    1   6   57.55265705 0.4 #   Rec
2017    1   6   54.57175396 0.4 #   Rec
2018    1   6   84.44248866 0.4 #   Rec
2019    1   6   30.90761803 0.4 #   Rec
2020    1   6   92.52634402 0.4 #   Rec
2021    1   6   71.73169618 0.4 #   Rec
2022    1   6   108.6615421 0.4 #   Rec
2023    1   6   80.76925515 0.4 #   Rec
-9999   0   0   0   0       
#
#_CPUE_and_surveyabundance_observations
#_Units:  0=numbers; 1=biomass; 2=F; >=30 for special types
#_Errtype:  -1=normal; 0=lognormal; >0=T
#_SD_Report: 0=no sdreport; 1=enable sdreport
#_Fleet Units Errtype SD_Report
      1     1       0 0  # Com_DSH_Old
      2     1       0 0  # Com_DSH_Recent
      3     1       0 0  # Com_ISH
      4     1       0 0  # Com_Trol
      5     1       0 0  # Com_Others
      6     1       0 0  # Rec
      7	    0       0 0  # Divers
#
#_yr month fleet obs stderr
1948    1   1   9.675408416 0.070927339 #_  COM_DSH_Old
1949    1   1   9.398472749 0.074549678 #_  COM_DSH_Old
1950    1   1   8.721110482 0.085524145 #_  COM_DSH_Old
1951    1   1   8.511701951 0.091796112 #_  COM_DSH_Old
1952    1   1   9.024515559 0.094267647 #_  COM_DSH_Old
1953    1   1   11.90037025 0.098269875 #_  COM_DSH_Old
1954    1   1   11.6080975  0.101966404 #_  COM_DSH_Old
1955    1   1   11.13859055 0.109573414 #_  COM_DSH_Old
1956    1   1   9.914452585 0.119829521 #_  COM_DSH_Old
1957    1   1   11.50136924 0.112831082 #_  COM_DSH_Old
1958    1   1   13.18875307 0.096262106 #_  COM_DSH_Old
1959    1   1   8.006551273 0.104667126 #_  COM_DSH_Old
1960    1   1   7.542116843 0.102933074 #_  COM_DSH_Old
1961    1   1   7.852253966 0.106586578 #_  COM_DSH_Old
1962    1   1   8.805824356 0.099939437 #_  COM_DSH_Old
1963    1   1   9.636008153 0.091824279 #_  COM_DSH_Old
1964    1   1   9.081056759 0.085720892 #_  COM_DSH_Old
1965    1   1   8.54770682  0.085349494 #_  COM_DSH_Old
1966    1   1   8.522711462 0.082496971 #_  COM_DSH_Old
1967    1   1   7.234835243 0.086521471 #_  COM_DSH_Old
1968    1   1   8.538814248 0.081347213 #_  COM_DSH_Old
1969    1   1   7.963704966 0.087003813 #_  COM_DSH_Old
1970    1   1   7.929093258 0.084401311 #_  COM_DSH_Old
1971    1   1   8.017687719 0.085798475 #_  COM_DSH_Old
1972    1   1   9.33857277  0.083841472 #_  COM_DSH_Old
1973    1   1   9.905677852 0.080412553 #_  COM_DSH_Old
1974    1   1   10.95499906 0.0805239   #_  COM_DSH_Old
1975    1   1   10.18732959 0.088442166 #_  COM_DSH_Old
1976    1   1   9.391243018 0.080180036 #_  COM_DSH_Old
1977    1   1   7.547626124 0.080180036 #_  COM_DSH_Old
1978    1   1   11.85499264 0.081363554 #_  COM_DSH_Old
1979    1   1   10.68858815 0.077360939 #_  COM_DSH_Old
1980    1   1   9.073412908 0.07712145  #_  COM_DSH_Old
1981    1   1   8.47227933  0.075021671 #_  COM_DSH_Old
1982    1   1   7.891136368 0.073679497 #_  COM_DSH_Old
1983    1   1   8.036874281 0.074272693 #_  COM_DSH_Old
1984    1   1   7.14981339  0.073134598 #_  COM_DSH_Old
1985    1   1   6.309608472 0.076436711 #_  COM_DSH_Old
1986    1   1   8.021113341 0.0755781   #_  COM_DSH_Old
1987    1   1   6.758628477 0.079766724 #_  COM_DSH_Old
1988    1   1   11.59450968 0.072203957 #_  COM_DSH_Old
1989    1   1   8.11445449  0.075292859 #_  COM_DSH_Old
1990    1   1   6.336952796 0.078345216 #_  COM_DSH_Old
1991    1   1   6.470795436 0.079319994 #_  COM_DSH_Old
1992    1   1   6.97254853  0.079983487 #_  COM_DSH_Old
1993    1   1   7.190953864 0.077684219 #_  COM_DSH_Old
1994    1   1   6.499747973 0.078630335 #_  COM_DSH_Old
1995    1   1   6.083444533 0.075974995 #_  COM_DSH_Old
1996    1   1   6.014419515 0.080809369 #_  COM_DSH_Old
1997    1   1   6.687979096 0.079081873 #_  COM_DSH_Old
1998    1   1   6.021227077 0.082867704 #_  COM_DSH_Old
1999    1   1   7.346410668 0.078997011 #_  COM_DSH_Old
2000    1   1   7.250313918 0.07945243  #_  COM_DSH_Old
2001    1   1   6.973996532 0.081254125 #_  COM_DSH_Old
2002    1   1   6.019165562 0.084803787 #_  COM_DSH_Old
2003    1   2   0.765630901 0.070211987 #_  COM_DSH_Recent
2004    1   2   1.032880743 0.066079196 #_  COM_DSH_Recent
2005    1   2   1.015296711 0.066360424 #_  COM_DSH_Recent
2006    1   2   0.983918979 0.066566304 #_  COM_DSH_Recent
2007    1   2   1.153094371 0.064840986 #_  COM_DSH_Recent
2008    1   2   1.139993547 0.063560433 #_  COM_DSH_Recent
2009    1   2   0.860643434 0.068175393 #_  COM_DSH_Recent
2010    1   2   1.263900261 0.06215279  #_  COM_DSH_Recent
2011    1   2   1.161102379 0.066083459 #_  COM_DSH_Recent
2012    1   2   1.06018523  0.067439324 #_  COM_DSH_Recent
2013    1   2   1.334789587 0.064914768 #_  COM_DSH_Recent
2014    1   2   1.174294581 0.068286257 #_  COM_DSH_Recent
2015    1   2   1.544854059 0.065592171 #_  COM_DSH_Recent
2016    1   2   1.448372145 0.069170283 #_  COM_DSH_Recent
2017    1   2   1.596583483 0.066173514 #_  COM_DSH_Recent
2018    1   2   1.228404002 0.075477764 #_  COM_DSH_Recent
2019    1   2   1.574916885 0.071503171 #_  COM_DSH_Recent
2020    1   2   1.43625164  0.077748697 #_  COM_DSH_Recent
2021    1   2   1.788701857 0.07610528  #_  COM_DSH_Recent
2022    1   2   1.459114629 0.075515028 #_  COM_DSH_Recent
2023    1   2   1.510709419 0.077818307 #_  COM_DSH_Recent
2003    1   3   0.66714304  0.11506927  #_  COM_ISH_Recent
2004    1   3   1.039450453 0.105901758 #_  COM_ISH_Recent
2005    1   3   1.019632296 0.12055763  #_  COM_ISH_Recent
2006    1   3   1.39882607  0.117822416 #_  COM_ISH_Recent
2007    1   3   1.513676571 0.109488802 #_  COM_ISH_Recent
2008    1   3   1.175814535 0.108484949 #_  COM_ISH_Recent
2009    1   3   0.903741096 0.11436332  #_  COM_ISH_Recent
2010    1   3   1.232453251 0.110076947 #_  COM_ISH_Recent
2011    1   3   1.388898326 0.111346569 #_  COM_ISH_Recent
2012    1   3   1.42798805  0.101860812 #_  COM_ISH_Recent
2013    1   3   1.423487585 0.112046765 #_  COM_ISH_Recent
2014    1   3   1.596109477 0.110463887 #_  COM_ISH_Recent
2015    1   3   1.807169358 0.109336675 #_  COM_ISH_Recent
2016    1   3   1.934966034 0.116479418 #_  COM_ISH_Recent
2017    1   3   2.188673169 0.115099623 #_  COM_ISH_Recent
2018    1   3   2.382985151 0.102451166 #_  COM_ISH_Recent
2019    1   3   2.082578063 0.107150058 #_  COM_ISH_Recent
2020    1   3   2.04251763  0.113044376 #_  COM_ISH_Recent
2021    1   3   1.60548043  0.131278115 #_  COM_ISH_Recent
2022    1   3   1.778383044 0.145639152 #_  COM_ISH_Recent
2023    1   3   1.383165477 0.177352129 #_  COM_ISH_Recent
2003    1   4   0.036094665 0.165372752 #_  COM_Trol_Recent
2004    1   4   0.038465209 0.160857537 #_  COM_Trol_Recent
2005    1   4   0.043206393 0.161828317 #_  COM_Trol_Recent
2006    1   4   0.030446937 0.1661665   #_  COM_Trol_Recent
2007    1   4   0.041214411 0.166901158 #_  COM_Trol_Recent
2008    1   4   0.050784781 0.161654124 #_  COM_Trol_Recent
2009    1   4   0.043267345 0.165818825 #_  COM_Trol_Recent
2010    1   4   0.085377014 0.151167497 #_  COM_Trol_Recent
2011    1   4   0.069130803 0.157819814 #_  COM_Trol_Recent
2012    1   4   0.071141922 0.158136236 #_  COM_Trol_Recent
2013    1   4   0.122793676 0.145268299 #_  COM_Trol_Recent
2014    1   4   0.107799723 0.152255843 #_  COM_Trol_Recent
2015    1   4   0.094731911 0.158092693 #_  COM_Trol_Recent
2016    1   4   0.08985874  0.164814959 #_  COM_Trol_Recent
2017    1   4   0.114185305 0.165823004 #_  COM_Trol_Recent
2018    1   4   0.09624097  0.162165724 #_  COM_Trol_Recent
2019    1   4   0.121197924 0.154230514 #_  COM_Trol_Recent
2020    1   4   0.153903571 0.167135143 #_  COM_Trol_Recent
2021    1   4   0.154980222 0.154391554 #_  COM_Trol_Recent
2022    1   4   0.106761336 0.170913609 #_  COM_Trol_Recent
2023    1   4   0.145114653 0.168554658 #_  COM_Trol_Recent
2005    1   7   0.013773475 0.572700837 #_  Divers
2008    1   7   0.123065751 0.492798162 #_  Divers
2010    1   7   0.075102188 0.437647652 #_  Divers
2012    1   7   0.042595909 0.215817989 #_  Divers
2015    1   7   0.044845282 0.385283026 #_  Divers
2016    1   7   0.045212114 0.313540663 #_  Divers
2019    1   7   0.059053681 0.420806921 #_  Divers
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
76 # Number of years
# Bin definition (lowest edge)
0.226796  0.680388  1.13398 1.587572  2.041164  2.494756  2.948348  3.40194 3.855532  4.309124  4.762716  5.216308  5.6699  6.123492  6.577084  7.030676  7.484268  7.93786 8.391452  8.845044  9.298636  9.752228  10.20582  10.659412 11.113004 11.566596 12.020188 12.47378  12.927372 13.380964 13.834556 14.288148
#Method Year  Season  Fleet Gender  Partition SampSize  1 2 3 4 5 6 7 8 9 10  11  12  13  14  15  16  17  18  19  20  21  22  23  24  25  26  27  28  29  30  31  32
1   1948    1   1   0   2   46  0   3   10  16  11  20  15  8   17  6   11  8   8   3   4   5   1   0   0   1   0   0   1   0   0   0   0   0   0   1   0   0
1   1949    1   1   0   2   38  1   3   3   12  15  17  7   15  8   9   14  4   2   4   6   3   0   0   1   2   1   0   0   0   0   0   0   0   0   0   0   0
1   1950    1   1   0   2   42  0   4   5   8   12  16  20  21  15  19  9   8   2   9   2   1   0   1   0   1   1   0   0   1   0   1   0   0   0   1   0   0
1   1951    1   1   0   2   21  0   1   1   4   9   4   6   8   4   9   4   1   6   4   3   1   1   1   0   0   0   0   0   0   0   1   0   0   0   0   0   0
1   1952    1   1   0   2   28  0   1   3   6   5   7   10  12  17  10  7   8   3   6   2   0   1   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0
1   1953    1   1   0   2   16  0   1   2   2   5   5   4   5   2   5   3   6   5   1   5   0   1   0   0   0   0   0   0   0   0   0   1   0   0   0   0   0
1   1954    1   1   0   2   23  0   0   3   4   8   7   11  12  6   12  11  5   8   0   1   0   0   0   0   0   0   1   0   0   0   0   0   0   0   0   0   0
1   1955    1   1   0   2   14  0   0   3   2   3   1   3   6   1   4   4   5   3   1   2   1   2   0   0   0   1   0   0   0   0   0   0   0   0   0   0   0
1   1956    1   1   0   2   12  0   0   0   1   5   2   4   3   7   12  1   1   1   0   1   1   0   1   1   0   0   0   0   0   0   0   0   0   1   0   0   0
1   1957    1   1   0   2   21  0   0   0   0   1   7   2   11  7   9   5   6   6   4   2   1   0   1   0   0   0   0   0   0   0   0   0   0   0   0   0   0
1   1958    1   1   0   2   25  0   1   2   4   2   5   4   11  6   7   9   4   5   3   5   1   1   1   0   1   0   0   0   0   0   0   0   0   0   0   0   0
1   1959    1   1   0   2   20  0   0   1   8   4   5   1   8   3   4   4   7   5   3   4   3   1   3   1   2   0   1   0   0   0   0   0   0   0   0   0   0
1   1960    1   1   0   2   17  0   0   1   1   3   5   3   5   2   10  4   5   2   5   2   1   4   0   1   0   1   0   1   0   1   0   0   0   0   0   0   0
1   1961    1   1   0   2   14  0   1   2   3   4   5   2   8   4   4   0   8   6   7   6   0   0   0   1   0   0   2   1   0   0   1   0   0   0   0   0   0
1   1962    1   1   0   2   13  0   0   2   1   2   7   1   1   1   7   4   6   3   4   4   5   1   0   1   2   0   0   0   0   1   1   0   0   0   0   0   1
1   1963    1   1   0   2   34  0   0   4   10  3   6   7   10  5   8   10  6   7   4   7   6   4   2   1   0   0   0   0   0   0   0   0   0   0   0   0   0
1   1964    1   1   0   2   36  0   2   1   9   8   11  3   14  7   17  11  8   5   3   6   5   0   1   0   0   0   0   0   0   0   0   1   0   0   0   0   0
1   1965    1   1   0   2   23  0   3   3   7   8   3   6   6   7   20  5   6   5   9   1   5   1   2   1   1   0   1   0   0   0   1   0   0   0   0   0   0
1   1966    1   1   0   2   30  1   8   1   16  6   9   7   8   10  9   5   8   3   9   5   2   1   3   2   0   0   1   1   1   1   0   0   0   1   0   0   0
1   1967    1   1   0   2   36  0   3   7   12  8   7   2   22  10  19  9   4   6   6   2   1   3   2   1   1   1   2   0   0   0   0   0   0   0   0   0   0
1   1968    1   1   0   2   35  1   3   2   10  7   11  11  14  6   11  3   2   7   3   7   3   2   6   1   3   1   1   1   0   3   0   0   0   0   0   0   0
1   1969    1   1   0   2   39  2   4   6   14  7   9   9   19  9   15  6   9   4   4   5   2   6   1   0   0   0   1   0   0   0   0   2   0   0   0   1   0
1   1970    1   1   0   2   28  0   4   4   10  7   9   7   7   7   9   6   7   5   2   7   3   0   4   0   1   1   0   1   0   2   0   0   1   0   0   0   1
1   1971    1   1   0   2   37  3   5   4   17  11  15  10  19  5   12  9   10  3   2   5   0   1   2   4   1   0   0   0   0   0   0   0   1   0   0   0   0
1   1972    1   1   0   2   47  3   11  7   18  6   25  15  10  3   17  10  14  6   10  7   2   1   4   0   1   0   2   2   1   0   0   0   1   1   0   0   0
1   1973    1   1   0   2   49  1   9   11  20  16  23  11  16  4   14  10  6   3   5   4   2   3   4   1   2   1   0   0   0   2   0   0   0   0   0   1   0
1   1974    1   1   0   2   53  0   3   9   16  21  23  20  16  16  20  9   11  3   6   6   5   2   1   0   2   1   1   0   1   0   1   0   0   0   0   0   0
1   1975    1   1   0   2   57  2   1   3   16  22  26  18  24  13  23  5   10  5   3   6   3   1   3   2   1   0   1   0   0   0   0   0   0   0   0   0   0
1   1976    1   1   0   2   62  5   3   12  17  22  25  22  15  12  28  19  11  7   4   4   2   1   3   2   2   1   1   0   0   0   0   0   0   1   1   0   0
1   1977    1   1   0   2   66  5   11  12  26  19  24  30  22  11  24  11  12  14  7   6   6   3   2   1   2   1   1   1   0   1   0   0   0   0   1   0   0
1   1978    1   1   0   2   46  2   6   4   11  23  22  17  9   13  10  8   6   2   3   8   4   0   3   0   0   0   0   1   0   0   0   1   0   0   0   0   0
1   1979    1   1   0   2   69  3   5   14  20  31  18  38  28  19  15  11  15  5   5   8   5   4   2   1   3   0   0   0   0   0   1   0   0   0   0   0   0
1   1980    1   1   0   2   115 3   10  21  30  29  31  30  30  29  33  16  17  15  10  8   11  7   10  5   6   3   1   2   0   0   2   0   0   1   1   0   0
1   1981    1   1   0   2   160 4   9   28  27  52  45  44  46  32  44  23  27  17  17  11  10  6   4   3   7   1   3   2   1   0   1   2   0   0   0   0   0
1   1982    1   1   0   2   170 8   19  30  39  44  59  44  59  49  37  28  45  24  17  23  10  11  7   7   1   4   0   4   3   0   1   1   0   0   0   1   0
1   1983    1   1   0   2   210 2   15  25  55  50  79  46  62  50  72  35  33  23  26  15  15  8   13  6   9   3   5   2   1   3   2   1   0   1   1   0   1
1   1984    1   1   0   2   199 11  57  29  53  54  78  48  48  40  64  40  36  29  41  24  13  11  12  5   7   3   2   0   1   0   1   0   1   0   6   1   0
1   1985    1   1   0   2   114 5   22  11  32  22  33  17  47  14  29  13  15  17  19  12  6   4   6   4   0   0   0   0   1   1   0   0   1   0   1   0   0
1   1986    1   1   0   2   84  3   16  15  15  19  35  29  23  21  30  14  22  14  11  13  10  4   6   1   2   4   2   2   1   0   0   1   0   0   0   0   0
1   1987    1   1   0   2   91  1   3   6   15  30  52  39  42  32  23  22  20  16  7   11  6   7   1   0   6   0   3   1   1   0   0   0   0   0   0   0   0
1   1988    1   1   0   2   217 2   8   29  47  78  93  80  86  60  74  47  41  32  32  28  27  11  19  6   10  3   10  7   2   1   1   1   2   0   0   1   0
1   1989    1   1   0   2   218 6   18  22  36  68  71  66  76  66  67  51  40  39  39  28  10  10  6   14  5   3   4   3   2   3   0   4   1   0   1   1   0
1   1990    1   1   0   2   140 3   19  40  41  54  32  49  39  24  31  24  24  20  19  20  14  6   5   3   3   1   0   1   2   0   1   1   0   0   0   0   0
1   1991    1   1   0   2   110 0   1   13  34  40  46  33  35  31  25  16  19  18  11  7   5   7   3   1   4   1   2   1   0   0   1   1   1   0   0   1   0
1   1992    1   1   0   2   107 4   9   7   21  46  32  37  43  29  35  17  22  18  10  13  4   5   1   1   7   0   1   0   1   2   0   0   0   0   0   0   0
1   1993    1   1   0   2   40  0   0   5   12  15  11  20  10  14  12  4   12  3   7   3   3   2   2   1   1   0   0   0   0   0   1   0   0   0   0   1   0
1   1994    1   1   0   2   105 1   5   12  16  41  32  41  42  33  32  24  39  17  13  18  4   1   4   1   0   0   0   0   0   1   0   1   0   1   0   1   0
1   1995    1   1   0   2   91  2   1   5   21  41  35  34  35  36  43  32  23  15  12  8   6   2   6   1   3   1   1   1   0   0   0   0   0   0   0   1   0
1   1996    1   1   0   2   84  0   2   5   12  23  37  31  36  23  31  20  15  9   9   9   7   5   1   3   0   2   0   2   1   0   0   0   0   0   0   0   0
1   1997    1   1   0   2   117 3   10  11  27  38  36  42  29  23  38  31  20  15  17  8   6   4   1   1   1   1   1   0   0   0   0   0   0   0   1   0   0
1   1998    1   1   0   2   111 1   7   12  27  39  47  29  30  17  40  18  18  13  16  5   8   2   0   2   2   0   1   1   2   0   0   2   0   0   0   0   0
1   1999    1   1   0   2   90  3   3   6   20  33  28  35  29  31  29  22  22  12  11  13  9   2   2   3   4   3   0   0   0   0   0   0   0   0   0   0   0
1   2000    1   1   0   2   103 1   1   7   28  40  37  32  43  40  28  27  26  22  9   21  4   4   3   2   2   1   3   1   1   1   0   0   0   0   1   0   0
1   2001    1   1   0   2   84  0   0   4   12  31  36  37  35  22  19  19  13  16  10  14  4   3   3   2   1   1   1   0   0   1   0   1   0   0   0   0   0
1   2002    1   1   0   2   70  0   0   4   15  29  29  24  28  17  31  16  13  12  7   8   3   2   1   0   3   0   3   0   0   2   0   0   0   0   0   0   0
1   2003    1   1   0   2   72  0   1   1   10  14  42  20  35  16  25  10  16  8   8   4   4   2   4   1   2   0   0   1   0   1   0   0   0   1   0   0   0
1   2004    1   1   0   2   70  2   4   4   17  18  22  19  27  12  30  21  10  5   6   3   5   2   1   0   1   0   0   0   0   0   0   0   0   2   0   0   0
1   2005    1   1   0   2   66  1   1   10  25  17  16  14  36  12  27  9   13  6   7   10  4   1   6   0   3   0   1   0   0   0   1   0   0   0   0   0   0
1   2006    1   1   0   2   71  1   1   6   28  23  27  21  33  14  26  6   13  11  5   9   5   3   1   2   1   0   0   0   0   0   1   0   0   0   0   0   0
1   2007    1   1   0   2   57  0   1   3   8   20  34  19  31  11  21  14  12  2   2   5   4   4   2   0   0   0   1   0   0   0   0   0   0   0   1   0   0
1   2008    1   1   0   2   63  0   2   5   13  20  42  22  27  7   17  5   16  4   6   5   5   0   1   1   0   0   0   0   0   0   0   1   0   0   0   0   0
1   2009    1   1   0   2   74  0   0   4   13  13  34  15  36  14  33  12  17  7   10  2   8   1   3   1   0   2   0   0   0   0   0   0   0   0   0   0   0
1   2010    1   1   0   2   80  0   4   3   19  12  10  20  32  15  24  11  17  6   8   9   5   4   2   0   4   1   0   0   1   0   0   0   2   0   0   0   0
1   2011    1   1   0   2   73  0   2   4   13  12  18  16  35  18  24  9   19  9   8   5   4   4   3   0   0   0   0   0   0   0   0   0   0   0   0   0   0
1   2012    1   1   0   2   75  0   1   7   12  14  22  22  20  18  25  9   16  9   8   10  4   1   0   3   5   1   1   0   0   1   0   0   0   0   0   0   0
1   2013    1   1   0   2   68  0   1   4   13  14  19  19  14  13  27  11  21  7   10  14  4   1   5   2   2   0   1   0   0   0   0   1   0   0   0   0   0
1   2014    1   1   0   2   67  3   0   0   18  14  22  20  27  10  14  9   13  5   9   8   7   2   5   1   0   0   0   0   0   0   0   0   1   0   0   0   0
1   2015    1   1   0   2   63  1   6   2   13  14  28  13  23  18  22  4   17  12  10  4   3   2   3   0   0   0   0   0   0   0   0   0   0   0   0   0   0
1   2016    1   1   0   2   74  1   6   8   23  35  27  17  32  21  27  10  12  3   10  5   3   1   1   0   3   1   0   0   0   0   0   0   0   0   0   0   0
1   2017    1   1   0   2   83  0   1   4   19  23  34  14  37  13  27  9   17  11  6   7   3   5   2   3   4   1   0   0   0   0   0   1   0   0   0   0   0
1   2018    1   1   0   2   49  0   0   4   9   13  21  13  17  11  18  8   9   5   7   5   3   2   0   0   1   1   1   0   0   0   0   0   0   0   0   0   0
1   2019    1   1   0   2   46  0   2   3   17  14  23  11  13  8   17  7   12  2   1   8   1   2   1   1   1   1   0   0   0   1   0   0   0   0   0   0   0
1   2020    1   1   0   2   36  1   2   6   3   15  17  8   21  5   13  7   8   4   8   6   3   1   4   0   0   0   0   0   0   0   0   0   0   0   0   0   0
1   2021    1   1   0   2   28  0   0   1   2   7   18  5   13  3   18  5   4   3   9   2   3   0   1   0   3   0   1   0   0   0   0   0   0   0   0   0   0
1   2022    1   1   0   2   41  0   0   3   7   10  18  14  25  13  12  8   7   3   10  4   1   1   0   1   0   1   2   1   1   0   0   0   0   0   0   0   0
1   2023    1   1   0   2   28  0   0   2   8   7   10  6   19  10  16  3   4   0   3   4   1   0   1   0   1   0   1   0   1   0   0   0   0   0   0   0   0
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



