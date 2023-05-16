from domino import Domino
from os import environ
from os.path import splitext

domino = Domino(
    f"{environ['DOMINO_PROJECT_OWNER']}/{environ['DOMINO_PROJECT_NAME']}"
)

def blocking_job(path):
    environments = {
        '.sas': "645163bc122db878f0012705"
    }
    file_name, file_ext = splitext(path)
    domino.job_start_blocking(
        command=path,
        environment_id=environments[file_ext]
    )

report: "/mnt/data/CDISC01_RE_INTERIM/snakemake.rst"

envvars:
    "DOMINO_USER_API_KEY",
    "DOMINO_API_HOST"

rule all:
    input:
        "/mnt/data/ADAM/adae.sas7bdat",
        "/mnt/data/ADAM/adcm.sas7bdat",
        "/mnt/data/ADAM/adlb.sas7bdat",
        "/mnt/data/ADAM/admh.sas7bdat",
        "/mnt/data/ADAM/adsl.sas7bdat",
        "/mnt/data/ADAM/advs.sas7bdat",
        "/mnt/artifacts/results/t_ae_rel.pdf",
        "/mnt/data/TFL/t_ae_rel.sas7bdat",
        "/mnt/artifacts/results/t_pop.pdf",
        "/mnt/data/TFL/t_pop.sas7bdat",
        "/mnt/artifacts/results/t_vscat.pdf",
        "/mnt/data/TFL/t_vscat.sas7bdat",
        

rule ADAE:
    input:
        "/mnt/code/prod/adam/ADAE.sas",
        "/mnt/imported/data/snapshots/SDTMBLIND/MAY162023/ae.sas7bdat",
        "/mnt/imported/data/snapshots/SDTMBLIND/MAY162023/ex.sas7bdat",
        "/mnt/data/ADAM/adsl.sas7bdat"
    output:
        "/mnt/data/ADAM/adae.sas7bdat"
    log:
        "/mnt/artifacts/snakemake/ADAE.log"
    run:
        run = blocking_job(input[0])
        print(run)

rule ADCM:
    input:
        "/mnt/code/prod/adam/ADCM.sas",
        "/mnt/imported/data/snapshots/SDTMBLIND/MAY162023/cm.sas7bdat",
        "/mnt/data/ADAM/adsl.sas7bdat"
    output:
        "/mnt/data/ADAM/adcm.sas7bdat"
    log:
        "/mnt/artifacts/snakemake/ADCM.log"
    run:
        run = blocking_job(input[0])
        print(run)

rule ADLB:
    input:
        "/mnt/code/prod/adam/ADLB.sas",
        "/mnt/imported/data/snapshots/SDTMBLIND/MAY162023/lb.sas7bdat",
        "/mnt/data/ADAM/adsl.sas7bdat"
    output:
        "/mnt/data/ADAM/adlb.sas7bdat"
    log:
        "/mnt/artifacts/snakemake/ADLB.log"
    run:
        run = blocking_job(input[0])
        print(run)

rule ADMH:
    input:
        "/mnt/code/prod/adam/ADMH.sas",
        "/mnt/imported/data/snapshots/SDTMBLIND/MAY162023/mh.sas7bdat",
        "/mnt/data/ADAM/adsl.sas7bdat"
    output:
        "/mnt/data/ADAM/admh.sas7bdat"
    log:
        "/mnt/artifacts/snakemake/ADMH.log"
    run:
        run = blocking_job(input[0])
        print(run)

rule ADSL:
    input:
        "/mnt/code/prod/adam/ADSL.sas",
        "/mnt/imported/data/snapshots/SDTMBLIND/MAY162023/dm.sas7bdat"
    output:
        "/mnt/data/ADAM/adsl.sas7bdat"
    log:
        "/mnt/artifacts/snakemake/ADSL.log"
    run:
        run = blocking_job(input[0])
        print(run)

rule ADVS:
    input:
        "/mnt/code/prod/adam/ADVS.sas",
        "/mnt/imported/data/snapshots/SDTMBLIND/MAY162023/vs.sas7bdat",
        "/mnt/data/ADAM/adsl.sas7bdat"
    output:
        "/mnt/data/ADAM/advs.sas7bdat"
    log:
        "/mnt/artifacts/snakemake/ADVS.log"
    run:
        run = blocking_job(input[0])
        print(run)

rule t_ae_rel:
    input:
        "/mnt/code/prod/tfl/t_ae_rel.sas",
        "/mnt/data/ADAM/adsl.sas7bdat",
        "/mnt/data/ADAM/adae.sas7bdat"
    output:
        "/mnt/data/TFL/t_ae_rel.sas7bdat"
    log:
        "/mnt/artifacts/snakemake/t_ae_rel.log"
    run:
        run = blocking_job(input[0])
        print(run)

rule t_pop:
    input:
        "/mnt/code/prod/tfl/t_pop.sas",
        "/mnt/data/ADAM/adsl.sas7bdat"
    output:
        "/mnt/data/TFL/t_pop.sas7bdat"
    log:
        "/mnt/artifacts/snakemake/t_pop.log"
    run:
        run = blocking_job(input[0])
        print(run)

rule t_vscat:
    input:
        "/mnt/code/prod/tfl/t_vscat.sas",
        "/mnt/data/ADAM/advs.sas7bdat"
    output:
        "/mnt/data/TFL/t_vscat.sas7bdat"
    log:
        "/mnt/artifacts/snakemake/t_vscat.log"
    run:
        run = blocking_job(input[0])
        print(run)

rule qc_ADAE:
    input:
        "/mnt/code/qc/adam/qc_ADAE.sas",
        "/mnt/imported/data/snapshots/SDTMBLIND/MAY162023/ae.sas7bdat",
        "/mnt/imported/data/snapshots/SDTMBLIND/MAY162023/ex.sas7bdat",
        "/mnt/data/ADAM/adae.sas7bdat",
        "/mnt/data/ADAMQC/adsl.sas7bdat"
    log:
        "/mnt/artifacts/snakemake/qc_ADAE.log"
    run:
        run = blocking_job(input[0])
        print(run)

rule qc_ADCM:
    input:
        "/mnt/code/qc/adam/qc_ADCM.sas",
        "/mnt/imported/data/snapshots/SDTMBLIND/MAY162023/cm.sas7bdat",
        "/mnt/data/ADAM/adcm.sas7bdat",
        "/mnt/data/ADAMQC/adsl.sas7bdat"
    log:
        "/mnt/artifacts/snakemake/qc_ADCM.log"
    run:
        run = blocking_job(input[0])
        print(run)

rule qc_ADLB:
    input:
        "/mnt/code/qc/adam/qc_ADLB.sas",
        "/mnt/imported/data/snapshots/SDTMBLIND/MAY162023/lb.sas7bdat",
        "/mnt/data/ADAM/adlb.sas7bdat",
        "/mnt/data/ADAMQC/adsl.sas7bdat"
    log:
        "/mnt/artifacts/snakemake/qc_ADLB.log"
    run:
        run = blocking_job(input[0])
        print(run)

rule qc_ADMH:
    input:
        "/mnt/code/qc/adam/qc_ADMH.sas",
        "/mnt/imported/data/snapshots/SDTMBLIND/MAY162023/mh.sas7bdat",
        "/mnt/data/ADAM/admh.sas7bdat",
        "/mnt/data/ADAMQC/adsl.sas7bdat"
    log:
        "/mnt/artifacts/snakemake/qc_ADMH.log"
    run:
        run = blocking_job(input[0])
        print(run)

rule qc_ADSL:
    input:
        "/mnt/code/qc/adam/qc_ADSL.sas",
        "/mnt/imported/data/snapshots/SDTMBLIND/MAY162023/dm.sas7bdat",
        "/mnt/data/ADAM/adsl.sas7bdat"
    log:
        "/mnt/artifacts/snakemake/qc_ADSL.log"
    run:
        run = blocking_job(input[0])
        print(run)

rule qc_ADVS:
    input:
        "/mnt/code/qc/adam/qc_ADVS.sas",
        "/mnt/imported/data/snapshots/SDTMBLIND/MAY162023/vs.sas7bdat",
        "/mnt/data/ADAM/advs.sas7bdat",
        "/mnt/data/ADAMQC/adsl.sas7bdat"
    log:
        "/mnt/artifacts/snakemake/qc_ADVS.log"
    run:
        run = blocking_job(input[0])
        print(run)

rule qc_t_ae_rel:
    input:
        "/mnt/code/qc/tfl/qc_t_ae_rel.sas",
        "/mnt/data/ADAM/adsl.sas7bdat",
        "/mnt/data/ADAM/adae.sas7bdat"
    log:
        "/mnt/artifacts/snakemake/qc_t_ae_rel.log"
    run:
        run = blocking_job(input[0])
        print(run)

rule qc_t_pop:
    input:
        "/mnt/code/qc/tfl/qc_t_pop.sas",
        "/mnt/data/ADAM/adsl.sas7bdat"
    log:
        "/mnt/artifacts/snakemake/qc_t_pop.log"
    run:
        run = blocking_job(input[0])
        print(run)

rule qc_t_vscat:
    input:
        "/mnt/code/qc/tfl/qc_t_vscat.sas",
        "/mnt/data/ADAM/advs.sas7bdat"
    log:
        "/mnt/artifacts/snakemake/qc_t_vscat.log"
    run:
        run = blocking_job(input[0])
        print(run)
