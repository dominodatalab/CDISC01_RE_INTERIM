# Protocol CDISC01 interim reporting effort repo
This repo contains the ADaM and TFL code for the CDISC01 protocol interim reporting effort.

# Directory structure

The programming is created in a typical clinical trial folder structure, where the production (prod) and qc programs have independent directory trees.

Reporting effort level standard code (e.g. SAS macros) should be stored in the `share/macros` folder.

The global `domino.sas` autoexec progam is also included in the repository to appropriately set up the SAS environment. 

```
repo
│   domino.sas
├───prod
│   ├───adam
│   └───tfl
├───qc
│   ├───adam
│   │       compare.sas
│   └───tfl
└───share
    └───macros
```

# Naming convention

The programs follow a typical clinical trial naming convention, where the ADaM programs are named using the dataset name (e.g. ADSL.sas, etc.) and the TFL programs have a `t_` prefix to indicate tables, etc.

# QC programming and reporting

The QC programming is all in SAS, and there is a `compare.sas` program which uses SAS PROC COMPARE to create a summary report of all differences between the prod and qc datasets. This program also generates the `dominostats.json` files which Domino uses to display a dashboard in the jobs screen.

# Support

Programming was created by Veramed Ltd. on behalf of Domino Data Lab, Inc.
