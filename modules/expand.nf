process twice {
    input:
    file(a)

    output:
    file("${a}.2")

    script:
    """
    cat ${a} ${a} > ${a}.2
    """
}

process thrice {
    input:
    file(a)

    output:
    file("${a}.3")

    script:
    """
    cat ${a} ${a} ${a} > ${a}.3
    """
}

workflow expand(inch) {
    twice(inch)
    thrice(twice.output)
}
