import seaborn as sns
import matplotlib.pyplot as plt
from scipy.stats import gaussian_kde
import pandas as pd
import numpy as np
import copy
import seaborn as sns
from scipy.stats import mannwhitneyu as mwu
from scipy.stats import ttest_ind
from scipy.stats import ttest_rel
from statsmodels.stats.multitest import fdrcorrection
from scipy.stats import wilcoxon
from scipy.optimize import curve_fit
from scipy.stats import fisher_exact

hfont = {'fontname':'Arial'}
plt.rcParams["font.family"] = "Arial"

#Code borrowed heavily from here: https://stackoverflow.com/questions/62375034/find-non-overlapping-area-between-two-kde-plots
plt.rcParams.update(
    {"text.usetex": False}
)

#Function to prepare to compute alpha
def prepare_alpha(fixed, poly, stat = "PhyloP447"):
    x = np.repeat("Fixed", len(list(fixed.index)))
    y = np.repeat("Polymorphic", len(list(poly.index)))
    z = np.repeat(".", len(list(fixed.index)))
    poly["FixedOrPoly"] = y
    fixed["FixedOrPoly"] = x
    fixed["MAFMaxAcrossAncestry"] = z
    if "UnfoldedMAF" in poly.columns:
        fixed["UnfoldedMAF"] = z
        v2 = fixed[["FixedOrPoly", stat, "MAFMaxAcrossAncestry", "UnfoldedMAF"]].copy()
        vv2 = poly[["FixedOrPoly", stat, "MAFMaxAcrossAncestry", "UnfoldedMAF"]].copy()
    else:
        v2 = fixed[["FixedOrPoly", stat, "MAFMaxAcrossAncestry"]].copy()
        vv2 = poly[["FixedOrPoly", stat, "MAFMaxAcrossAncestry"]].copy()
    x2 = v2[stat]
    yvals2 = vv2[stat]
    vvv = pd.concat([v2, vv2])
    vvv["PhyloP"] = vvv[stat].astype(float)
    return vvv
    
#Code to compute alpha with a fixed cutoff
def compute_alpha_cutoff(vvv, cutoff=None, dn_cut = 0.05, weighted = False, plot = False, stat = "PhyloP", window = [-5, 12], title = ""):        
    if cutoff:
        pass
    else:
        x1 = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][stat].astype(float)
        cutoff = np.median(x1)
    
    dn1 = vvv[(vvv[stat] > cutoff) & (vvv["FixedOrPoly"] == "Fixed")].shape[0]
    pn1 = vvv[(vvv[stat] > cutoff) & (vvv["FixedOrPoly"] == "Polymorphic")].shape[0]
    ds1 = vvv[(vvv[stat] <= cutoff) & (vvv["FixedOrPoly"] == "Fixed")].shape[0]
    ps1 = vvv[(vvv[stat] <= cutoff) & (vvv["FixedOrPoly"] == "Polymorphic")].shape[0]
    if dn1 > 0 and ps1 > 0:
        alpha1 = 1 - (ds1/dn1)*(pn1/ps1)
    else:
        alpha1 = 1 - ((ds1+1)/(dn1+1))*((pn1+1)/(ps1+1))
    dn2 = vvv[(vvv[stat] >= cutoff) & (vvv["FixedOrPoly"] == "Fixed")].shape[0]
    pn2 = vvv[(vvv[stat] >= cutoff) & (vvv["FixedOrPoly"] == "Polymorphic")].shape[0]
    ds2 = vvv[(vvv[stat] < cutoff) & (vvv["FixedOrPoly"] == "Fixed")].shape[0]
    ps2 = vvv[(vvv[stat] < cutoff) & (vvv["FixedOrPoly"] == "Polymorphic")].shape[0]
    if dn2 > 0 and ps2 > 0:
        alpha2 = 1 - (ds2/dn2)*(pn2/ps2)
    else:
        alpha2 = 1 - ((ds2+1)/(dn2+1))*((pn2+1)/(ps2+1))
        
    alpha = (alpha1 + alpha2)/2
    
    #Plot the kdes if desired
    if plot:
        x0 = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][stat].astype(float)
        x1 = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][stat].astype(float)
    
        #Smooth the distributions
        kde0 = gaussian_kde(x0, bw_method=0.3)
        kde1 = gaussian_kde(x1, bw_method=0.3)
        xmin = min(x0.min(), x1.min())
        xmax = max(x0.max(), x1.max())
        dx = 0.2 * (xmax - xmin) # add a 20% margin, as the kde is wider than the data
        xmin -= dx
        xmax += dx
    
        x = np.linspace(xmin, xmax, 500)
        kde0_x = kde0(x)
        kde1_x = kde1(x)

        fig, ax = plt.subplots(figsize=(10,6))
        ax.plot(x, kde0_x, color='b', label='Fixed')
        ax.fill_between(x, kde0_x, 0, color='b', alpha=0.2)
        ax.plot(x, kde1_x, color='orange', label='Polymorphic')
        ax.fill_between(x, kde1_x, 0, color='orange', alpha=0.2)
        handles, labels = plt.gca().get_legend_handles_labels()
        ax.legend(handles, labels, title='', frameon=False, fontsize = 12)
        #plt.xlabel("PhyloP", **hfont, fontsize = 18)
        ax.set_ylabel("Density", **hfont, fontsize = 18)
        ax.set_xlim(window[0], window[1])
        plt.tight_layout()
        if title:
            ax.set_title(title)
        #plt.show()

    #Returns alpha, the cutoff, both tables using > or >= respectively, and the figure if needed
    if plot:
        return alpha, cutoff, [[dn1, ds1], [pn1, ps1]], [[dn2, ds2], [pn2, ps2]], fig
    else:
        return alpha, cutoff, [[dn1, ds1], [pn1, ps1]], [[dn2, ds2], [pn2, ps2]]


#Code to compute alpha
def compute_alpha_new(vvv, dn_cut = 0.05, weighted = False, plot = False, sub = False, stat = "PhyloP", window = [-5, 12], title = ""):
    x0 = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][stat].astype(float)
    x1 = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][stat].astype(float)
    
    #Smooth the distributions
    kde0 = gaussian_kde(x0, bw_method=0.3)
    kde1 = gaussian_kde(x1, bw_method=0.3)
    
    #Get the range to compute on
    xmin = min(x0.min(), x1.min())
    xmax = max(x0.max(), x1.max())
    dx = 0.2 * (xmax - xmin) # add a 20% margin, as the kde is wider than the data
    xmin -= dx
    xmax += dx
    
    x = np.linspace(xmin, xmax, 500)
    kde0_x = kde0(x)
    kde1_x = kde1(x)
    
    #Subtract the two distributions to find intersection points
    to_find_inter = kde0_x - kde1_x
    prev = ""
    crosses = []
    cross_signs = []
    #If search start is 0, you get erroneous results for some pathological distributions
    #e.g., NonCoding, NRXN3 SpecSup250, MAF0.25, PhastCons > 0 
    #If search start is the median of the polymorphic distribution, then it is less stable
    search_start = np.median(x1)
    #search_start = 0
    #To find the starting point to compute alpha from, we look for the first point where the polymorphic and fixed distributions cross that is greater than search_start
    for i in range(len(x)):
        if x[i] > search_start:
            if type(prev) == str:
                prev = to_find_inter[i]
            else:
                if prev*to_find_inter[i] <= 0:
                    crosses.append(i)
                    if to_find_inter[i] > 0:
                        cross_signs.append(1)
                    else:
                        cross_signs.append(0)
                prev = to_find_inter[i]
    crosses.append(499)
    alpha = 0
    
    start_compute = 0
    for i in range(len(crosses)):
        if i + 1 != len(crosses):
            if cross_signs[i]:
                start_compute = crosses[i]
                break
    #If we successfully found a place to start computing, do so
    if start_compute:
        
        #Commented out as this used the kde area, we now only use the kde to find the crossing point cutoff
        #dn = np.trapz(kde0_x[start_compute:500], x[start_compute:500])
        #ds = np.trapz(kde0_x[0:start_compute], x[0:start_compute])
        #pn = np.trapz(kde1_x[start_compute:500], x[start_compute:500])
        #ps = np.trapz(kde1_x[0:start_compute], x[0:start_compute])
        
        dn = vvv[(vvv[stat] > x[start_compute]) & (vvv["FixedOrPoly"] == "Fixed")].shape[0]
        pn = vvv[(vvv[stat] > x[start_compute]) & (vvv["FixedOrPoly"] == "Polymorphic")].shape[0]
        ds = vvv[(vvv[stat] <= x[start_compute]) & (vvv["FixedOrPoly"] == "Fixed")].shape[0]
        ps = vvv[(vvv[stat] <= x[start_compute]) & (vvv["FixedOrPoly"] == "Polymorphic")].shape[0]
        
        #Want to make sure a sufficient amount of the data is in dn for estimates to be stable
        #If this is changed, you accept less stable estimates leading to bad things when e.g. determining a confidence interval
        #However, when doing fisher's exact test I think it makes sense to change this to 0.01
        if dn != 0 and dn/(dn + ds) > dn_cut:
            if ps != 0:
                alpha = 1 - (ds/dn)*(pn/ps)
            else:
                alpha = 1 - ((ds+1)/(dn+1))*((pn+1)/(ps+1))
        #If this is not the case, find the point nearest to search_start
        else:
            for i in range(len(x)):
                if x[i] <= search_start and x[i+1] >= search_start:
                    #print(i)
                    start_compute = i
            #dn = np.trapz(kde0_x[start_compute:500], x[start_compute:500])
            #ds = np.trapz(kde0_x[0:start_compute], x[0:start_compute])
            #pn = np.trapz(kde1_x[start_compute:500], x[start_compute:500])
            #ps = np.trapz(kde1_x[0:start_compute], x[0:start_compute])
            
            dn = vvv[(vvv[stat] > x[start_compute]) & (vvv["FixedOrPoly"] == "Fixed")].shape[0]
            pn = vvv[(vvv[stat] > x[start_compute]) & (vvv["FixedOrPoly"] == "Polymorphic")].shape[0]
            ds = vvv[(vvv[stat] <= x[start_compute]) & (vvv["FixedOrPoly"] == "Fixed")].shape[0]
            ps = vvv[(vvv[stat] <= x[start_compute]) & (vvv["FixedOrPoly"] == "Polymorphic")].shape[0]
            if dn != 0 and ds != 0:
                alpha = 1 - (ds/dn)*(pn/ps)
            else:
                alpha = 1 - ((ds+1)/(dn+1))*((pn+1)/(ps+1))
    #Similarly, if we failed to find a place to start computing default to point nearest to search_start
    else:
        for i in range(len(x)):
            if x[i] <= search_start and x[i+1] >= search_start:
                #print(i)
                start_compute = i

        #dn = np.trapz(kde0_x[start_compute:500], x[start_compute:500])
        #ds = np.trapz(kde0_x[0:start_compute], x[0:start_compute])
        #pn = np.trapz(kde1_x[start_compute:500], x[start_compute:500])
        #ps = np.trapz(kde1_x[0:start_compute], x[0:start_compute])
        
        dn = vvv[(vvv[stat] > x[start_compute]) & (vvv["FixedOrPoly"] == "Fixed")].shape[0]
        pn = vvv[(vvv[stat] > x[start_compute]) & (vvv["FixedOrPoly"] == "Polymorphic")].shape[0]
        ds = vvv[(vvv[stat] <= x[start_compute]) & (vvv["FixedOrPoly"] == "Fixed")].shape[0]
        ps = vvv[(vvv[stat] <= x[start_compute]) & (vvv["FixedOrPoly"] == "Polymorphic")].shape[0]
        if dn != 0 and ds != 0:
            alpha = 1 - (ds/dn)*(pn/ps)
        else:
            alpha = 1 - ((ds+1)/(dn+1))*((pn+1)/(ps+1))
    
    #Plot the kdes if desired
    if plot:
        fig, ax = plt.subplots(figsize=(10,6))
        ax.plot(x, kde0_x, color='b', label='Fixed')
        ax.fill_between(x, kde0_x, 0, color='b', alpha=0.2)
        ax.plot(x, kde1_x, color='orange', label='Polymorphic')
        ax.fill_between(x, kde1_x, 0, color='orange', alpha=0.2)
        handles, labels = plt.gca().get_legend_handles_labels()
        ax.legend(handles, labels, title='', frameon=False, fontsize = 12)
        #plt.xlabel("PhyloP", **hfont, fontsize = 18)
        ax.set_ylabel("Density", **hfont, fontsize = 18)
        ax.set_xlim(window[0], window[1])
        plt.tight_layout()
        if title:
            ax.set_title(title)
        #plt.show()
    tag = "dc > 0.1, likely stable"
    
    #Returns alpha, the starting point for computing, all the crossing points, whether the estimate is likely to be stable, the table, and the figure if needed
    if dn == 0 or dn/(dn + ds) < 0.1:
        tag = "dc < 0.1, may be unstable"
    if plot:
        return alpha, x[start_compute], [x[i] for i in crosses], tag, [[dn, ds], [pn, ps]], fig
    else:
        return alpha, x[start_compute], [x[i] for i in crosses], tag, [[dn, ds], [pn, ps]]
#Code to do the asymptotic version of the test
def asymptotic_unfold(v, yvalls, statistic = "PhyloP447", to_down = None, seed = None, dn_cut = 0.05, start = 0.1, to_plot = False, verbose = False, to_plot_curve = True):
    if to_down is not None:
        np.random.seed(seed)
    out = []
    cur = 0.1
    step = 0.1
    #Iterate through the minor allele frequency bins
    while cur < 0.9 - 0.01:
        v2 = v.copy()
        yvalls2 = yvalls[(yvalls["UnfoldedMAF"].astype(float) <= cur + step) & (yvalls["UnfoldedMAF"].astype(float) > cur)].copy()
        #If we want to downsample in each bin, do so
        if to_down is not None:
            yvalls2 = yvalls2.sample(n = to_down[np.round(cur, 2)], replace = True)
        
        #Compute alpha
        vvv = prepare_alpha(v2, yvalls2, stat = statistic)
        alpha = compute_alpha_new(vvv, dn_cut = dn_cut, plot=to_plot)
        plt.show()
        if verbose:
            print(cur, vvv[vvv["MAFMaxAcrossAncestry"] != "."].shape[0])
            print(alpha)
        cur += step
        out.append([cur, alpha[0], alpha[1], alpha[2], alpha[3], alpha[4], vvv[vvv["MAFMaxAcrossAncestry"] != "."].shape[0]])
    cur += step
    
    df = pd.DataFrame(out)
    
    #Define a logarithmic function to fit to the data
    def func(x, a, c, d):
        return a + d*np.log(x + c)
    
    #Fit said function
    popt, pcov = curve_fit(func, xdata=df[0], ydata=df[1], maxfev = 100000)
    if to_plot_curve:
        sns.scatterplot(x=df[0], y=df[1])
        xx = np.linspace(0.1, 1, 100)
        yy = func(xx, *popt)
        plt.plot(xx, yy)
    df.columns = ["AF bin", "Alpha", "Cutoff", "Crosses", "Tag", "[[dc, du], [pc, pu]]", "Num Poly in Bin"]
    #Return the asymptotic estimate as well as the alpha values that led to it
    return func(1, popt[0], popt[1], popt[2]), df

#Reading non-coding data from the lighter version
def read_noncoding_data_fast(path = "./", maf_cut = 0.25, spec_sup = 250, phylop_cut = -100, pc = -1, dist = 500000000):
    
    v = pd.read_csv(path + "HumChp_NC_Final_NoHLA_ReadFast.txt", sep = "\t")
    vv = pd.read_csv(path + "HumPoly_NC_Final_NoHLA_ReadFast.txt", sep = "\t")
    vv = vv.drop_duplicates("Position")
    v = v[~v["Position"].isin(list(vv["Position"]))]
    print(v.shape[0], vv.shape[0])
    lcr_v = pd.read_csv("Pseudos_Repeats/HumChp_NC_Final_Rmdup_CREs_NoHLA_LCR.bed", sep = "\t", header = None)
    lcr_v["Position"] = lcr_v[0] + ":" + lcr_v[2].astype(str)
    
    lcr_vv = pd.read_csv("Pseudos_Repeats/HumPoly_NC_Final_CREs_NoHLA_LCR.bed", sep = "\t", header = None)
    lcr_vv["Position"] = lcr_vv[0] + ":" + lcr_vv[2].astype(str)
    
    v = v[~v["Position"].isin(lcr_v["Position"])]
    vv = vv[~vv["Position"].isin(lcr_vv["Position"])]
    print(v.shape[0], vv.shape[0])
    lcr_v = pd.read_csv("Pseudos_Repeats/HumChp_NC_Final_Rmdup_CREs_NoHLA_HomoPolymers.bed", sep = "\t", header = None)
    lcr_v["Position"] = lcr_v[0] + ":" + lcr_v[2].astype(str)
    
    lcr_vv = pd.read_csv("Pseudos_Repeats/HumPoly_NC_Final_CREs_NoHLA_HomoPolymers.bed", sep = "\t", header = None)
    lcr_vv["Position"] = lcr_vv[0] + ":" + lcr_vv[2].astype(str)
    
    v = v[~v["Position"].isin(lcr_v["Position"])]
    vv = vv[~vv["Position"].isin(lcr_vv["Position"])]
    print(v.shape[0], vv.shape[0])
    te_blacklist = pd.read_csv("Pseudos_Repeats/BlacklistTE_Variants.txt", sep = "\t")
    
    v = v[~v["Position"].isin(te_blacklist["Position"])]
    vv = vv[~vv["Position"].isin(te_blacklist["Position"])]
    print(v.shape[0], vv.shape[0])
    #Only keep if we have the essential columns for this analysis
    v = v.dropna(subset = ["SpecSup447", "PhyloP447", "Position", "NearestGene", "NearestDist"])
    vv = vv.dropna(subset = ["SpecSup447", "PhyloP447", "Position", "NearestGene", "NearestDist"])

    v["PhyloP447"] = v["PhyloP447"].astype(float)
    vv["PhyloP447"] = vv["PhyloP447"].astype(float)
    v["SpecSup447"] = v["SpecSup447"].astype(int)
    vv["SpecSup447"] = vv["SpecSup447"].astype(int)
    v["PhastCons447"] = v["PhastCons447"].astype(float)
    vv["PhastCons447"] = vv["PhastCons447"].astype(float)

    v = v[v['PhastCons447'].astype(float) > pc]
    vv = vv[vv['PhastCons447'].astype(float) > pc]

    print(v.shape)

    v = v[v['SpecSup447'].astype(int) > spec_sup]
    vv = vv[vv['SpecSup447'].astype(int) > spec_sup]

    print(v.shape)

    v = v[v['PhyloP447'].astype(float) >= phylop_cut]
    vv = vv[vv['PhyloP447'].astype(float) >= phylop_cut]

    v = v[v['NearestDist'].astype(float) <= dist]
    vv = vv[vv['NearestDist'].astype(float) <= dist]

    print(v.shape)

    yvalls = vv[vv["MAFMaxAcrossAncestry"] >= maf_cut]
    yvalls = yvalls[yvalls["MAFMaxAcrossAncestry"] <= 1-maf_cut]

    v.index = v["NearestGene"]
    yvalls.index = yvalls["NearestGene"]

    v = v.drop_duplicates("Position")
    yvalls = yvalls.drop_duplicates("Position")
        
    return v, yvalls


#Reading non-coding data
def read_noncoding_data(path = "./", maf_cut = 0.25, spec_sup = 250, phylop_cut = -100, pc = -1, dist = 500000000):
    
    v = pd.read_csv(path + "HumChp_NC_Final_Rmdup_CREs_NoHLA.bed", sep = "\t")
    v = v.drop(["InPromoter", "NextNearest", "NextNearestDist", "MskHBCGOPhyloP"], axis = 1)
    vv = pd.read_csv(path + "HumPoly_NC_Final_CREs_NoHLA.bed", sep = "\t")
    vv = vv.drop(["InPromoter", "NextNearest", "NextNearestDist", "MskHBCGOPhyloP"], axis = 1)
    vv = vv.drop_duplicates("Position")
    v = v[~v["Position"].isin(list(vv["Position"]))]

    #Add the 447-way information
    v.index = v["Position"]
    vv.index = vv["Position"]
    
    lcr_v = pd.read_csv("Pseudos_Repeats/HumChp_NC_Final_Rmdup_CREs_NoHLA_LCR.bed", sep = "\t", header = None)
    lcr_v["Position"] = lcr_v[0] + ":" + lcr_v[2].astype(str)
    
    lcr_vv = pd.read_csv("Pseudos_Repeats/HumPoly_NC_Final_CREs_NoHLA_LCR.bed", sep = "\t", header = None)
    lcr_vv["Position"] = lcr_vv[0] + ":" + lcr_vv[2].astype(str)
    
    v = v[~v["Position"].isin(lcr_v["Position"])]
    vv = vv[~vv["Position"].isin(lcr_vv["Position"])]
    
    lcr_v = pd.read_csv("Pseudos_Repeats/HumChp_NC_Final_Rmdup_CREs_NoHLA_HomoPolymers.bed", sep = "\t", header = None)
    lcr_v["Position"] = lcr_v[0] + ":" + lcr_v[2].astype(str)
    
    lcr_vv = pd.read_csv("Pseudos_Repeats/HumPoly_NC_Final_CREs_NoHLA_HomoPolymers.bed", sep = "\t", header = None)
    lcr_vv["Position"] = lcr_vv[0] + ":" + lcr_vv[2].astype(str)
    
    v = v[~v["Position"].isin(lcr_v["Position"])]
    vv = vv[~vv["Position"].isin(lcr_vv["Position"])]
    
    te_blacklist = pd.read_csv("Pseudos_Repeats/BlacklistTE_Variants.txt", sep = "\t")
    
    v = v[~v["Position"].isin(te_blacklist["Position"])]
    vv = vv[~vv["Position"].isin(te_blacklist["Position"])]
    print(v.shape[0], vv.shape[0])
    
    p447 = pd.read_csv(path + "447/HumChp_NC_Final_Rmdup_CREs_NoHLA_NewPhyloP447.txt", sep = "\t").set_index("Position")
    v = v.join(p447)
    v = v.drop_duplicates("Position")

    p447 = pd.read_csv(path + "447/HumPoly_NC_Final_CREs_NoHLA_NewPhyloP447.txt", sep = "\t").set_index("Position")
    vv = vv.join(p447)
    vv = vv.drop_duplicates("Position")

    print(v.shape)

    #Only keep if we have the essential columns for this analysis
    v = v.dropna(subset = ["SpecSup447", "PhyloP447", "Position", "NearestGene", "NearestDist"])
    vv = vv.dropna(subset = ["SpecSup447", "PhyloP447", "Position", "NearestGene", "NearestDist"])

    #v = v[v["SpecSup447New"] != "."]
    #vv = vv[vv["SpecSup447New"] != "."]

    v = v[v["SpecSup447"] != "."]
    vv = vv[vv["SpecSup447"] != "."]

    print(v.shape)

    v = v[v["PhyloP447"] != "."]
    vv = vv[vv["PhyloP447"] != "."]

    v["PhyloP447"] = v["PhyloP447"].astype(float)
    vv["PhyloP447"] = vv["PhyloP447"].astype(float)

    v = v[v["PhastCons447"] != "."]
    vv = vv[vv["PhastCons447"] != "."]

    v = v[v['PhastCons447'].astype(float) > pc]
    vv = vv[vv['PhastCons447'].astype(float) > pc]

    print(v.shape)

    #v = v[v['SpecSup447New'].astype(int) > spec_sup]
    #vv = vv[vv['SpecSup447New'].astype(int) > spec_sup]

    v = v[v['SpecSup447'].astype(int) > spec_sup]
    vv = vv[vv['SpecSup447'].astype(int) > spec_sup]


    print(v.shape)

    v = v[v['PhyloP447'].astype(float) >= phylop_cut]
    vv = vv[vv['PhyloP447'].astype(float) >= phylop_cut]

    v = v[v['NearestDist'].astype(float) <= dist]
    vv = vv[vv['NearestDist'].astype(float) <= dist]

    print(v.shape)

    #v = v[v["PhyloP447"] != 0]
    #vv = vv[vv["PhyloP447"] != 0]

    yvalls = vv[vv["MAFMaxAcrossAncestry"] >= maf_cut]
    yvalls = yvalls[yvalls["MAFMaxAcrossAncestry"] <= 1-maf_cut]

    v.index = v["NearestGene"]
    yvalls.index = yvalls["NearestGene"]


    v = v.drop_duplicates("Position")
    yvalls = yvalls.drop_duplicates("Position")
        
    return v, yvalls

#Function to remove sites in pseudogenes
def remove_pseudos(v, yvalls, path = "./"):        
    v_pseudos = pd.read_csv("Pseudos_Repeats/HumChp_NC_Final_Rmdup_CREs_NoHLA_Pseudos.bed", header = None, sep = "\t")
    vv_pseudos = pd.read_csv("Pseudos_Repeats/HumPoly_NC_Final_CREs_NoHLA_Pseudos.bed", header = None, sep = "\t")
    v_pseudos = list(v_pseudos[0] + ":" + v_pseudos[2].astype(str))
    vv_pseudos = list(vv_pseudos[0] + ":" + vv_pseudos[2].astype(str))

    vp2 = pd.read_csv("Pseudos_Repeats/HumChp_NC_Final_Rmdup_CREs_NoHLA_PseudosFromGTF.bed", header = None, sep = "\t")
    vvp2 = pd.read_csv("Pseudos_Repeats/HumPoly_NC_Final_CREs_NoHLA_PseudosFromGTF.bed", header = None, sep = "\t")
    v_pseudos = v_pseudos + list(vp2[0] + ":" + vp2[2].astype(str))
    vv_pseudos = vv_pseudos + list(vvp2[0] + ":" + vvp2[2].astype(str))

    vp2 = pd.read_csv("Pseudos_Repeats/HumChp_NC_Final_Rmdup_CREs_NoHLA_2WayPseudosFromGTF.bed", header = None, sep = "\t")
    vvp2 = pd.read_csv("Pseudos_Repeats/HumPoly_NC_Final_CREs_NoHLA_2WayPseudosFromGTF.bed", header = None, sep = "\t")
    v_pseudos = v_pseudos + list(vp2[0] + ":" + vp2[2].astype(str))
    vv_pseudos = vv_pseudos + list(vvp2[0] + ":" + vvp2[2].astype(str))

    v = v[~v["Position"].isin(v_pseudos)]
    yvalls = yvalls[~yvalls["Position"].isin(vv_pseudos)]
    return v, yvalls

#Function to remove sites in repetitive regions    
def remove_repeats(v, yvalls, path = "./"):
    v_repeat = pd.read_csv("Pseudos_Repeats/HumChp_NC_Final_CREs_NoHLA_rmsk.txt", sep = "\t", header = None)
    vv_repeat = pd.read_csv("Pseudos_Repeats/HumPoly_NC_Final_CREs_NoHLA_rmsk.txt", sep = "\t", header = None)
    v_repeat = list(v_repeat[v_repeat[1] != "."][0])
    vv_repeat = list(vv_repeat[vv_repeat[1] != "."][0])
    v = v[~v["Position"].isin(v_repeat)]
    yvalls = yvalls[~yvalls["Position"].isin(vv_repeat)]
    return v, yvalls

#Function to add the information needed to unfold MAF
def add_unfold(yvalls, path = "./"):
    #Unfolding the allele frequencies
    maf_base = pd.read_csv(path + "UnfoldPoly/HumPoly_NC_Final_CREs_NoHLA_LinkMAF_Base.txt", sep = "\t").drop_duplicates()
    maf_base.index = maf_base["Position"] + ":" + maf_base["MAFMaxAcrossAncestry"].astype(str)
    maf_base = maf_base.drop(["Position", "MAFMaxAcrossAncestry"], axis = 1)
    yvalls.index = yvalls["Position"] + ":" + yvalls["MAFMaxAcrossAncestry"].astype(str)

    #Again careful to only drop based on important columns
    yvalls = yvalls.join(maf_base).dropna(subset = ["SpecSup447", "PhyloP447", "Position", "NearestGene", "Human ref", "Human alt", "MAFMaxAcrossAncestry"])
    yvalls.index = yvalls["Position"] + "-" + yvalls["Human ref"] + "-" + yvalls["Human alt"]

    unfold = pd.read_csv(path + "UnfoldPoly/HumPoly_NC_Final_CREs_NoHLA_Unfold.txt", sep = "\t").drop_duplicates()
    unfold.index = unfold["Position"] + "-" + unfold["Human ref"] + "-" + unfold["Human alt"]
    unfold = unfold.drop(['Position', 'Human ref', 'Human alt'], axis = 1)
    yvalls = yvalls.join(unfold)

    yvalls = yvalls[((yvalls["Human ref"] == yvalls["Chimp ref"]) & (yvalls["Human ref"] == yvalls["Gorilla ref"])) | ((yvalls["Human alt"] == yvalls["Chimp ref"]) & (yvalls["Human alt"] == yvalls["Gorilla ref"]))]
    yvalls_ref = yvalls[yvalls["Human ref"] == yvalls["Chimp ref"]]
    yvalls_alt = yvalls[yvalls["Human alt"] == yvalls["Chimp ref"]]
    yvalls_alt["UnfoldedMAF"] = 1-yvalls_alt["MAFMaxAcrossAncestry"]
    yvalls_ref["UnfoldedMAF"] = yvalls_ref["MAFMaxAcrossAncestry"]
    yvalls = pd.concat([yvalls_ref, yvalls_alt])
    
    return yvalls

#Reading protein coding data
def read_missense(path = "./", maf_cut = 0.1, spec_sup = 0, pc = -1, phylop_cut = -100):
    v = pd.read_csv("HumChp_Mis_Final.bed", sep = "\t")
    vv = pd.read_csv("HumPoly_Mis_Final.bed", sep = "\t")
    vv = vv.drop_duplicates("Position")
    v = v[~v["Position"].isin(list(vv["Position"]))]

    #Add the 447-way information
    v.index = v["Position"]
    vv.index = vv["Position"]

    p447 = pd.read_csv("447/HumChp_Mis_Final_NewPhyloP447.txt", sep = "\t").set_index("Position")
    v = v.join(p447)
    v = v.drop_duplicates("Position")

    p447 = pd.read_csv("447/HumPoly_Mis_Final_NewPhyloP447.txt", sep = "\t").set_index("Position")
    vv = vv.join(p447)
    vv = vv.drop_duplicates("Position")
    print(v.shape)

    v = v[v["SpecSup447"] != "."]
    vv = vv[vv["SpecSup447"] != "."]

    print(v.shape)

    v = v[v["PhyloP447"] != "."]
    vv = vv[vv["PhyloP447"] != "."]

    v["PhyloP447"] = v["PhyloP447"].astype(float)
    vv["PhyloP447"] = vv["PhyloP447"].astype(float)


    print(v.shape)

    v = v[v['SpecSup447'].astype(int) > spec_sup]
    vv = vv[vv['SpecSup447'].astype(int) > spec_sup]

    print(v.shape)

    yvalls = vv[vv["MAFMaxAcrossAncestry"] >= maf_cut]
    yvalls = yvalls[yvalls["MAFMaxAcrossAncestry"] <= 1-maf_cut]

    #Only keep if we have the essential columns for this analysis
    v = v.dropna(subset = ["SpecSup447", "PhyloP447", "Position", "Gene"])
    yvalls = yvalls.dropna(subset = ["SpecSup447", "PhyloP447", "Position", "Gene"])

    v.index = v["Gene"]
    yvalls.index = yvalls["Gene"]

    #Remove HLA
    out = []
    for index, row in v.iterrows():
        if "HLA-" not in index:
            out.append(row)
    v = pd.DataFrame(out)

    out = []
    for index, row in yvalls.iterrows():
        if "HLA-" not in index:
            out.append(row)
    yvalls = pd.DataFrame(out)


    v = v.drop_duplicates("Position")
    yvalls = yvalls.drop_duplicates("Position")
    return v, yvalls

def unfold_missense(yvalls, path = "./"):
    #Unfolding the allele frequencies
    maf_base = pd.read_csv("UnfoldPoly/HumPoly_Mis_Final_LinkMAF_Base.txt", sep = "\t").drop_duplicates()
    maf_base.index = maf_base["Position"] + ":" + maf_base["MAFMaxAcrossAncestry"].astype(str)
    maf_base = maf_base.drop(["Position", "MAFMaxAcrossAncestry"], axis = 1)
    yvalls.index = yvalls["Position"] + ":" + yvalls["MAFMaxAcrossAncestry"].astype(str)

    #Again careful to only drop based on important columns
    yvalls = yvalls.join(maf_base).dropna(subset = ["SpecSup447", "PhyloP447", "Position", "Gene", "Human ref", "Human alt", "MAFMaxAcrossAncestry"])
    yvalls.index = yvalls["Position"] + "-" + yvalls["Human ref"] + "-" + yvalls["Human alt"]

    unfold = pd.read_csv("UnfoldPoly/HumPoly_Mis_Final_Unfold.txt", sep = "\t").drop_duplicates()
    unfold.index = unfold["Position"] + "-" + unfold["Human ref"] + "-" + unfold["Human alt"]
    unfold = unfold.drop(['Position', 'Human ref', 'Human alt'], axis = 1)
    yvalls = yvalls.join(unfold)

    yvalls = yvalls[((yvalls["Human ref"] == yvalls["Chimp ref"]) & (yvalls["Human ref"] == yvalls["Gorilla ref"])) | ((yvalls["Human alt"] == yvalls["Chimp ref"]) & (yvalls["Human alt"] == yvalls["Gorilla ref"]))]
    yvalls_ref = yvalls[yvalls["Human ref"] == yvalls["Chimp ref"]]
    yvalls_alt = yvalls[yvalls["Human alt"] == yvalls["Chimp ref"]]
    yvalls_alt["UnfoldedMAF"] = 1-yvalls_alt["MAFMaxAcrossAncestry"]
    yvalls_ref["UnfoldedMAF"] = yvalls_ref["MAFMaxAcrossAncestry"]
    yvalls = pd.concat([yvalls_ref, yvalls_alt])
    
    return yvalls

#Read data for UTR
def read_utr(path = "./", maf_cut = 0.1, spec_sup = 250, phylop_cut = -100, pc = -1):
    v = pd.read_csv("HumChp_UTR_Final.bed", sep = "\t")
    vv = pd.read_csv("HumPoly_UTR_Final.bed", sep = "\t")
    vv = vv.drop_duplicates("Position")
    v = v[~v["Position"].isin(list(vv["Position"]))]

    #Add the 447-way information
    v.index = v["Position"]
    vv.index = vv["Position"]

    p447 = pd.read_csv("447/HumChp_UTR_Final_NewPhyloP447.txt", sep = "\t").set_index("Position")
    v = v.join(p447)
    v = v.drop_duplicates("Position")

    p447 = pd.read_csv("447/HumPoly_UTR_Final_NewPhyloP447.txt", sep = "\t").set_index("Position")
    vv = vv.join(p447)
    vv = vv.drop_duplicates("Position")

    print(v.shape)

    #Only keep if we have the essential columns for this analysis
    v = v.dropna(subset = ["SpecSup447", "PhyloP447", "Position", "Gene"])
    vv = vv.dropna(subset = ["SpecSup447", "PhyloP447", "Position", "Gene"])

    v = v[v["SpecSup447"] != "."]
    vv = vv[vv["SpecSup447"] != "."]

    print(v.shape)

    v = v[v["PhyloP447"] != "."]
    vv = vv[vv["PhyloP447"] != "."]


    v = v[v["PhastCons447"] != "."]
    vv = vv[vv["PhastCons447"] != "."]

    v["PhyloP447"] = v["PhyloP447"].astype(float)
    vv["PhyloP447"] = vv["PhyloP447"].astype(float)

    v = v[v['PhyloP447'].astype(float) >= phylop_cut]
    vv = vv[vv['PhyloP447'].astype(float) >= phylop_cut]

    print(v.shape)

    v = v[v['PhastCons447'].astype(float) > pc]
    vv = vv[vv['PhastCons447'].astype(float) > pc]

    print(v.shape)

    v = v[v['SpecSup447'].astype(int) > spec_sup]
    vv = vv[vv['SpecSup447'].astype(int) > spec_sup]

    print(v.shape)

    yvalls = vv[vv["MAFMaxAcrossAncestry"] >= maf_cut]
    yvalls = yvalls[yvalls["MAFMaxAcrossAncestry"] <= 1-maf_cut]

    v.index = v["Gene"]
    yvalls.index = yvalls["Gene"]

    #Remove HLA
    out = []
    for index, row in v.iterrows():
        if "HLA-" not in index:
            out.append(row)
    v = pd.DataFrame(out)

    out = []
    for index, row in yvalls.iterrows():
        if "HLA-" not in index:
            out.append(row)
    yvalls = pd.DataFrame(out)


    v = v.drop_duplicates("Position")
    yvalls = yvalls.drop_duplicates("Position")
    return v, yvalls

def unfold_utr(yvalls, path = "./"):
    maf_base = pd.read_csv("UnfoldPoly/HumPoly_UTR_Final_LinkMAF_Base.txt", sep = "\t").drop_duplicates()
    maf_base.index = maf_base["Position"] + ":" + maf_base["MAFMaxAcrossAncestry"].astype(str)
    maf_base = maf_base.drop(["Position", "MAFMaxAcrossAncestry"], axis = 1)
    yvalls.index = yvalls["Position"] + ":" + yvalls["MAFMaxAcrossAncestry"].astype(str)

    #Again careful to only drop based on important columns
    yvalls = yvalls.join(maf_base).dropna(subset = ["SpecSup447", "PhyloP447", "Position", "Gene", "Human ref", "Human alt", "MAFMaxAcrossAncestry"])
    yvalls.index = yvalls["Position"] + "-" + yvalls["Human ref"] + "-" + yvalls["Human alt"]

    unfold = pd.read_csv("UnfoldPoly/HumPoly_UTR_Final_Unfold.txt", sep = "\t").drop_duplicates()
    unfold.index = unfold["Position"] + "-" + unfold["Human ref"] + "-" + unfold["Human alt"]
    unfold = unfold.drop(['Position', 'Human ref', 'Human alt'], axis = 1)
    yvalls = yvalls.join(unfold)

    yvalls = yvalls[((yvalls["Human ref"] == yvalls["Chimp ref"]) & (yvalls["Human ref"] == yvalls["Gorilla ref"])) | ((yvalls["Human alt"] == yvalls["Chimp ref"]) & (yvalls["Human alt"] == yvalls["Gorilla ref"]))]
    yvalls_ref = yvalls[yvalls["Human ref"] == yvalls["Chimp ref"]]
    yvalls_alt = yvalls[yvalls["Human alt"] == yvalls["Chimp ref"]]
    yvalls_alt["UnfoldedMAF"] = 1-yvalls_alt["MAFMaxAcrossAncestry"]
    yvalls_ref["UnfoldedMAF"] = yvalls_ref["MAFMaxAcrossAncestry"]
    yvalls = pd.concat([yvalls_ref, yvalls_alt])
    return yvalls

def fit_curve(df):
    def func(x, a, c, d):
            return a + d*np.log(x + c)

    popt, pcov = curve_fit(func, xdata=df["AF bin"], ydata=df["Alpha"], maxfev = 100000)
    xx = np.linspace(0.1, 1, 100)
    yy = func(xx, *popt)
    plt.plot(xx, yy)
    plt.scatter(df["AF bin"], df["Alpha"])
    return func(1, popt[0], popt[1], popt[2])