
process to_tsv {

    input:
    file(csv_in)

    output:
    file("${csv_in}.tsv")

    script:
    """
    cat ${csv_in} | sed 's/,/\t/g' > ${csv_in}.tsv
    """
}

process to_psv {

    input:
    file(tsv_in)

    output:
    file("${tsv_in}.tsv")

    script:
    """
    cat ${tsv_in} | sed 's/\t/|/g' > ${tsv_in}.psv
    """
}

