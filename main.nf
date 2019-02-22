
require 'modules/convert_procs.nf'
require 'modules/expand.nf'

Channel
    .from(1,2,3,4,5)
    .set{ ch1 }

// normal nextflow process
process gen_csv {

    input:
    val x from ch1

    output:
    file "${x}.csv" into ch2

    script:
    """
    sleep ${x}
    echo "${x},${x},${x}" > ${x}.csv
    """
}

workflow {

    // import and use just processes
    to_tsv( to_psv(ch2) )

    // import and use a whole workflow
    expand(to_tsv.output)
}
