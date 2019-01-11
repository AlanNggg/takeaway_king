/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package takeaway.bean;

/**
 *
 * @author TerryFungPC
 */
public class log {
    private String date;
    private String register;
    private String nonRegister;
    private String owner;
    public log(){}

    /**
     * @return the date
     */
    public String getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(String date) {
        this.date = date;
    }

    /**
     * @return the register
     */
    public String getRegister() {
        return register;
    }

    /**
     * @param register the register to set
     */
    public void setRegister(String register) {
        this.register = register;
    }

    /**
     * @return the nonRegister
     */
    public String getNonRegister() {
        return nonRegister;
    }

    /**
     * @param nonRegister the nonRegister to set
     */
    public void setNonRegister(String nonRegister) {
        this.nonRegister = nonRegister;
    }

    /**
     * @return the owner
     */
    public String getOwner() {
        return owner;
    }

    /**
     * @param owner the owner to set
     */
    public void setOwner(String owner) {
        this.owner = owner;
    }
    
    
}
