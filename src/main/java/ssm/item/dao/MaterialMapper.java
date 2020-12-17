package ssm.item.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import ssm.item.pojo.Material;
import ssm.item.pojo.Sort;

import java.util.List;

@Repository
public interface MaterialMapper {
   void save(Material material);

   List<Material> sort(Sort sort);

   List<Material> findAll();

   Material findById(Integer id);

   List<Material> findByAny(Material material);

   void deleteByIds(@Param("ids") List<Integer> ids);

   void update(Material material);
}
