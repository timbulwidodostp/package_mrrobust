{smcl}
{* *! version 0.1.0  30aug2017 Tom Palmer}{...}
{vieweralsosee "mrrobust" "mrrobust"}{...}
{viewerjumpto "Syntax" "mrfunnel##syntax"}{...}
{viewerjumpto "Description" "mrfunnel##description"}{...}
{viewerjumpto "Options" "mrfunnel##options"}{...}
{viewerjumpto "Examples" "mrfunnel##examples"}{...}
{viewerjumpto "References" "mrfunnel##references"}{...}
{viewerjumpto "Author" "mrfunnel##author"}{...}
{title:Title}

{p 5}
{bf:mrfunnel} {hline 2} Funnel plot for two-sample MR analysis
{p_end}

{marker syntax}{...}
{title:Syntax}

{p 8 16 2}
{opt mrfunnel} {var:_gd} {var:_gdse} {var:_gp} {var:_gpse} {ifin} 
[{cmd:,} {it:options}]

{synoptset 20 tabbed}{...}
{synopthdr}
{synoptline}
{synopt :{opt extrap:lots(string)}}extra plots to add to the overall plot{p_end}
{synopt :{opt m:etric(metric)}}scale of {it:y}-axis{p_end}
{synopt :{opt noivw:}}do not plot IVW line{p_end}
{synopt :{opt nomregger:}}do not plot MR-Egger line{p_end}
{synopt :{opt mrivests:opts(opts)}}options passed to {help mrivests}{p_end}
{synopt :{opt scatteropts(opts)}}options passed to the {help scatter} command{p_end}
{synopt :{opt xlr:ange(# #)}}the range for the IVW and MR-Egger lines, see {help twoway_function} 
{cmd:range()} option{p_end}
{p2col:{cmd:*}}other {help twoway_options:options} passed to {help twoway}{p_end}

{marker description}{...}
{title:Description}

{pstd}
{cmd:mrfunnel} provides a funnel plot for a two-sample Mendelian randomization
 analysis. 

{pstd} 
There are 3 choices of measures of instrument strength to plot on 
the {it:y}-axis, which are specified using the {cmd:metric} option and are described below.
{p_end}
 
{pstd}
On the plot the MR-Egger estimate is the line with the longer dashes, 
the IVW estimate is shown with the shorter dashes.

{pstd}
{var:_gd} is a variable containing the genotype-disease (SNP-outcome) association estimates.

{pstd}
{var:_gdse} is a variable containing the genotype-disease (SNP-outcome) association estimate 
standard errors.

{pstd}
{var:_gp} is a variable containing the genotype-phenotype (SNP-exposure) association 
estimates.

{pstd}
{var:_gpse} is a variable containing the genotype-phenotype (SNP-exposure) association 
estimate standard errors.

{marker options}{...}
{title:Options}

{phang}
{opt m:etric(gpbeta|gpbetastd|invse)} specifies the metric for the 
{it:y}-axis. Can be one of:
{p_end}
{pstd}
 - {cmd:gpbeta}: the absolute value of the genotype-phenotype (SNP-exposure) estimates,
{p_end}
{pstd}
 - {cmd:gpbetastd}: gpbeta standardised by the genotype-disease (SNP-outcome) standard errors (the default),
{p_end}
{pstd}
 - {cmd:invse}: the inverse of the standard errors on the genotype specific IV ratio estimates.
{p_end}

{pstd}
Note that in Stata 18.0 the default legend position of a twoway plot was changed from the 6 o'clock position to the 3 o'clock position.
In Stata 18.0 and above {cmd:mrfunnel} resets the default back to 6 o'clock (which can be overridden with, for example, {cmd:legend(pos(12))}).

{marker examples}{...}
{title:Examples}

{pstd}Using the data provided by {help mrfunnel##do:Do et al. (2013)} recreate 
{help mrfunnel##bowden:Bowden et al. (2016)} Web Figure A2 
(top-right plot, LDL-C with 73 genotypes).{p_end}

{pstd}Setup{p_end}
{phang2}{cmd:.} {stata "use https://raw.github.com/remlapmot/mrrobust/master/dodata, clear"}{p_end}

{pstd}Select observations ({it:p}-value with exposure < 10^-8){p_end}
{phang2}{cmd:.} {stata "gen byte sel1 = (ldlcp2 < 1e-8)"}{p_end}

{pstd}Funnel plot{p_end}
{phang2}{cmd:.} {stata "mrfunnel chdbeta chdse ldlcbeta ldlcse if sel1==1"}{p_end}

{pstd}Without adding the IVW and MR-Egger estimates{p_end}
{phang2}{cmd:.} {stata "mrfunnel chdbeta chdse ldlcbeta ldlcse if sel1==1, noivw nomregger"}{p_end}

{pstd}Using an unstandardised {it:y}-axis{p_end}
{phang2}{cmd:.} {stata "mrfunnel chdbeta chdse ldlcbeta ldlcse if sel1==1, metric(gpbeta)"}{p_end}

{pstd}Using inverse IV SEs on the {it:y}-axis{p_end}
{phang2}{cmd:.} {stata "mrfunnel chdbeta chdse ldlcbeta ldlcse if sel1==1, metric(invse)"}{p_end}

{pstd}Remove the legend{p_end}
{phang2}{cmd:.} {stata "mrfunnel chdbeta chdse ldlcbeta ldlcse if sel1==1, legend(off)"}{p_end}

{pstd}Extend the IVW and MR-Egger lines to the y-axis limits (as per the original version of this 
command){p_end}
{phang2}{cmd:.} {stata "mrfunnel chdbeta chdse ldlcbeta ldlcse if sel1==1, xlrange(0 10)"}{p_end}

{marker references}{...}
{title:References}

{marker do}{...}
{phang}
Do et al., 2013. Common variants associated with plasma triglycerides and risk
 for coronary artery disease. Nature Genetics. 45, 1345-1352. 
{browse "https://dx.doi.org/10.1038/ng.2795":DOI}
{p_end}

{marker bowden}{...}
{phang}
Bowden J, Davey Smith G, Haycock PC, Burgess S. Consistent estimation in 
Mendelian randomization with some invalid instruments using a weighted median 
estimator. Genetic Epidemiology, 2016, 40, 4, 304-314. 
{browse "https://dx.doi.org/10.1002/gepi.21965":DOI}
{p_end}

{marker author}{...}
{title:Author}

INCLUDE help mrrobust-author
