class ospfunnum::role::switchbase {
    include base::role::switch
    include ospfunnum::interfaces
    include ospfunnum::ptm
    include ospfunnum::quagga
}