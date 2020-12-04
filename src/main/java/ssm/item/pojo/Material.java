package ssm.item.pojo;

import java.util.Date;

public class Material {
    private int id;
    private String code;
    private String uom;
    private String description;
    private Date start_time;
    private Date end_time;
    private int flag;
    private int version;
    private Date create_time;
    private String create_user;
    private Date update_time;
    private String update_user;

    public Material() {
    }

    public Material(int id, String code, String uom, String description, Date start_time, Date end_time, int flag, int version, Date create_time, String create_user, Date update_time, String update_user) {
        this.id = id;
        this.code = code;
        this.uom = uom;
        this.description = description;
        this.start_time = start_time;
        this.end_time = end_time;
        this.flag = flag;
        this.version = version;
        this.create_time = create_time;
        this.create_user = create_user;
        this.update_time = update_time;
        this.update_user = update_user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getUom() {
        return uom;
    }

    public void setUom(String uom) {
        this.uom = uom;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getStart_time() {
        return start_time;
    }

    public void setStart_time(Date start_time) {
        this.start_time = start_time;
    }

    public Date getEnd_time() {
        return end_time;
    }

    public void setEnd_time(Date end_time) {
        this.end_time = end_time;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

    public int getVersion() {
        return version;
    }

    public void setVersion(int version) {
        this.version = version;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public String getCreate_user() {
        return create_user;
    }

    public void setCreate_user(String create_user) {
        this.create_user = create_user;
    }

    public Date getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(Date update_time) {
        this.update_time = update_time;
    }

    public String getUpdate_user() {
        return update_user;
    }

    public void setUpdate_user(String update_user) {
        this.update_user = update_user;
    }

    @Override
    public String toString() {
        return "Material{" +
                "id=" + id +
                ", code='" + code + '\'' +
                ", uom='" + uom + '\'' +
                ", description='" + description + '\'' +
                ", start_time=" + start_time +
                ", end_time=" + end_time +
                ", flag=" + flag +
                ", version=" + version +
                ", create_time=" + create_time +
                ", create_user='" + create_user + '\'' +
                ", update_time=" + update_time +
                ", update_user='" + update_user + '\'' +
                '}';
    }
}
