
process to_tsv {
    tag "${csv_in}"

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
    tag "${tsv_in}"

    input:
    file(tsv_in)

    output:
    file("${tsv_in}.psv")

    script:
    """
    cat ${tsv_in} | sed 's/\t/|/g' > ${tsv_in}.psv
    """
}

