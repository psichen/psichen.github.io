## DAG

```mermaid
flowchart TB

NompC --> |2013_YNJ_Nature| gentle_touch_sensation
NompC --> |2017_YFC_Nature| helical_spring_like_tetramer
```

## Lectures

### 2013_YNJ_Nature

```mermaid
flowchart TB

function(gentle-touch sensation)
sufficiency(NompC is sufficient for gentle-touch sensation)
selectivity(non-selectivity cation channels)
necessity(NompC is necessary for gentle-touch sensation)
mutagenesis("E1511K (acidic -> basic) considerably reduced channel activity")

function --- |null mutant| necessity --- |site-directed mutagenesis| mutagenesis
function --- |ectopic/heterologous expression| sufficiency --- |reversal potential measurement| selectivity
```

### 2015_YNJ_Cell

### 2017_YFC_Nature

```mermaid
flowchart TB
structure(helical spring-like tetramer)
permeation(ion permeation pathway)
tether(lipid-protein interactions)
gating(conserved channel gating site)
transiduction(mechanotransiduction via tether model)
motion(motion of AR domain)

structure --- |E1511| permeation
structure --- |H1423| tether --- transiduction
structure --- |W1572| gating --- transiduction
structure --- |side chains not resolved \n sub-classes of AR conformation| motion
```
