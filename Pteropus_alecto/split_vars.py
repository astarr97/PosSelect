o = open("AllMouse.vcf_90_recalibrated_snps_raw_indels_reheader_PopSorted.PASS.txt")
out1 = open("Fixed_All.bed", 'w')
out2 = open("Fixed_Mmd.bed", 'w')
out3 = open("Fixed_Mmc.bed", 'w')
out4 = open("Fixed_Mmm.bed", 'w')
#out5 = open("Fixed_Mmd_Mmc.bed", 'w')
#out6 = open("Fixed_Mmm_Mmc.bed", 'w')
#out7 = open("Fixed_Mmd_Mmm.bed", 'w')
out8 = open("Poly_Spret.bed", 'w')

out9 = open("Poly_Mmm.bed", 'w')
out10 = open("Poly_Mmc.bed", 'w')
out11 = open("Poly_Mmd.bed", 'w')
ind = 0

def get_tot(l):
    spret_tot = 0
    mmd_tot = 0
    mmm_tot = 0
    mmc_tot = 0
    for i in l[-1].split(";"):
        if i.split(",")[-1]:
            spret_tot += int(i.split(",")[-1])
    for i in l[-2].split(";"):
        if i.split(",")[-1]:
            mmc_tot += int(i.split(",")[-1])
    for i in l[-3].split(";"):
        if i.split(",")[-1]:
            mmm_tot += int(i.split(",")[-1])
    for i in l[-4].split(";"):
        if i.split(",")[-1]:
            mmd_tot += int(i.split(",")[-1])
    return spret_tot, mmd_tot, mmm_tot, mmc_tot
    
def maf_cut(x, cutoff = 0.1):
    ll = []
    for i in x.split(";"):
        ll.append([i.split(",")[0], float(i.split(",")[1])])
    ll.sort(key = lambda x: x[-1])
    if ll[-2][1] > cutoff:
        return ll[-2][0], ll[-2][1], ll[-1][0]
    else:
        return False, False, False
        
#Old det_derived code (bad)
#alleles = [x.split(",")[0] for x in l[pos].split(";")]
#anc_cand = None
#for i in range(len(alleles)):
#    if alleles[i] == spret_allele:
#        anc_cand = alleles[i]

#pass1 = 0
#pass2 = 0
#if anc_cand is not None:
#    if len(l[-2].split(";")) == 1:
#        allele_new = l[-2].split(",")[0]
#        if allele_new == anc_cand:
#            pass1 = 1
#        else:
#            pass1 = 0
#    else:
#        pass1 = 2
#    if len(l[-4].split(";")) == 1:
#        allele_new = l[-4].split(",")[0]
#        if allele_new == anc_cand:
#            pass2 = 1
#        else:
#            pass2 = 0
#    else:
#        pass2 = 2
#    if (pass1 == 1 or pass2 == 1) and pass1 and pass2:
#        return anc_cand
#    elif pass1 == 2 and pass2 == 2:
#        return "P"
#    else:
#        return "Amb"

def det_derived(l, pos, spret_allele):
    if pos == -2:
        if len(l[-3].split(";")) == 1 and len(l[-4].split(";")) == 1:
            if l[-3].split(";")[0].split(",")[0] == spret_allele and l[-4].split(";")[0].split(",")[0] == spret_allele:
                return spret_allele
            else:
                return "Amb"
        if len(l[-3].split(";")) == 1:
            if l[-3].split(";")[0].split(",")[0] == spret_allele:
                return spret_allele
            else:
                return "Amb"
        elif len(l[-4].split(";")) == 1:
            if l[-4].split(";")[0].split(",")[0] == spret_allele:
                return spret_allele
            else:
                return "Amb"
        else:
            return "TP"
    elif pos == -3:
        if len(l[-2].split(";")) == 1 and len(l[-4].split(";")) == 1:
            if l[-2].split(";")[0].split(",")[0] == l[-4].split(";")[0].split(",")[0]:
                return l[-2].split(";")[0].split(",")[0]
            else:
                return "Amb"
        elif len(l[-2].split(";")) == 1:
            if l[-2].split(";")[0].split(",")[0] == spret_allele:
                return spret_allele
            else:
                return "Amb"
        elif len(l[-4].split(";")) == 1:
            if l[-4].split(";")[0].split(",")[0] == spret_allele:
                return spret_allele
            else:
                return "Amb"
        else:
            return "TP"
    elif pos == -4:
        if len(l[-2].split(";")) == 1 and len(l[-3].split(";")) == 1:
            if l[-2].split(";")[0].split(",")[0] == l[-3].split(";")[0].split(",")[0]:
                return l[-2].split(";")[0].split(",")[0]
            else:
                return "Amb"
        elif len(l[-2].split(";")) == 1:
            if l[-2].split(";")[0].split(",")[0] == spret_allele:
                return spret_allele
            else:
                return "Amb"
        elif len(l[-3].split(";")) == 1:
            if l[-3].split(";")[0].split(",")[0] == spret_allele:
                return spret_allele
            else:
                return "Amb"
        else:
            return "TP"

#N implies that the other species is polymorphic
#A site can only be in Fixed_All.bed if it is all the same base in the three mus subspecies
def det_fixed_class(l):
    if len(l[-1].split(";")) == 1:
        spret_allele = l[-1].split(",")[0]
        
        fixed_mmc = False
        mmc_allele = "N"
        if len(l[-2].split(";")) == 1:
            mmc_allele = l[-2].split(",")[0]
            if spret_allele != mmc_allele:
                fixed_mmc = True
        else:
            if maf_cut(l[-2]):
                mmc_allele = l[-2]
        
        fixed_mmm = False
        mmm_allele = "N"
        if len(l[-3].split(";")) == 1:
            mmm_allele = l[-3].split(",")[0]
            if spret_allele != mmm_allele:
                fixed_mmm = True
        else:
            if maf_cut(l[-3]):
                mmm_allele = l[-3]
        
        fixed_mmd = False
        mmd_allele = "N"
        if len(l[-4].split(";")) == 1:
            mmd_allele = l[-4].split(",")[0]
            if spret_allele != mmd_allele:
                fixed_mmd = True
        else:
            if maf_cut(l[-4]):
                mmd_allele = l[-4]
        
        ### ALTER TO OUTPUT MMD, MMC, MMM FIXED AS IF RATHER THAN ELIF ###
        if fixed_mmd and fixed_mmm and fixed_mmc and (mmd_allele == mmc_allele) and (mmm_allele == mmd_allele) and (mmm_allele == mmc_allele):
            out1.write("\t".join([l[0], l[1], l[2], mmd_allele, mmm_allele, mmc_allele, spret_allele]) + "\n")
        if fixed_mmd:
            out2.write("\t".join([l[0], l[1], l[2], mmd_allele, mmm_allele, mmc_allele, spret_allele]) + "\n")
        if fixed_mmm:
            out4.write("\t".join([l[0], l[1], l[2], mmd_allele, mmm_allele, mmc_allele, spret_allele]) + "\n")
        if fixed_mmc:
            out3.write("\t".join([l[0], l[1], l[2], mmd_allele, mmm_allele, mmc_allele, spret_allele]) + "\n")
        #elif fixed_mmd and fixed_mmm:
        #    out7.write("\t".join([l[0], l[1], l[2], mmd_allele, mmm_allele, mmc_allele, spret_allele]) + "\n")
        #elif fixed_mmd and fixed_mmc:
        #    out5.write("\t".join([l[0], l[1], l[2], mmd_allele, mmm_allele, mmc_allele, spret_allele]) + "\n")
        #elif fixed_mmm and fixed_mmc:
        #    out6.write("\t".join([l[0], l[1], l[2], mmd_allele, mmm_allele, mmc_allele, spret_allele]) + "\n")
        #elif fixed_mmm:
        #    out4.write("\t".join([l[0], l[1], l[2], mmd_allele, mmm_allele, mmc_allele, spret_allele]) + "\n")
        #elif fixed_mmc:
        #    out3.write("\t".join([l[0], l[1], l[2], mmd_allele, mmm_allele, mmc_allele, spret_allele]) + "\n")
        #elif fixed_mmd:
        #    out2.write("\t".join([l[0], l[1], l[2], mmd_allele, mmm_allele, mmc_allele, spret_allele]) + "\n")
    else:
        out8.write(line)

def det_poly_class(l):        
    if len(l[-1].split(";")) == 1:
        spret_allele = l[-1].split(",")[0]
        
        poly_mmc = False
        mmc_allele = "N"
        if len(l[-2].split(";")) > 1:
            ma, maf, maj = maf_cut(l[-2])
            if maf:
                der = det_derived(l, -2, spret_allele)
                out10.write("\t".join([l[0], l[1], l[2], l[-2], l[-3], l[-4], spret_allele, ma, str(maf), maj, der]) + "\n")
        
        if len(l[-3].split(";")) > 1:
            ma, maf, maj = maf_cut(l[-3])
            if maf:
                der = det_derived(l, -3, spret_allele)
                out9.write("\t".join([l[0], l[1], l[2], l[-2], l[-3], l[-4], spret_allele, ma, str(maf), maj, der]) + "\n")
        
        if len(l[-4].split(";")) > 1:
            ma, maf, maj = maf_cut(l[-4])
            if maf:
                der = det_derived(l, -4, spret_allele)
                out11.write("\t".join([l[0], l[1], l[2], l[-2], l[-3], l[-4], spret_allele, ma, str(maf), maj, der]) + "\n")

for line in o:
    if ind:
        l = line.replace("\n", "").split("\t")
        #Count number of alleles
        spret_tot, mmd_tot, mmm_tot, mmc_tot = get_tot(l)
        
        if min([spret_tot, mmd_tot, mmm_tot, mmc_tot]) >= 8:
            det_fixed_class(l)
            det_poly_class(l)
        
    ind = 1
o.close()
out1.close()
out2.close()
out3.close()
out4.close()
#out5.close()
#out6.close()
#out7.close()
out8.close()
out9.close()
out10.close()
out11.close()
