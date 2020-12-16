package ssm.item.service.Impl;

import com.alibaba.excel.EasyExcelFactory;
import com.alibaba.excel.ExcelWriter;
import com.alibaba.excel.metadata.Sheet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ssm.item.dao.MaterialMapper;
import ssm.item.pojo.Material;
import ssm.item.pojo.Sort;
import ssm.item.service.MaterialService;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;

@Service
@Transactional(readOnly = true)
public class MaterialServiceImpl implements MaterialService {
    @Autowired
    private MaterialMapper materialMapper;

    @Transactional
    @Override
    public void save(Material material) {
        List<Material> materials = materialMapper.findAll();
        if(materials.size()!=0){
        Iterator<Material> iterator = materials.iterator();
        int max = 0;
        while (iterator.hasNext()) {
            int id = iterator.next().getId();
            if (id > max) {
                max = id;
            }
        }
        String code = materialMapper.findById(max).getCode();
        int codes = 1 + Integer.parseInt(code);
        material.setCode(Integer.toString(codes));
        material.setId(max+1);
        }else {
            material.setId(1);
            material.setCode("1");
        }
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

    @Transactional
    @Override
    public void delete(Integer id) {
            materialMapper.delete(id);
    }

    @Transactional
    @Override
    public void deleteByIds(List<Integer> ids) {
        materialMapper.deleteByIds(ids);
    }

    @Transactional
    @Override
    public void update(Material material,Integer id) {
        material.setId(id);
        Material material1 = materialMapper.findById(id);
        material.setVersion(material1.getVersion()+1);
        materialMapper.update(material);
    }

    @Override
    public void outexcel() throws IOException {
        List<Material> materials = materialMapper.findAll();
        OutputStream out=new FileOutputStream(File.createTempFile("test",".xlsx", new File("D:\\test")));
        ExcelWriter writer = EasyExcelFactory.getWriter(out);
        Sheet sheet = new Sheet(1,0, Material.class);
        sheet.setSheetName("第一个sheet");
        writer.write(materials,sheet);
        writer.finish();
        out.close();
    }
}
