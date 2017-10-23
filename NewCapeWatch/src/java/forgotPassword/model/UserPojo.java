
package forgotPassword.model;

/**
 *
 * @author Sydney Twigg
 */
public class UserPojo {
    private String NAME;
    private String SURNAME;
    private String DIVISION;
    private String RANK;
    private String POLICESTATION;
    private String EMAIL;
    private String EMAILVERIFICATIONHASH;
    private String STATUS;
    private String PASSWORD;
    private String OFFICERID;

    public String getNAME() {
        return NAME;
    }

    public void setNAME(String NAME) {
        this.NAME = NAME;
    }

    public String getSURNAME() {
        return SURNAME;
    }

    public void setSURNAME(String SURNAME) {
        this.SURNAME = SURNAME;
    }

    public String getDIVISION() {
        return DIVISION;
    }

    public void setDIVISION(String DIVISION) {
        this.DIVISION = DIVISION;
    }

    public String getRANK() {
        return RANK;
    }

    public void setRANK(String RANK) {
        this.RANK = RANK;
    }

    public String getPOLICESTATION() {
        return POLICESTATION;
    }

    public void setPOLICESTATION(String POLICESTATION) {
        this.POLICESTATION = POLICESTATION;
    }

    public String getEMAIL() {
        return EMAIL;
    }

    public void setEMAIL(String EMAIL) {
        this.EMAIL = EMAIL;
    }

    public String getEMAILVERIFICATIONHASH() {
        return EMAILVERIFICATIONHASH;
    }

    public void setEMAILVERIFICATIONHASH(String EMAILVERIFICATIONHASH) {
        this.EMAILVERIFICATIONHASH = EMAILVERIFICATIONHASH;
    }

    public String getSTATUS() {
        return STATUS;
    }

    public void setSTATUS(String STATUS) {
        this.STATUS = STATUS;
    }

    public String getPASSWORD() {
        return PASSWORD;
    }

    public void setPASSWORD(String PASSWORD) {
        this.PASSWORD = PASSWORD;
    }

    public String getOFFICERID() {
        return OFFICERID;
    }

    public void setOFFICERID(String OFFICERID) {
        this.OFFICERID = OFFICERID;
    }

    @Override
    public String toString() {
        return "UserPojo{" + "NAME=" + NAME + ", SURNAME=" + SURNAME + ", DIVISION=" + DIVISION + ", RANK=" + RANK + ", POLICESTATION=" + POLICESTATION + ", EMAIL=" + EMAIL + ", EMAILVERIFICATIONHASH=" + EMAILVERIFICATIONHASH + ", STATUS=" + STATUS + ", PASSWORD=" + PASSWORD + ", OFFICERID=" + OFFICERID + '}';
    }
    
    
}
