## Seipin ##

uniport: Q640F1

spcies: Xenopus laevis (African clawed frog) in [homologous comparison](./seipin#cryoem_jcb).

## Potential to do ##

1. [Alphafold Multimer](https://cosmic-cryoem.org/tools/alphafoldmultimer/) of seipin (X. laevis)
2. CNN to remove double-tip artifacts

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

### 2018_anionic ###

### 2022_cage ###

