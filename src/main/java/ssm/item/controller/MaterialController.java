package ssm.item.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ssm.item.pojo.Material;
import ssm.item.service.MaterialService;

import java.util.List;

@Controller("materialController")
public class MaterialController {
    @Autowired
    private MaterialService materialService;
//    @RequestMapping("save")
//    public void save(){
//        Material material = new Material();
//        material.setCode("1");
//        material.setId(6);
//        material.setUom("米");
//        material.setDescription("这是一米长的绳子");
//        material.setFlag(1);
//        material.setVersion(3);
//        materialService.save(material);
//    }

    @RequestMapping("test")
    public String findAll(@RequestParam(value = "pnum",defaultValue = "1") Integer pn,Model model){
        PageHelper.startPage(pn,2);
        List<Material> materialList = materialService.findAll();
        PageInfo pageInfo=new PageInfo(materialList,2);
        model.addAttribute("page",pageInfo);
        model.addAttribute("material",materialList);
        return "test";
    }
}
