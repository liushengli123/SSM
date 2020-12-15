package ssm.item.controller;

import com.alibaba.excel.EasyExcelFactory;
import com.alibaba.excel.ExcelWriter;
import com.alibaba.excel.metadata.Sheet;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import ssm.item.pojo.Material;
import ssm.item.pojo.Msg;
import ssm.item.pojo.Sort;
import ssm.item.service.MaterialService;

import javax.validation.Valid;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.*;

@Controller
public class MaterialController {
    @Autowired
    private MaterialService materialService;

//   查询所有
    @RequestMapping("list")
    public String findAll(@RequestParam(value = "pn",defaultValue = "1") Integer pn,Model model){
        PageHelper.startPage(pn,3);
        List<Material> materialList = materialService.findAll();
        PageInfo pageInfo=new PageInfo(materialList,3);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("materials",materialList);
        return "index";
    }

//    通过id查询
    @RequestMapping(value = "list/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg findById(@PathVariable("id") Integer id){
        Material material = materialService.findById(id);
        return Msg.success().add("material",material);
    }

//    通过任意条件查询
    @RequestMapping(value = "/select",method = RequestMethod.POST)
    @ResponseBody
    public Msg findByAny(Material material){
        List<Material> materialList = materialService.findByAny(material);
        return Msg.success().add("materials",materialList);
    }

//    添加
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    public Msg add(@Valid Material material,BindingResult result) {
        int b=material.getStart_time().compareTo(material.getEnd_time());
        if (result.hasErrors()) {
            //校验失败，应该返回失败，在模态框中显示校验失败的错误信息
            return getMsg(result);
        } else if (b>=0){
            return Msg.fail().add("time","起始时间应在截止时间之前");
        } else {
            List<Material> materials = materialService.findAll();
            Iterator<Material> iterator = materials.iterator();
            int max = 0;
            while (iterator.hasNext()) {
                int id = iterator.next().getId();
                if (id > max) {
                    max = id;
                }
            }
            String code = materialService.findById(max).getCode();
            Integer codes = 1 + Integer.parseInt(code);
            material.setCode(codes.toString());
            materialService.save(material);
            return Msg.success();
        }
    }

//    删除
    @RequestMapping("/delete")
    @ResponseBody
    public Msg delete(@RequestParam(name = "id") String id){
        materialService.delete(id);
        return Msg.success();
        }

//  批量删除
    @RequestMapping("delete/{ids}")
    @ResponseBody
    public Msg deleteByIds(@PathVariable("ids") String ids) {
        List<Integer> del_ids = new ArrayList<Integer>();
        if (ids.contains(" ")) {
            String[] str_ids = ids.split(" ");
            //组装id的集合
            for (String string : str_ids) {
                del_ids.add(Integer.parseInt(string));
            }
        }else {
            del_ids.add(Integer.parseInt(ids));
        }
        materialService.deleteByIds(del_ids);
        return Msg.success();
    }

//    修改
    @RequestMapping(value = "/update/{id}",method = RequestMethod.POST)
    @ResponseBody
    public Msg update(@PathVariable("id") Integer id,@Valid Material material,BindingResult result){
        int b=material.getStart_time().compareTo(material.getEnd_time());
        if (result.hasErrors()){
            return getMsg(result);
        }else if (b>=0){
            return Msg.fail().add("time","起始时间应在截止时间之前");
        }
        else {
            material.setId(id);
            materialService.update(material);
            return Msg.success();
        }
    }

//    校验方法
    private Msg getMsg(BindingResult result) {
        Map<String, Object> map = new HashMap<String, Object>();
        List<FieldError> errors = result.getFieldErrors();
        for (FieldError fieldError : errors) {
            map.put(fieldError.getField(), fieldError.getDefaultMessage());
        }
        return Msg.fail().add("errorFields",map);
    }

    @RequestMapping("/excel")
    @ResponseBody
    public Msg outExcel() throws IOException {
        List<Material> materials = materialService.findAll();
        OutputStream out=new FileOutputStream(File.createTempFile("test",".xlsx", new File("D:\\test")));
        ExcelWriter writer = EasyExcelFactory.getWriter(out);
        Sheet sheet = new Sheet(1,0, Material.class);
        sheet.setSheetName("第一个sheet");
        writer.write(materials,sheet);
        writer.finish();
        out.close();
        return Msg.success();
    }

//    通过传入的字段名和排序方式实现对后端的排序查询(只查询flag=1的数据)
    @RequestMapping(value = "/sorts",method = RequestMethod.GET)
    @ResponseBody
    public Msg sorts(Sort sort){
        List<Material> materialList=materialService.sorts(sort);
        System.out.println(materialList);
        return Msg.success().add("materials",materialList);
    }
}
