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

2018_cryoEM_JCB["cryoEM of seipin"]
2018_anionic["cryoEM of seipin binding anionic lipids"]
2021_Sei1["yeast Sei1/Ldb16 Seipin complex"]
2022_cage["cryoEM of flexible cage"]

click 2018_cryoEM_JCB href "./seipin#cryoem_jcb" _self
click 2018_anionic href "./seipin#anionic" _self
click 2021_Sei1 href "./seipin#sei1" _self
click 2022_cage href "./seipin#cage" _self

subgraph 2018
        2018_cryoEM_JCB
        2018_anionic
end

subgraph 2021
        2021_Sei1
end

subgraph 2022
        2022_cage
end

2018 --> 2021 --> 2022
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
