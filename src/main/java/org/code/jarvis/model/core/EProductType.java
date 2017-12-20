package org.code.jarvis.model.core;

/**
 * Created by KimChheng on 8/12/2017.
 */
public enum EProductType {

    WED("WED", "Wedding", "សំបុត្រការ"),
    CER("CER", "Ceremony", "សំបុត្របុណ្យ"),
    HOM("HOM", "Home Party", "ទ្បើងផ្ទះ"),
    INV("INV", "Invoice", "វិក័យប័ត្រ"),
    HDB("HDB", "Happy Birthday", "សំបុត្រខួបកំណើត"),
    DES("DES", "Design", "សំបុត្រច្នៃ");

    public String desc;
    public String descKh;
    public String code;

    EProductType(String code, String desc, String descKh) {
        this.code = code;
        this.desc = desc;
        this.descKh = descKh;
    }
}
