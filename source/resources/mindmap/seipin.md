## Seipin ##

uniport: Q640F1

spcies: Xenopus laevis (African clawed frog) in [homologous comparison](./seipin#cryoem_jcb).

Evolutinoarily conserved: ER-lumenal domain; flanking transmembrane (TM) segments, switch region (within TM segments)

Less conserved: cytoplasmic N- and C-terminal regions; lengths vary among species
([homologous comparison](./seipin#cage))

## Potential to do ##

1. [Alphafold Multimer](https://cosmic-cryoem.org/tools/alphafoldmultimer/) of seipin (X. laevis)
2. CNN to remove double-tip artifacts
3. glycosylation / glycerolipids?

## Timeline ##

```mermaid
flowchart TB

2016_nascent_mature["LDs from nascent to mature"]
2018_cryoEM_JCB["cryoEM of seipin"]
2018_anionic["cryoEM of seipin binding anionic lipids"]
2019_triglyceride["triglyceride flow and droplet ripening"]
2021_Sei1["yeast Sei1/Ldb16 Seipin complex"]
2021_accumulation_MD["MD of accumulation of DAG and TAG"]
2022_cage["cryoEM of flexible cage"]

click 2016_nascent_mature href "./seipin#nascent_mature" _self
click 2018_cryoEM_JCB href "./seipin#cryoem_jcb" _self
click 2018_anionic href "./seipin#anionic" _self
click 2019_triglyceride href "./seipin#triglyceride" _self
click 2021_Sei1 href "./seipin#sei1" _self
click 2021_accumulation_MD "./seipin#accumulation_md" _self
click 2022_cage href "./seipin#cage" _self

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

subgraph 2021
        2021_Sei1
        2021_accumulation_MD
end

subgraph 2022
        2022_cage
end

2016 --> 2018 --> 2019 --> 2021 --> 2022
```

### 2016_nascent_mature ###

Wang, Huajin, et al. "Seipin is required for converting nascent to mature lipid droplets." elife 5 (2016): e16582.

```mermaid
flowchart TB

%% OBJECTS====================
theme(seipin is required for LD maturation)

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
theme --- |fly and human cells \n RNAi,CRISPR/Cas9 to knock down \n live-cell imaging \n 14C labelling lipidomics| deficiency
deficiency --- |LiveDrop - more sensitive to TG \n small, abnormal LDs: LiveDrop+ & BODIPY- \n TG synthesis inhibitors| LiveDrop
LiveDrop --- |cells from BSCL2 mutation patients \n Seipin truncations to rescue LD phenotype in Seipin KD cells \n expression of human Seipin prevents Seipin depletion phenotypes| conserved
conserved --- |ET| LD-ER
LD-ER --- |GFP-Seipin & LiveDrop \n live-cell imaging| seipin
seipin --- |GPAT4 co-licalizes with LDs \n knock down TG synthesis enzymes| GPAT4
GPAT4 --- |"14C-oleic acid \n gradient centrifugation to get LD lipids \n CCT(PC synthesis enzyme) are recruited to LDs \n add PC liposomes to rescue phenotypes \n inhibition of CCT aggravates phenotypes"| phospholipids
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
theme --- |fly seipin in digitionin or DDM \n luminal domain resolved only| cryoEM
cryoEM --- |mutant & SEC| intersubunit
intersubunit --- |evolutionary covariation analysis| conserved
cryoEM --- |fluorescent seipin-HH peptides \n with artificial LDs or DEV| HH
HH --- |seipin-HH3D mutant rescued seipin KO phenotype \n Y171A rescued LD phenotype in vivo \n mutants in luminal domain V220/I222| LDformation
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
cryoEM --- |6-point mutation \n NS-EM for oligomerization \n lipid droplets in living cells| mutants
mutants --- |lipid strips \n liposome-binding| lipid
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
theme --- |"live-cell imaging \n Oleic acid (OA) to trigger LD formation"| formation
formation --- |mobility analysis| mobility
mobility --- |"correlative light EM (CLEM)"| LDs
formation --- |minimal distance between forming LDs \n is higher thant random simulation| nearest
nearest --- |"GFP-nanobody system trapping Seipin at nuclear envelope (NE)"| relocation
relocation --- |fixed architecture of NE \n compared to ER enables ET| neck
LDs --- neck
neck --- |acute depletion by auxin-inducible degron| depletion
depletion --- |OA loaded before Seipin removal \n lipogenesis & lipolysis analysis \n FRAP| transfer
transfer --- |"<b>isolated LD with Seipin from cells</b> \n mix with droplet-embeded vesicles (DEV)"| DEV
DEV --- |heterologous cell fusion of seipin-degron cells and seipin cells| fusion
```

*Seipin may facilitate the growth of LDs, with suggested functions in regulating the enzyme machinery of de novo lipogenesis or phosphatidic acid metabolism.*

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

LH("LH domain deletion leads to increased TM movement \n LH controls the positioning and dynamcis of TM segments")

TM("interaction betwwen TAG and TM, likely amino acid composition but not dynamics, contributs to LD formation")

%% RELATIONS====================
theme --- |yeast seipin in DDM| cryoEM
cryoEM --- |coarse-grain MD| TAG
cryoEM --- |coarse-grain MD| luminal
luminal --- |UAA to crosslink Sei1 and Ldb16 \n lipid droplets in live cells \n Ldb16 contains many hydroxyl groups| Ldb16
Ldb16 --- |LH mutation or deletion \n expression level & lipid droplets in live cells \n MD & cryoEM of &Delta;LH| LH
LH --- |mutants in TM segments failed to restore cell functions \n &Delta;LH mutant could restore cell functions \n chimeric mutant with human TM could restore cell functions| TM
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
theme --- |human 11-mer seipin \n DOPC with TAG \n TAG molecule number in direct contact with seipin| accumulate
accumulate --- |TAG radial concentration along seipin \n simulation of luminal domain alone /n diffusion of TAG interacting with luminal domains \n dissociation of TAG bound to Seipin| luminal
luminal --- |time-resolved TAG radial concentration along seipin \n simulation of TM helices along \n diffusion of TAG interacting with TM helices \n mutation of TM helices| TM
TM --- |ER-like membrane: PC, PE, cholesterol, DAG \n 10% DAG or PA in DOPC| DAG
DAG --- |S165/S166 mutant in live-cell imaging| polar
```

*N_terminal domain is proposed in relation to PA homeostasis*

### 2022_cage ###

Arlt, Henning, et al. "Seipin forms a flexible cage at lipid droplet formation sites." Nature structural & molecular biology 29.3 (2022): 194-202.

```mermaid
flowchart TB

%% OBJECTS====================
theme(cryoEM of yeast seipin flexible cages)

cryoEM(decameric, cage-like \n conformation A, B \n switch regions)

TM("seipin TM segments are crucial for function \n <b>N-terminal TM segment showed more critical</b>")

lumenal(lumenal domain of yeast seipin likely does not insert into membrane \n unlike fly and human homologs \n lumenal domain alone is sufficient for oligomerization)

TM2(crucial for function \n conserved through evolution \n <b>C-terminal showed more critical</b>)

switch(switch region is required for oligomerization and function \n localization of seipin around ER-LD site changed dramatically )

%% RELATIONS====================
theme --- |seipin in digitonin and PmalC8 \n Rosetta prediction \n C10 symmetry expansion and then classification without symmetry| cryoEM
theme --- |TM segments replacement \n sequence shuffled \n lipid droplet in living cells \n growth phenotype under inhibitors| TM
cryoEM --- |mutant at central ring \n seipin lacking TM segments \n NS-EM| lumenal
TM --- |predicted interaction patches \n mutants \n lipid droplet in living cells| TM2
TM2 --- |mutant & sequence shuffled| switch
lumenal --- switch
```
