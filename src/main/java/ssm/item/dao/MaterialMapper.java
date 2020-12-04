package ssm.item.dao;

import org.springframework.stereotype.Repository;
import ssm.item.pojo.Material;

import java.util.List;

@Repository
public interface MaterialMapper {
   void save(Material material);
   List<Material> findAll();
}
