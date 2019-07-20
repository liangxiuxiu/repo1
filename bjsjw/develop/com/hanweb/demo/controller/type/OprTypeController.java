package com.hanweb.demo.controller.type;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hanweb.common.util.mvc.JsonResult;
import com.hanweb.common.util.mvc.ResultState;
import com.hanweb.common.util.mvc.Script;
import com.hanweb.complat.exception.OperationException;
import com.hanweb.demo.entity.Type;
import com.hanweb.demo.service.TypeService;

@Controller
@RequestMapping("manager/demo/type")
public class OprTypeController {

    @Autowired
    private TypeService typeService;

    @RequestMapping(value = "add_show")
    public ModelAndView add() {
        ModelAndView modelAndView = new ModelAndView("demo/type/type_opr");
        modelAndView.addObject("url", "add_submit.do");
        modelAndView.addObject("type", new Type());
        modelAndView.addObject("hasblob", false);
        return modelAndView;
    }

    @RequestMapping(value = "add_submit")
    @ResponseBody
    public String submitAdd(Type type, MultipartFile file) throws IOException {
        Script script = Script.getInstanceWithJsLib();
        if (file != null) {
            type.setBlob_field(file.getBytes());
        }
        typeService.add(type);
        script.addScript("parent.refreshParentWindow();parent.closeDialog();");
        return script.getScript();
    }
    
    @RequestMapping(value = "modify_show")
    public ModelAndView showModify(int integer_field,HttpServletRequest request) throws IOException {
        ModelAndView modelAndView = new ModelAndView("demo/type/type_opr");
        Type type = typeService.find(integer_field);
        boolean hasblob = false;
        if(type.getBlob_field() != null && type.getBlob_field().length > 0 && !(
                type.getBlob_field().length == 1 && type.getBlob_field()[0] == 0)){
            hasblob = true;
        }
        modelAndView.addObject("hasblob", hasblob);
        modelAndView.addObject("url", "modify_submit.do");
        modelAndView.addObject("type", type);
        return modelAndView;
    }
    
    @RequestMapping(value = "modify_submit")
    @ResponseBody
    public String submitModify(Type type, MultipartFile file) throws IOException {
        Script script = Script.getInstanceWithJsLib();
        if (file != null) {
            type.setBlob_field(file.getBytes());
        }
        typeService.modify(type);
        script.addScript("parent.refreshParentWindow();parent.closeDialog();");
        return script.getScript();
    }

    @RequestMapping(value = "remove")
    @ResponseBody
    public JsonResult remove(String ids) {
        boolean isSuccess = false;
        JsonResult jsonResult = JsonResult.getInstance();
        try {
            isSuccess = typeService.delete(ids);
            if (isSuccess) {
                jsonResult.set(ResultState.REMOVE_SUCCESS);
            } else {
                jsonResult.set(ResultState.REMOVE_FAIL);
            }
        } catch (OperationException e) {
            jsonResult.setMessage(e.getMessage());
        }
        return jsonResult;
    }

    @RequestMapping(value = "read")
    public void read(Integer integer_field, HttpServletResponse response)
            throws IOException {
        Type type = typeService.find(integer_field);
        byte[] blob = null;
        if(type != null){
            blob = type.getBlob_field();
        }
        if(blob != null){
            response.getOutputStream().write(blob);
        }
    }
}
