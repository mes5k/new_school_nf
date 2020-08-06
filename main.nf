nextflow.preview.dsl=2

include { to_psv } from './modules/convert_procs.nf'
include { to_tsv } from './modules/convert_procs.nf'

process gen_csv {

    input:
    val x

    output:
    file "${x}.csv"

    script:
    """
    sleep ${x}
    echo "${x},${x},${x}" > ${x}.csv
    """
}

workflow {

    Channel
        .from(1,2,3,4,5)
        .set{ ch1 }
    ch2 = gen_csv(ch1)

    to_tsv( to_psv(ch2) ).view()
}
