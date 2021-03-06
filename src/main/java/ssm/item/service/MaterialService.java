package ssm.item.service;

import ssm.item.pojo.Material;
import ssm.item.pojo.Sort;

import java.io.IOException;
import java.util.List;

public interface MaterialService {
     void save(Material material);
     List<Material> sorts(Sort sort);
     List<Material> findAll();
     Material findById(Integer id);
     List<Material> findByAny(Material material);
     void deleteByIds(List<Integer> ids);
     void update(Material material,Integer id);
     void outexcel() throws IOException;
}
