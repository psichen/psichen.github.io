## Seipin ##

uniport: Q640F1

MW: 37 kD (seipin) + 8 kD (LDAF1) + n(?) x 1 kD (FLAG-tag) \
Seipin + LDAF1 = 45 kD (subunit)

PI: 5.77

spcies: Xenopus laevis (African clawed frog) in [homologous comparison](./seipin#cryoem_jcb).

Evolutinoarily conserved: ER-lumenal domain; flanking transmembrane (TM) segments, switch region (within TM segments)

Less conserved: cytoplasmic N- and C-terminal regions; lengths vary among species
([homologous comparison](./seipin#cage))

diameter: 14 nm (from HS-AFM)\
top area: 154 nm<sup>2</sup>

POPC head area: 0.7 nm<sup>2</sup> \
MW: 760

number of lipids to fill Seipin chamber:

154/0.7\*2 = 440 (mol/mol, lipid:Seipin 11mer) \
154/0.7\*2/11 = 40 (mol/mol, lipid:Seipin subunit)

LPR = 40 * 0.76 / 45 = **0.68** (w/w, lipid:Seipin-LDAF1 subunit), \
weight concentration (mg/mL) is independent on oligomeric states.

## Potential to do ##

- [ ] triglycerides or cholesterol added to reconstitute Seipin
- [ ] glycosylation / glycerolipids?
- [x] **(lower LPR)** reconstitution (POPC/DOPE/DOPS for ER membrane proteins) / high affinity for PA\
        (Seipin may need a higher LPR because of its empty hydrophobic chamber)
- [x] [Alphafold Multimer](https://cosmic-cryoem.org/tools/alphafoldmultimer/) of seipin (X. laevis)
- [ ] ~~algorithm to remove double-tip artifacts~~
- [ ] ~~crosslinking (mica - APTES - NES-PEG & SMCC - reconstituted Seipin)~~\
        (detergent micelles on cytosolic side?)

## Timeline ##

```mermaid
flowchart TB

2016_nascent_mature["LDs from nascent to mature"]
2018_cryoEM_JCB["cryoEM of seipin"]
2018_anionic["cryoEM of seipin binding anionic lipids"]
2019_triglyceride["triglyceride flow and droplet ripening"]
2020_curvature["membrane curvature catalyzes LD assembly"]
2021_Sei1["yeast Sei1/Ldb16 Seipin complex"]
2021_accumulation_MD["MD of accumulation of DAG and TAG"]
2022_cage["cryoEM of flexible cage"]
2022_LDER_contact["metabolic and immune-sensitive LD-ER contacts in vitro"]

click 2016_nascent_mature href "./seipin#nascent_mature" _self
click 2018_cryoEM_JCB href "./seipin#cryoem_jcb" _self
click 2018_anionic href "./seipin#anionic" _self
click 2019_triglyceride href "./seipin#triglyceride" _self
click 2020_curvature href "./seipin#curvature" _self
click 2021_Sei1 href "./seipin#sei1" _self
click 2021_accumulation_MD "./seipin#accumulation_md" _self
click 2022_cage href "./seipin#cage" _self
click 2022_LDER_contact href "./seipin#lder_contact" _self

subgraph 2016
        2016_nascent_mature
end

subgraph 2018
        2018_cryoEM_JCB
        2018_anionic
end

subgraph 2019
        2019_triglyceride
end

subgraph 2020
        2020_curvature
end

subgraph 2021
        2021_Sei1
        2021_accumulation_MD
end

subgraph 2022
        2022_cage
        2022_LDER_contact
end

2016 --> 2018 --> 2019 --> 2020 --> 2021 --> 2022
```

### 2016_nascent_mature ###

Wang, Huajin, et al. "Seipin is required for converting nascent to mature lipid droplets." elife 5 (2016): e16582.

```mermaid
flowchart TB

%% OBJECTS====================
theme("seipin is required for LD maturation")

deficiency("Seipin deficiency leads to LD altered morphology
without evidence for altered lipid metabolism (including cellular PA levels)")

LiveDrop("small LiveDrop puncta are more mobile in Seipin KD
LiveDrop localization to LDs depends on TG synthesis")

conserved("Seipin conserved regions (TM and luminal domains) are required for functions")

LD-ER("nascent LDs were close proximity to but separated from the ER
filamentous structures between LDs and ER in Seipin KO cells
LD-ER contact sites space lacks ribosomes")

seipin("Seipin are highly mobile along the ER before LD formation
Seipin co-localized with LiveDrop puncta shortly and became less mobile
majority of LDs are associated with Seipin")

GPAT4("nascent, abnormal LDs recruit GPAT4 targeting to LDs at early time
initiating TG synthesis and LD expansion")

phospholipids("Giant LDs of Seipin-deficient cells are deficient in phospholipids")

%% RELATIONS====================
theme --- |fly and human cells <br/> RNAi,CRISPR/Cas9 to knock down <br/> live-cell imaging <br/> 14C labelling lipidomics| deficiency
deficiency --- |LiveDrop - more sensitive to TG <br/> small, abnormal LDs: LiveDrop+ & BODIPY- <br/> TG synthesis inhibitors| LiveDrop
LiveDrop --- |cells from BSCL2 mutation patients <br/> Seipin truncations to rescue LD phenotype in Seipin KD cells <br/> expression of human Seipin prevents Seipin depletion phenotypes| conserved
conserved --- |ET| LD-ER
LD-ER --- |GFP-Seipin & LiveDrop <br/> live-cell imaging| seipin
seipin --- |GPAT4 co-licalizes with LDs <br/> knock down TG synthesis enzymes| GPAT4
GPAT4 --- |"14C-oleic acid <br/> gradient centrifugation to get LD lipids <br/> CCT(PC synthesis enzyme) are recruited to LDs <br/> add PC liposomes to rescue phenotypes <br/> inhibition of CCT aggravates phenotypes"| phospholipids
```

### 2018_cryoEM_JCB ###

Sui, Xuewu, et al. "Cryo–electron microscopy structure of the lipid droplet–formation protein seipin." Journal of Cell Biology 217.12 (2018): 4080-4091.

```mermaid
flowchart TB

%% OBJECTS====================
theme(fly seipin)

cryoEM("dodecamer
hydrophobic helices (HH) of luminal domain towards ER membrane
two &beta;-sheets containing four antiparallel &beta;-shrands")

intersubunit("inter-subunit: &pi;-cation between Y230 and R170
hydrogenbond between Y230 and Y171 backbone
Y171A: smaller oligomers")

conserved("disulfide bond
interface conserved")

HH("HHs of Seipin luminal domain bind monolayer of LDs")

LDformation("LD-binding helices function in a complementary manner
mutants in luminal domain (Y171A) contribute to but are not required for oligomerization in vivo
double mutant in &beta;-sandwich (V220A/I222A) failed to rescue cell functions")

%% RELATIONS====================
theme --- |fly seipin in digitionin or DDM <br/> luminal domain resolved only| cryoEM
cryoEM --- |mutant & SEC| intersubunit
intersubunit --- |evolutionary covariation analysis| conserved
cryoEM --- |fluorescent seipin-HH peptides <br/> with artificial LDs or DEV| HH
HH --- |seipin-HH3D mutant rescued seipin KO phenotype <br/> Y171A rescued LD phenotype in vivo <br/> mutants in luminal domain V220/I222| LDformation
```

### 2018_anionic ###

Yan, Renhong, et al. "Human SEIPIN binds anionic phospholipids." Developmental cell 47.2 (2018): 248-256.

```mermaid
flowchart TB

%% OBJECTS====================
theme(human seipin binds anionic phospholipids)

cryoEM("undecamer with overall diameter 22 nm
<b>lumenal diameter 16 nm (consistent with HSAFM)</b>
lower surface of the core ring is hydrophobic indicating the the region is anchored to membrane")

mutants("oligomerization state is critical for seipin function")

lipid("seipin binds anionic 16:0/18:1 PA 'POPA' and PI3P
<b>interaction to PA is strengthended under increasing pH (6.5 - 8.0)</b>
<b>seipin C2-like core domain binds POPC/PA liposomes but does not bind POPC liposomes</b>")

%% RELATIONS====================
theme --- |human seipin in digionin| cryoEM
cryoEM --- |6-point mutation <br/> NS-EM for oligomerization <br/> lipid droplets in living cells| mutants
mutants --- |lipid strips <br/> liposome-binding| lipid
```

### 2019_triglyceride ###

Salo, Veijo T., et al. "Seipin facilitates triglyceride flow to lipid droplet and counteracts droplet ripening via endoplasmic reticulum contact." Developmental cell 50.4 (2019): 478-493.

```mermaid
flowchart TB

%% OBJECTS====================
theme(triglyceride flow to LD and counteract droplet ripening)

formation("LDs forming after ~60s")

mobility("Seipin mobility decreased
prior to LD formation markers")

LDs("nascent 30~100 nm LDs connecting to ER membrane")

nearest("LD nucleation is non-stochastic")

relocation("LD fraction at NE increases, which is reversible by siRNAs
NE-LDs  showed similar persistence, reduced mobility
and higher minimal distrance than random")

neck("necks between (NE) membranes and LDs have a diameter of ~16 nm
similar uniform ER-LD neck was not apparent, possibily due to conformational flexibility")

depletion("numerous tiny and some supersized LDs
Seipin maintains normal LDs
Rab18 facilitates tiny LDs formatoin in Seipin-deficient cells")

transfer("more heterogeneous LD size
neutral lipids transfer from smaller LDs to larger LDs")

DEV("LDs ripen without Seipin
Seipin prevents ripening-induced LD shrinkage")

fusion("Seipin facilitates tryglyceride deposition and enhances LD growth")

%% RELATIONS====================
theme --- |"live-cell imaging <br/> Oleic acid (OA) to trigger LD formation"| formation
formation --- |mobility analysis| mobility
mobility --- |"correlative light EM (CLEM)"| LDs
formation --- |minimal distance between forming LDs <br/> is higher thant random simulation| nearest
nearest --- |"GFP-nanobody system trapping Seipin at nuclear envelope (NE)"| relocation
relocation --- |fixed architecture of NE <br/> compared to ER enables ET| neck
LDs --- neck
neck --- |acute depletion by auxin-inducible degron| depletion
depletion --- |OA loaded before Seipin removal <br/> lipogenesis & lipolysis analysis <br/> FRAP| transfer
transfer --- |"<b>isolated LD with Seipin from cells</b> <br/> mix with droplet-embeded vesicles (DEV)"| DEV
DEV --- |heterologous cell fusion of seipin-degron cells and seipin cells| fusion
```

*Seipin may facilitate the growth of LDs, with suggested functions in regulating the enzyme machinery of de novo lipogenesis or phosphatidic acid metabolism.*

### 2020_curvature ###

```mermaid
flowchart TB

%% OBJECTS====================
theme(membrane curvature catalyzes LD asembly)

enrich("nascent LDs enriched at tubules
Seipin prefers to tubules
<b>Seipin moves along sheet edges</b>")

hypotonic("Seipin is enriched on smaller vesicles")

degron("LDs nucleates at ER tubules in abscence of Seipin
and NOT at large ER vesicles in prescence of Seipin")

diffuse("large ER vesicles make more neutral lipids
generated NLs diffuse in membrane
Onion-ring-like ER membrane (low curvature) full of NLs")

pullout("free TG is unfavorable in tubules
SE is favorable in tubules")

nucleation("membrane curvature promotes TG LD nucleation in vitro rather than SE-containing LDs
TG diffuses slower than SE, which may facilitate LD formation")

tubules("increase LDs")

sheets("reduce tiny LDs in abscence of Seipin
mildly reduce LDs in prescence of Seipin")

ratio("increasing sheets lowers LDs number
TG LDs are more efficiently asseembled than SE")

%% RELATIONS====================
theme --- |live-cell imaging <br/> ER sheet/tubules segmentation <br/> Rab18 KO to decrease tubules| enrich
enrich --- |hypotonic medium <br/> swollen ER| hypotonic
hypotonic --- |Seipin degron cells <br/> Bpy-C12 for nascent lipids <br/> LipidTox for neutral lipids| degron
degron --- |"Sec61&beta;-mCherry (ER membrane protein) as reference <br/> FRAP"| diffuse
diffuse --- |DEV system <br/> tubules pull out from GUVs| pullout
pullout --- |decrease tubules radius rapidly by surface tension <br/> FRAP on tubules| nucleation
nucleation --- |overexpress ER-tubule-generating proteins in Seipin degron cells| tubules
nucleation --- |increase ER sheets| sheets
sheets --- |ER tubule-to-sheet ratio| ratio
tubules --- |TG/SE ratio| ratio
```

many Seipin-collaborating proteins are membrane curvature sensors or inducers (PEX30/MCTP2, promethin, Ldo16/45, LDIP)

ER-LD marker peptide HPos?

### 2021_sei1 ###

Klug, Yoel A., et al. "Mechanism of lipid droplet formation by the yeast Sei1/Ldb16 Seipin complex." Nature communications 12.1 (2021): 5892.

```mermaid
flowchart TB

%% OBJECTS====================
theme(Sei1/Ldb16 yeast Seipin complex)

cryoEM("decameric
short helix flanking by two TM segments (&alpha;3, Locking Helix)")

TAG("TAG accumulates around TM segments")

luminal("luminal domain is split into two orthogonal small helices
enriched in charged residues, fail to concentrate TAg (POPC with 3% TAG)")

Ldb16("Ldb16 can be crosslinked at TM and luminal regions
Ldb16 complements Sei1 functions")

LH("LH domain deletion leads to increased TM movement <br/> LH controls the positioning and dynamcis of TM segments")

TM("interaction betwwen TAG and TM, likely amino acid composition but not dynamics, contributs to LD formation")

%% RELATIONS====================
theme --- |yeast seipin in DDM| cryoEM
cryoEM --- |coarse-grain MD| TAG
cryoEM --- |coarse-grain MD| luminal
luminal --- |UAA to crosslink Sei1 and Ldb16 <br/> lipid droplets in live cells <br/> Ldb16 contains many hydroxyl groups| Ldb16
Ldb16 --- |LH mutation or deletion <br/> expression level & lipid droplets in live cells <br/> MD & cryoEM of &Delta;LH| LH
LH --- |mutants in TM segments failed to restore cell functions <br/> &Delta;LH mutant could restore cell functions <br/> chimeric mutant with human TM could restore cell functions| TM
TAG --- TM
```

*Seipin rings not in contact with lenses are highly mobile in the ER*

### 2021_accumulation_MD ###

Zoni, Valeria, et al. "Seipin accumulates and traps diacylglycerols and triglycerides in its ring-like structure." Proceedings of the National Academy of Sciences 118.10 (2021): e2017205118.

```mermaid
flowchart TB

%% OBJECTS====================
theme(seipin accumulates DAG and TAG by MD simulation)

accumulate("seipin accumulates TAG of low concentration (2%)")

luminal("luminal (mostly through HH region L162-S166) acumulates TAG
seipin and TAG establish long-lived interactions")

TM("TM helices accumulate TAG first before luminal domains
TM-only system failed to retain TAG
polar residues in TM helices are critical in TAG accumulation")

DAG("accumulation of DAG does not alter TAG accumulation
TAG still localize S165&S166 of HH in luminal domain, DAG spreads around the HH region")

polar("S165/S166 in HH is required for LD formation")

%% RELATIONS====================
theme --- |human 11-mer seipin <br/> DOPC with TAG <br/> TAG molecule number in direct contact with seipin| accumulate
accumulate --- |TAG radial concentration along seipin <br/> simulation of luminal domain alone <br/> diffusion of TAG interacting with luminal domains <br/> dissociation of TAG bound to Seipin| luminal
luminal --- |time-resolved TAG radial concentration along seipin <br/> simulation of TM helices along <br/> diffusion of TAG interacting with TM helices <br/> mutation of TM helices| TM
TM --- |ER-like membrane: PC, PE, cholesterol, DAG <br/> 10% DAG or PA in DOPC| DAG
DAG --- |S165/S166 mutant in live-cell imaging| polar
```

*N_terminal domain is proposed in relation to PA homeostasis*

### 2022_cage ###

Arlt, Henning, et al. "Seipin forms a flexible cage at lipid droplet formation sites." Nature structural & molecular biology 29.3 (2022): 194-202.

```mermaid
flowchart TB

%% OBJECTS====================
theme(cryoEM of yeast seipin flexible cages)

cryoEM(decameric, cage-like <br/> conformation A, B <br/> switch regions)

TM("seipin TM segments are crucial for function <br/> <b>N-terminal TM segment showed more critical</b>")

lumenal(lumenal domain of yeast seipin likely does not insert into membrane <br/> unlike fly and human homologs <br/> lumenal domain alone is sufficient for oligomerization)

TM2(crucial for function <br/> conserved through evolution <br/> <b>C-terminal showed more critical</b>)

switch(switch region is required for oligomerization and function <br/> localization of seipin around ER-LD site changed dramatically )

%% RELATIONS====================
theme --- |seipin in digitonin and PmalC8 <br/> Rosetta prediction <br/> C10 symmetry expansion and then classification without symmetry| cryoEM
theme --- |TM segments replacement <br/> sequence shuffled <br/> lipid droplet in living cells <br/> growth phenotype under inhibitors| TM
cryoEM --- |mutant at central ring <br/> seipin lacking TM segments <br/> NS-EM| lumenal
TM --- |predicted interaction patches <br/> mutants <br/> lipid droplet in living cells| TM2
TM2 --- |mutant & sequence shuffled| switch
lumenal --- switch
```

### 2022_LDER_contact ###

Kamerkar, Sukrut, et al. "Metabolic and immune-sensitive contacts between lipid droplets and endoplasmic reticulum reconstituted in vitro." Proceedings of the National Academy of Sciences 119.24 (2022): e2200513119.

```mermaid
flowchart TB

%% OBJECTS====================
theme(metabolic and immune-sensitive LD-ER contacts)

reconstitution(in vitro reconstitution of LD-ER contacts)

fed(more LD-mSLB contacts in the fed-fed situation)

immunity(LDs-mSLB contacts are enhanced by immune activation)

PA_immune(enrichment of PA on LDs after immune activation)

insensitive(LD-mSLB contacts are insensitive to LD-bogenesis
but require protein factors on mSLB)

PA_feeding(Rab18 and PA promote LD-mSLB contacts after feeding)

two_processes(two different biological responses, feeding and immune activation, require Rab18 and PA to induce ER-LD contacts)

optical(stable LD-mSLB contacts: >20 pN)

trafficking(stable LD-mSLB contacts support protein and lipid trafficking)

PA_enhance(<b>PA enhances LD-SLB contact formation</b>)

%% RELATIONS====================
theme --- |"ER-enriched microsomal  vesicles from rat livers or cells (mSLB) <br/> LDs from livers <br/> LDs of diluted concentration to incubate, decreasing prewash LDs/unchanging postwash LDs"| reconstitution
reconstitution --- |fed/fasted LDs & fed/fasted mSLBs| fed
fed --- |activate immunity by LPS injection| immunity
immunity --- |"Spo20-p (high affinity for PA)"| PA_immune
fed --- |"LD-biogenesis inhibitors <br/> Proteinase-K on mSLBs"| insensitive
insensitive --- |"Rab18 Ab <br/> Spo20-p (high affinity for PA) <br/> reduce bound LDs numbers"| PA_feeding
PA_feeding --- two_processes
PA_immune --- two_processes
two_processes --- |optical trapping| optical
optical --- |RhPE -> periphery lipids <br/> mCherry-HPos -> LDs <br/> fluscent imaging & FRAP| trafficking
trafficking --- |PC&PC-PA LDs <br/> PC&PC-PA SLBs <br/> LD-SLB contact numbers| PA_enhance
```
