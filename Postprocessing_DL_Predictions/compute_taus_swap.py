import numpy as np
import sys

to_do = int(sys.argv[1])

o = open("/scratch/users/astarr97/TempSortedDL/All_DL_Polymorphic_Normed_Temp" + str(to_do) + "_SwapNeur.ready.txt")

if to_do == 1:
    out = open("Taus_Polymorphic_Group1SwapNeur.txt", 'w')
    out.write("Position\tTau_Allele1\tTau_Allele2\tTau_abs_logfc\tTau_jsd\n")
    out2 = open("KosoyRoussosControlMicroglia_EEs_PolymorphicSwapNeur.txt", 'w')
    out2.write("Position\tEE_Allele1\tEE_Allele2\tdEE_logfc\tEE_jsd\tEE_abs_logfc\n")
    out3 = open("ITL23_EEs_PolymorphicSwapNeur.txt", 'w')
    out3.write("Position\tEE_Allele1\tEE_Allele2\tdEE_logfc\tEE_jsd\tEE_abs_logfc\n")
    out4 = open("AdultHeartVentricularCardiomyocyte_EEs_PolymorphicSwapNeur.txt", 'w')
    out4.write("Position\tEE_Allele1\tEE_Allele2\tdEE_logfc\tEE_jsd\tEE_abs_logfc\n")
    out5 = open("AdultProximalTubule_EEs_PolymorphicSwapNeur.txt", 'w')
    out5.write("Position\tEE_Allele1\tEE_Allele2\tdEE_logfc\tEE_jsd\tEE_abs_logfc\n")
    out6 = open("FetalArterialECs_EEs_PolymorphicSwapNeur.txt", 'w')
    out6.write("Position\tEE_Allele1\tEE_Allele2\tdEE_logfc\tEE_jsd\tEE_abs_logfc\n")
    out7 = open("FetalChondrocytes_EEs_PolymorphicSwapNeur.txt", 'w')
    out7.write("Position\tEE_Allele1\tEE_Allele2\tdEE_logfc\tEE_jsd\tEE_abs_logfc\n")
    out8 = open("SertoliMale_EEs_PolymorphicSwapNeur.txt", 'w')
    out8.write("Position\tEE_Allele1\tEE_Allele2\tdEE_logfc\tEE_jsd\tEE_abs_logfc\n")
    out9 = open("ASCT_EEs_PolymorphicSwapNeur.txt", 'w')
    out9.write("Position\tEE_Allele1\tEE_Allele2\tdEE_logfc\tEE_jsd\tEE_abs_logfc\n")
elif to_do == 2:
    out = open("Taus_Polymorphic_Group2SwapNeur.txt", 'w')
    out.write("Position\tTau_Allele1\tTau_Allele2\tTau_abs_logfc\tTau_jsd\n")
    out2 = open("FetalGonadImmuneFemale_EEs_PolymorphicSwapNeur.txt", 'w')
    out2.write("Position\tEE_Allele1\tEE_Allele2\tdEE_logfc\tEE_jsd\tEE_abs_logfc\n")
    out3 = open("LiangSteinNeuron_EEs_PolymorphicSwapNeur.txt", 'w')
    out3.write("Position\tEE_Allele1\tEE_Allele2\tdEE_logfc\tEE_jsd\tEE_abs_logfc\n")
    out4 = open("AdultHeartSmoothMuscle_EEs_PolymorphicSwapNeur.txt", 'w')
    out4.write("Position\tEE_Allele1\tEE_Allele2\tdEE_logfc\tEE_jsd\tEE_abs_logfc\n")
    out5 = open("AdultLoopOfHenle_EEs_PolymorphicSwapNeur.txt", 'w')
    out5.write("Position\tEE_Allele1\tEE_Allele2\tdEE_logfc\tEE_jsd\tEE_abs_logfc\n")
    out6 = open("FetalHeartPericytes_EEs_PolymorphicSwapNeur.txt", 'w')
    out6.write("Position\tEE_Allele1\tEE_Allele2\tdEE_logfc\tEE_jsd\tEE_abs_logfc\n")
    out7 = open("FetalHeartCardiacFibroblasts_EEs_PolymorphicSwapNeur.txt", 'w')
    out7.write("Position\tEE_Allele1\tEE_Allele2\tdEE_logfc\tEE_jsd\tEE_abs_logfc\n")
    out8 = open("preGC_IIaFemale_EEs_PolymorphicSwapNeur.txt", 'w')
    out8.write("Position\tEE_Allele1\tEE_Allele2\tdEE_logfc\tEE_jsd\tEE_abs_logfc\n")
    out9 = open("FetalBrainCOP_EEs_PolymorphicSwapNeur.txt", 'w')
    out9.write("Position\tEE_Allele1\tEE_Allele2\tdEE_logfc\tEE_jsd\tEE_abs_logfc\n")


def tau(x):
    max_x = max(x)
    n = len(x)
    return np.sum((1-x/max_x)/(n-1))
    
def ee(x):
    to_ret = []
    for i in x:
        to_ret.append(i/np.sum(x))
    return to_ret

def dee(x):
    to_ret = []
    for i in x:
        if i > 0:
            x2 = [abs(j) if j > 0 else 0 for j in x]
            to_ret.append(i/np.sum(x2))
        else:
            x2 = [abs(j) if j <= 0 else 0 for j in x]
            to_ret.append(abs(i)/np.sum(x2))
    return to_ret
    
c = 0
for line in o:
    l = line.replace("\n", "").split("\t")
    if not c:
        print(np.array([x for x in l[1::5]]))
        print(np.array([x for x in l[2::5]]))
        
        print(np.array([x for x in l[3::5]]))
        print(np.array([x for x in l[4::5]]))
        print(np.array([x for x in l[5::5]]))
    else:
        a1cs = np.array([float(x) for x in l[1::5]])
        a2cs = np.array([float(x) for x in l[2::5]])
        lfcs = np.array([float(x) for x in l[3::5]])
        jsds = np.array([abs(float(x)) for x in l[4::5]])
        abs_lfcs = np.array([abs(float(x)) for x in lfcs])
        out.write("\t".join([l[0]] + [str(x) for x in [tau(a1cs), tau(a2cs), tau(abs_lfcs), tau(jsds)]]) + "\n")
        #if tau(abs_lfcs) > 0.9 or tau(a1cs) < 0.1:
        #    print(jsds)
        #    print([str(x) for x in [tau(a1cs), tau(a2cs), tau(abs_lfcs), tau(jsds)]])
    
        #out.write("\t".join([l[0], str(tau(lfcs)), str(tau(jsds))]) + "\n")
        
        ee_a1cs = ee(a1cs)

        ee_a2cs = ee(a2cs)
        ee_lfcs = dee(lfcs)
        ee_jsds = ee(jsds)
        ee_abs_lfcs = ee(abs_lfcs)
        #if max(ee_lfcs) > 0.7:
        #    print(ee_lfcs)
        #    print(lfcs)
        if np.min(ee_lfcs) < 0:
            print(ee_lfcs)
        to_write = list(zip(ee_a1cs, ee_a2cs, ee_lfcs, ee_jsds, ee_abs_lfcs))
        for i in range(len(to_write)):
            if i == 0:
                out2.write("\t".join([l[0]] + [str(j) for j in list(to_write[i])]) + "\n")
            elif i == 1:
                out3.write("\t".join([l[0]] + [str(j) for j in list(to_write[i])]) + "\n")
            elif i == 2:
                out4.write("\t".join([l[0]] + [str(j) for j in list(to_write[i])]) + "\n")
            elif i == 3:
                out5.write("\t".join([l[0]] + [str(j) for j in list(to_write[i])]) + "\n")
            elif i == 4:
                out6.write("\t".join([l[0]] + [str(j) for j in list(to_write[i])]) + "\n")
            elif i == 5:
                out7.write("\t".join([l[0]] + [str(j) for j in list(to_write[i])]) + "\n")
            elif i == 6:
                out8.write("\t".join([l[0]] + [str(j) for j in list(to_write[i])]) + "\n")
            elif i == 7:
                out9.write("\t".join([l[0]] + [str(j) for j in list(to_write[i])]) + "\n")
            
    c += 1
    if c % 100000 == 0:
        print(c)
o.close()
out.close()
out2.close()
out3.close()
out4.close()
out5.close()
out6.close()
out7.close()
out8.close()
out9.close()
