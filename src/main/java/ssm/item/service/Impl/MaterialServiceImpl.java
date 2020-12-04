package ssm.item.service.Impl;

import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ssm.item.dao.MaterialMapper;
import ssm.item.pojo.Material;
import ssm.item.service.MaterialService;

import java.util.List;

@Service("materialService")
public class MaterialServiceImpl implements MaterialService {
    @Autowired
    private MaterialMapper materialMapper;
    @Override
    public void save(Material material) {
        materialMapper.save(material);
    }

    @Override
    public List<Material> findAll() {
        List<Material> materialList= materialMapper.findAll();
        return materialList;
    }
}
