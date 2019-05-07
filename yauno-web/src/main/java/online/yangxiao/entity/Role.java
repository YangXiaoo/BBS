package online.yangxiao.entity;

public class Role {
    private Integer id;

    private String roleName;

    private Integer roleVal;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

    public Integer getRoleVal() {
        return roleVal;
    }

    public void setRoleVal(Integer roleVal) {
        this.roleVal = roleVal;
    }
}