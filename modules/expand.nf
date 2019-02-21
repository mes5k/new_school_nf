
workflow expand(inch) {

    process twice {
        input:
        file(a) from inch

        output:
        file("${a}.2") into twout

        script:
        """
        cat ${a} ${a} > ${a}.2
        """
    }

    process thrice {
        input:
        file(a) from twout

        output:
        file("${a}.3")

        script:
        """
        cat ${a} ${a} ${a} > ${a}.3
        """
    }
}
