from PosSelect_Functions import *
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

v, yvalls = read_missense(path = "./", maf_cut = 0.1)
yvalls = unfold_missense(yvalls)

out = []
df = pd.DataFrame()
d_all = {0.10:6836, 0.20:3614, 0.30:2434, 0.40:1736, 0.50:1494, 0.60:1243, 0.70:1001, 0.80:1081}
for iteration in range(10000):
    np.random.seed(iteration)
    alpha = asymptotic_unfold(v, yvalls, seed = iteration, to_down = d_all, start = 0.1, dn_cut = 0.05, to_plot = False, to_plot_curve = False)
    alpha[1]["Iteration"] = np.repeat(iteration, alpha[1].shape[0])
    out.append([iteration, alpha[0]])
    print(alpha[0])
    df = pd.concat([df, alpha[1]])
df.to_csv("Missense_Results/Missense_AllSites_Bins_PhyloP447.txt", sep = "\t", index = False)
df = pd.DataFrame(out)
df.columns = ["Iteration", "Alpha"]
df.to_csv("Missense_Results/Missense_AllSites_Alphas_PhyloP447.txt", sep = "\t", index = False)

#Read in the list of VIPs
vip = pd.read_csv("GeneSets/VIP.csv")

v_vip = v[v["Gene"].isin(vip["HGNC symbol"])]
yvalls_vip = yvalls[yvalls["Gene"].isin(vip["HGNC symbol"])]
v_nvip = v[~v["Gene"].isin(vip["HGNC symbol"])]
yvalls_nvip = yvalls[~yvalls["Gene"].isin(vip["HGNC symbol"])]

#sample_v = v_vip.shape[0]
#sample_yvalls = yvalls_vip.shape[0]
d_vip = {0.10:261, 0.20:118, 0.30:94, 0.40:84, 0.50:42, 0.60:36, 0.70:51, 0.80:40}
out = []
df = pd.DataFrame()
for iteration in range(10000):
    np.random.seed(iteration)
    alpha = asymptotic_unfold(v_nvip, yvalls_nvip, start = 0.1, dn_cut = 0.05, to_plot = False, to_plot_curve = False, to_down = d_vip, seed = iteration)
    alpha[1]["Iteration"] = np.repeat(iteration, alpha[1].shape[0])
    out.append([iteration, alpha[0]])
    df = pd.concat([df, alpha[1]])
df.to_csv("Missense_Results/Missense_NonVIP_NumVarVIP_Bins_PhyloP447.txt", sep = "\t", index = False)
df = pd.DataFrame(out)
df.columns = ["Iteration", "Alpha"]
df.to_csv("Missense_Results/Missense_NonVIP_NumVarVIP_Alphas_PhyloP447.txt", sep = "\t", index = False)

vx = pd.read_csv("ProteinLevel/ProtVar_HC_Dedup.sort.prot.bed", sep = "\t", header = None).set_index(3)
v["PositionPlus"] = v.index
v.index = v["Position"]
vu = v.join(vx).dropna()
v.index = v["PositionPlus"]
vu.index = vu["Position"]

vvx = pd.read_csv("ProteinLevel/ProtVar_Poly_Dedup.sort.prot.bed", sep = "\t", header = None).set_index(3)
yvalls["PositionPlus"] = yvalls.index
yvalls.index = yvalls["Position"]
yvallsu = yvalls.join(vvx).dropna()
yvalls.index = yvalls["PositionPlus"]
yvallsu.index = yvallsu["Position"]

v = v.drop_duplicates("Position")
yvalls = yvalls.drop_duplicates("Position")

vu = vu.drop_duplicates("Position")
yvallsu = yvallsu.drop_duplicates("Position")

pse = pd.read_csv("ProteinLevel/20230315_Supplementary_AlphaFold_pPSE.csv")
pse.index = pse["protein_id"].astype(str) + ":" + pse["position"].astype(str)
vu.index = vu[0].astype(str) + ":" + vu[1].astype(int).astype(str)
yvallsu.index = yvallsu[0].astype(str) + ":" + yvallsu[1].astype(int).astype(str)
vu_pse = vu.join(pse).dropna()
yvallsu_pse = yvallsu.join(pse).dropna()


yvallsu_pse_high = yvallsu_pse[yvallsu_pse["pPSE"] >= 5]
yvallsu_pse_low = yvallsu_pse[yvallsu_pse["pPSE"] < 5]

vu_pse_high = vu_pse[vu_pse["pPSE"] >= 5]
vu_pse_low = vu_pse[vu_pse["pPSE"] < 5]

#sample_v = vu_pse_high.shape[0]
#sample_yvalls = yvallsu_pse_high.shape[0]
out = []

d_pse_high = {0.10:796, 0.20:381, 0.30:267, 0.40:175, 0.50:167, 0.60:114, 0.70:112, 0.80:105}

df = pd.DataFrame()
for iteration in range(10000):
    np.random.seed(iteration)
    alpha = asymptotic_unfold(vu_pse_low, yvallsu_pse_low, start = 0.1, dn_cut = 0.05, to_plot = False, to_plot_curve = False, seed = iteration, to_down = d_pse_high)
    alpha[1]["Iteration"] = np.repeat(iteration, alpha[1].shape[0])
    out.append([iteration, alpha[0]])
    df = pd.concat([df, alpha[1]])
df.to_csv("Missense_Results/Missense_PSELow_NumVarPSEHigh_Bins_PhyloP447.txt", sep = "\t", index = False)
df = pd.DataFrame(out)
df.columns = ["Iteration", "Alpha"]
df.to_csv("Missense_Results/Missense_PSELow_NumVarPSEHigh_Alphas_PhyloP447.txt", sep = "\t", index = False)

v, yvalls = read_missense(path = "./", maf_cut = 0.25)
yvalls = unfold_missense(yvalls)
yvalls.index = yvalls["Gene"]

#List of immune receptors
comp = ["CR1", "CR2", "CR3", "CR4", "C3AR1", "C5AR1", "C5AR2"]
siglec = []
tlr = []
nlr = []
kr = []
fc = []
x = []
mucin = []
#Could also add or "MS4" in i
for i in np.unique(list(v["Gene"]) + list(yvalls["Gene"])):
    if i != "NODAL" and i != "DYNLRB1" and "KIRREL" not in i:
        if "SIGLEC" in i or i == "CD33" or i == "CD169" or i == "CD22" or i == "MAG":
            siglec.append(i)
        if "TLR" in i:
            tlr.append(i)
        if "NOD" in i or "NLR" in i:
            nlr.append(i)
        if "KIR" in i or "KLR" in i:
            kr.append(i)
        if "FC" == i[0:2]:
            fc.append(i)
        if "MUC" == i[0:3]:
            mucin.append(i)
x = fc + comp + siglec + tlr + nlr + kr

vk = v[v["Gene"].isin(siglec)]
vvk = yvalls[yvalls["Gene"].isin(siglec)]
vvv = prepare_alpha(vk, vvk)
#vvv["PhyloP"] = vvv["PhyloP"]
#alpha_pos = compute_alpha_new(vvv, plot = False)[0]

#vvv["PhyloP"] = -vvv["PhyloP"]
#alpha_neg = compute_alpha_new(vvv, plot = False)[0]

#print(alpha_pos, alpha_neg)

vvv["PhyloP"] = np.abs(vvv["PhyloP"])
alpha_abs = compute_alpha_new(vvv, plot = False)[0]

out = []
#out.append(["Siglec", alpha_pos, alpha_neg, np.mean([alpha_pos, alpha_neg])])
out.append(["Siglec", alpha_abs])
sample_v = vk.shape[0]
sample_yvalls = vvk.shape[0]

for iteration in range(10000):
    np.random.seed(iteration)
    vk = v[~v["Gene"].isin(siglec)].sample(n = sample_v, replace = True)
    vvk = yvalls[~yvalls["Gene"].isin(siglec)].sample(n = sample_yvalls, replace = True)
    #vvv = prepare_alpha(vk, vvk)
    #alpha_pos = compute_alpha_new(vvv, plot = False)[0]
    #vvv["PhyloP"] = -vvv["PhyloP"]
    #alpha_neg = compute_alpha_new(vvv, plot = False)[0]
    #out.append([iteration, alpha_pos, alpha_neg, np.mean([alpha_pos, alpha_neg])])
    vvv = prepare_alpha(vk, vvk)
    vvv["PhyloP"] = np.abs(vvv["PhyloP"])
    alpha_abs = compute_alpha_new(vvv, plot = False)[0]
    out.append([iteration, alpha_abs])

df = pd.DataFrame(out)
#df.columns = ["IterationOrReal", "Alpha positive PhyloP", "Alpha negative PhyloP", "Mean alpha"]
df.columns = ["IterationOrReal", "Alpha absolute PhyloP"]
df.to_csv("Missense_Results/Missense_NonSiglec_NumVarSiglec_Alphas_PhyloP447.txt", sep = "\t", index = False)
