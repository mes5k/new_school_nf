
require 'modules/convert.nf'

Channel
    .from(1,2,3,4,5)
    .set{ ch1 }

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
    to_tsv( to_psv(ch2) ).view()
}
