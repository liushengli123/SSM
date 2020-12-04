package ssm.item.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
    public String findAll(Model model){
        List<Material> materialList = materialService.findAll();
        model.addAttribute("material",materialList);
        return "test";
    }
}
