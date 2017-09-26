header_type ht {
    fields {
        f1 : 4;
        f2 : 4;
    }
}


header ht h1;
header ht h2;
header ht a[2];

parser start{
    extract(h1);
    extract(a[0]);
    extract(a[1]);
    return ingress;
}

action a() {
    remove_header(h1);
    remove_header(a[0]);
}

table t {
    reads {
        h1.f1 : exact;
    }
    actions {
        a;
    }
}

control ingress{
    apply(t);
}