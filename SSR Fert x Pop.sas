DATA SOY;
    INPUT STATE $ YEAR $ ENV $ SPLIT $ REP $ TRT $ POP $ FERT $ FUNG $ DI DS DIX 
        YBU YKG PROF_GL_ac PROF_GM_AC PROF_GH_AC PROF_GL_HA PROF_GM_HA  PROF_GH_HA;
    CARDS;
    /* Data from file ____ */
RUN;

/* ALL LOCATIONS */
    /* Disease Inicidence */
        /* Seeding Rate */
            PROC GLIMMIX DATA=SOY PLOTS=STUDENTPANEL NOBOUND;
                ODS OUTPUT LSMEANS=LSMEANS DIFFS=DIFFS;
                CLASS ENV REP POP FERT FUNG;
                MODEL DI=POP|FERT|FUNG/DIST=LOGNORMAL DDFM=KR2;
                RANDOM INT/ SUBJECT=REP GROUP=ENV;
                LSMEANS POP/ILINK PDIFF;
                %mult(trt=POP, alpha=0.05);
            run;
            data btdata;
                set lsmeans;
                omega=exp(stderr*stderr);
                btlsmean=exp(estimate)*sqrt(omega);
                btvar=exp(2*estimate)*omega*(omega-1);
                btse_mean=sqrt(btvar);
            run;
            proc print;
            run;
        /* Fertilizer */
            PROC GLIMMIX DATA=SOY PLOTS=STUDENTPANEL NOBOUND;
                ODS OUTPUT LSMEANS=LSMEANS DIFFS=DIFFS;
                CLASS ENV REP POP FERT FUNG;
                MODEL DI=POP|FERT|FUNG/DIST=LOGNORMAL DDFM=KR2;
                RANDOM INT/ SUBJECT=REP GROUP=ENV;
                LSMEANS fert/ILINK PDIFF;
                %mult(trt=Fert, alpha=0.05);
            run;
            data btdata;
                set lsmeans;
                omega=exp(stderr*stderr);
                btlsmean=exp(estimate)*sqrt(omega);
                btvar=exp(2*estimate)*omega*(omega-1);
                btse_mean=sqrt(btvar);
            run;
            proc print;
            run;
        /* Fungicide */
            PROC GLIMMIX DATA=SOY PLOTS=STUDENTPANEL NOBOUND;
                ODS OUTPUT LSMEANS=LSMEANS DIFFS=DIFFS;
                CLASS ENV REP POP FERT FUNG;
                MODEL DI=POP|FERT|FUNG/DIST=LOGNORMAL DDFM=KR2;
                RANDOM INT/ SUBJECT=REP GROUP=ENV;
                LSMEANS FUNG/ILINK PDIFF;
                %mult(trt=FUNG, alpha=0.05);
            run;
            data btdata;
                set lsmeans;
                omega=exp(stderr*stderr);
                btlsmean=exp(estimate)*sqrt(omega);
                btvar=exp(2*estimate)*omega*(omega-1);
                btse_mean=sqrt(btvar);
            run;
            proc print;
            run;
        /* Pop*Fert*Fung */
            PROC GLIMMIX DATA=SOY PLOTS=STUDENTPANEL NOBOUND;
                ODS OUTPUT LSMEANS=LSMEANS DIFFS=DIFFS;
                CLASS ENV REP POP FERT FUNG;
                MODEL DI=POP|FERT|FUNG/DIST=lognormal DDFM=KR2;
                RANDOM INT/ SUBJECT=REP GROUP=ENV;
                LSMEANS POP*FERT*FUNG/ILINK PDIFF;
                %mult(trt=FUNG, by=fert, by2=Pop, alpha=0.05);
            run;
            data btdata;
                set lsmeans;
                omega=exp(stderr*stderr);
                btlsmean=exp(estimate)*sqrt(omega);
                btvar=exp(2*estimate)*omega*(omega-1);
                btse_mean=sqrt(btvar);
            run;
            proc print;
            run;
    /* Disease Severity Index (DIX) */
        /* Seeding Rate */
            PROC GLIMMIX DATA=SOY PLOTS=STUDENTPANEL NOBOUND;
                ODS OUTPUT LSMEANS=LSMEANS DIFFS=DIFFS;
                CLASS ENV REP POP FERT FUNG;
                MODEL DIX=POP|FERT|FUNG/DIST=LOGNORMAL DDFM=KR2;
                RANDOM INT/ SUBJECT=REP GROUP=ENV;
                LSMEANS POP/ILINK PDIFF;
                %mult(trt=POP, alpha=0.05);
            run;
            data btdata;
                set lsmeans;
                omega=exp(stderr*stderr);
                btlsmean=exp(estimate)*sqrt(omega);
                btvar=exp(2*estimate)*omega*(omega-1);
                btse_mean=sqrt(btvar);
            run;
            proc print;
            run;
        /* Fertilizer */
            PROC GLIMMIX DATA=SOY PLOTS=STUDENTPANEL NOBOUND;
                ODS OUTPUT LSMEANS=LSMEANS DIFFS=DIFFS;
                CLASS ENV REP POP FERT FUNG;
                MODEL DIX=POP|FERT|FUNG/DIST=LOGNORMAL DDFM=KR2;
                RANDOM INT/ SUBJECT=REP GROUP=ENV;
                LSMEANS fert/ILINK PDIFF;
                %mult(trt=fert, alpha=0.05);
            run;
            data btdata;
                set lsmeans;
                omega=exp(stderr*stderr);
                btlsmean=exp(estimate)*sqrt(omega);
                btvar=exp(2*estimate)*omega*(omega-1);
                btse_mean=sqrt(btvar);
            run;
            proc print;
            run;
        /* Fungicide */
            PROC GLIMMIX DATA=SOY PLOTS=STUDENTPANEL NOBOUND;
                ODS OUTPUT LSMEANS=LSMEANS DIFFS=DIFFS;
                CLASS ENV REP POP FERT FUNG;
                MODEL DIX=POP|FERT|FUNG/DIST=LOGNORMAL DDFM=KR2;
                RANDOM INT/ SUBJECT=REP GROUP=ENV;
                LSMEANS FUNG/ILINK PDIFF;
                %mult(trt=FUNG, alpha=0.05);
            run;
            data btdata;
                set lsmeans;
                omega=exp(stderr*stderr);
                btlsmean=exp(estimate)*sqrt(omega);
                btvar=exp(2*estimate)*omega*(omega-1);
                btse_mean=sqrt(btvar);
            run;
            proc print;
            run;
        /* Pop*Fert*Fung */
            PROC GLIMMIX DATA=SOY PLOTS=STUDENTPANEL NOBOUND;
                ODS OUTPUT LSMEANS=LSMEANS DIFFS=DIFFS;
                CLASS ENV REP POP FERT FUNG;
                MODEL DIX=POP|FERT|FUNG/DIST=lognormal DDFM=KR2;
                RANDOM INT/ SUBJECT=REP GROUP=ENV;
                LSMEANS POP*FERT*FUNG/ILINK PDIFF;
                %mult(trt=FUNG, by=fert, by2=Pop, alpha=0.05);
            run;
            data btdata;
                set lsmeans;
                omega=exp(stderr*stderr);
                btlsmean=exp(estimate)*sqrt(omega);
                btvar=exp(2*estimate)*omega*(omega-1);
                btse_mean=sqrt(btvar);
            run;
            proc print;
            run;
    /* Yield (kg/ha) */
        /* Seeding Rate */
            PROC GLIMMIX DATA=SOY PLOTS=STUDENTPANEL NOBOUND;
                ODS OUTPUT LSMEANS=LSMEANS DIFFS=DIFFS;
                CLASS ENV REP POP FERT FUNG;
                MODEL ykg=POP|FERT|FUNG/DIST=NORMAL DDFM=KR2;
                RANDOM INT/ SUBJECT=REP GROUP=ENV;
                LSMEANS POP/ILINK PDIFF;
                %mult(trt=POP, alpha=0.05);
            run;
        /* Fertilizer */
            PROC GLIMMIX DATA=SOY PLOTS=STUDENTPANEL NOBOUND;
                ODS OUTPUT LSMEANS=LSMEANS DIFFS=DIFFS;
                CLASS ENV REP POP FERT FUNG;
                MODEL ykg=POP|FERT|FUNG/DIST=NORMAL DDFM=KR2;
                RANDOM INT/ SUBJECT=REP GROUP=ENV;
                LSMEANS fert/ILINK PDIFF;
                %mult(trt=fert, alpha=0.05);
            run;
        /* Fungicide */
            PROC GLIMMIX DATA=SOY PLOTS=STUDENTPANEL NOBOUND;
                ODS OUTPUT LSMEANS=LSMEANS DIFFS=DIFFS;
                CLASS ENV REP POP FERT FUNG;
                MODEL ykg=POP|FERT|FUNG/DIST=NORMAL DDFM=KR2;
                RANDOM INT/ SUBJECT=REP GROUP=ENV;
                LSMEANS FUNG/ILINK PDIFF;
                %mult(trt=FUNG, alpha=0.05);
            run;
        /* Pop*Fert*Fung */
            PROC GLIMMIX DATA=SOY PLOTS=STUDENTPANEL NOBOUND;
                ODS OUTPUT LSMEANS=LSMEANS DIFFS=DIFFS;
                CLASS ENV REP POP FERT FUNG;
                MODEL ykg=POP|FERT|FUNG/DIST=normal DDFM=KR2;
                RANDOM INT/ SUBJECT=REP GROUP=ENV;
                LSMEANS POP*FERT*FUNG/ILINK PDIFF;
                %mult(trt=FUNG, by=fert, by2=Pop, alpha=0.05);
            run;
    /* Partial Profit Analysis */
        /* Seeding Rate */
            PROC GLIMMIX DATA=SOY PLOTS=STUDENTPANEL NOBOUND;
                ODS OUTPUT LSMEANS=LSMEANS DIFFS=DIFFS;
                CLASS ENV REP POP FUNG FERT;
                MODEL PROF_GM_HA=POP|FUNG|FERT/DIST=NORMAL DDFM=KR2;
                RANDOM INT/ SUBJECT=REP GROUP=ENV;
                LSMEANS POP/ILINK PDIFF;
                %mult(trt=POP, alpha=0.05);
            run;
        /* Fungicide */
            PROC GLIMMIX DATA=SOY PLOTS=STUDENTPANEL NOBOUND;
                ODS OUTPUT LSMEANS=LSMEANS DIFFS=DIFFS;
                CLASS ENV REP POP FUNG FERT;
                MODEL PROF_GM_HA=POP|FUNG|FERT/DIST=NORMAL DDFM=KR2;
                RANDOM INT/ SUBJECT=REP GROUP=ENV;
                LSMEANS FUNG/ILINK PDIFF;
                %mult(trt=FUNG, alpha=0.05);
            run;
        /* Nitrogen */
            PROC GLIMMIX DATA=SOY PLOTS=STUDENTPANEL NOBOUND;
                ODS OUTPUT LSMEANS=LSMEANS DIFFS=DIFFS;
                CLASS ENV REP POP FUNG FERT;
                MODEL PROF_GM_HA=POP|FUNG|FERT/DIST=NORMAL DDFM=KR2;
                RANDOM INT/ SUBJECT=REP GROUP=ENV;
                LSMEANS FERT/ILINK PDIFF;
                %mult(trt=FERT, alpha=0.05);
            run;
        /* Pop*Fung */
            PROC GLIMMIX DATA=SOY PLOTS=STUDENTPANEL NOBOUND;
                ODS OUTPUT LSMEANS=LSMEANS DIFFS=DIFFS;
                CLASS ENV REP POP FUNG FERT;
                MODEL PROF_GM_HA=POP|FUNG|FERT/DIST=NORMAL DDFM=KR2;
                RANDOM INT/ SUBJECT=REP GROUP=ENV;
                LSMEANS POP*FUNG/ILINK PDIFF;
                %mult(trt=FUNG, by=POP, alpha=0.05);
            run;
        /* Fert*Pop*Fung */
            PROC GLIMMIX DATA=SOY PLOTS=STUDENTPANEL NOBOUND;
                ODS OUTPUT LSMEANS=LSMEANS DIFFS=DIFFS;
                CLASS ENV REP POP FUNG FERT;
                MODEL PROF_GM_HA=POP|FUNG|FERT/DIST=NORMAL DDFM=KR2;
                RANDOM INT/ SUBJECT=REP GROUP=ENV;
                LSMEANS FERT*POP*FUNG/ILINK PDIFF;
                %mult(trt=FUNG, by=POP, by2=FERT, alpha=0.05);
            run;