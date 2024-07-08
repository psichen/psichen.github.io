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
2022_cage["cryoEM of flexible cage"]

click 2018_cryoEM_JCB href "./seipin#cryoem_jcb" _self
click 2018_anionic href "./seipin#anionic" _self
click 2022_cage href "./seipin#cage" _self

subgraph 2018
        2018_cryoEM_JCB
        2018_anionic
end

subgraph 2022
        2022_cage
end

2018 --> 2022
```

### 2018_cryoEM_JCB ###

Sui, Xuewu, et al. "Cryo–electron microscopy structure of the lipid droplet–formation protein seipin." Journal of Cell Biology 217.12 (2018): 4080-4091.

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
<b>interaction to PA is strengthended under increasing pH (6.5 - 8.0)</b>")

%% RELATIONS====================
theme --- |human seipin in digionin| cryoEM
cryoEM --- |6-point mutation \n NS-EM for oligomerization \n lipid droplets in living cells| mutants
mutants --- |lipid strips| lipid
```

### 2022_cage ###

Arlt, Henning, et al. "Seipin forms a flexible cage at lipid droplet formation sites." Nature structural & molecular biology 29.3 (2022): 194-202.

```mermaid
flowchart TB

%% OBJECTs====================
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
