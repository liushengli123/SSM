package ssm.item.service.Impl;

import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ssm.item.dao.MaterialMapper;
import ssm.item.pojo.Material;
import ssm.item.pojo.Sort;
import ssm.item.service.MaterialService;

import java.util.List;

@Service
@Transactional
public class MaterialServiceImpl implements MaterialService {
    @Autowired
    private MaterialMapper materialMapper;
    @Override
    public void save(Material material) {
        materialMapper.save(material);
    }

    @Override
    public List<Material> sorts(Sort sort) {
       return materialMapper.sort(sort);

    }

    @Override
    public List<Material> findAll() {
        return materialMapper.findAll();
    }

    @Override
    public Material findById(Integer id) {
        return materialMapper.findById(id);
    }

    @Override
    public List<Material> findByAny(Material material) {
        return materialMapper.findByAny(material);
    }

    @Override
    public void delete(String id) {
        materialMapper.delete(id);
    }

    @Override
    public void deleteByIds(List<Integer> ids) {
        materialMapper.deleteByIds(ids);
    }

    @Override
    public void update(Material material) {
        materialMapper.update(material);
    }

}
