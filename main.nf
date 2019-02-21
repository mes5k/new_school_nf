
require 'modules/convert.nf'

Channel
    .from(1,2,3,4,5)
    .set{ ch1 }

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

ch1.gen_csv()
   .to_tsv()
   .to_psv()
