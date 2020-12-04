package ssm.item.service;

import ssm.item.pojo.Material;

import java.util.List;

public interface MaterialService {
    public void save(Material material);
    public List<Material> findAll();
}
