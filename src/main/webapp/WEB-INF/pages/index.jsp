<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>index</title>
      <%
          pageContext.setAttribute("APP_PATH", request.getContextPath());
      %>
      <script src="https://cdn.jsdelivr.net/npm/jutils-src"></script>
      <script type="text/javascript" src="${APP_PATH}/resources/scripts/jquery-1.12.4.min.js"></script>
      <link href="../../static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
      <script src="../../static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link href="../../resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
    <link href="../../data/styles.css" type="text/css" rel="stylesheet"/>
    <link href="../../files/index/styles.css" type="text/css" rel="stylesheet"/>
    <style>
        #tbl{
          border-collapse: collapse;
          border: 1px solid #000000;
            table-layout: fixed;
            text-align: center;
            line-height: 50px;
            word-break: break-all;
            white-space: nowrap;
            text-overflow:ellipsis;
        }
    </style>
  </head>
  <body>
<%--  新增模态框--%>
  <div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
          <div class="modal-content">
              <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  <h4 class="modal-title" id="myModalLabel">物料添加</h4>
              </div>
              <div class="modal-body">
                      <form class="form-horizontal">
                          <div class="form-group">
                              <label class="col-sm-2 control-label">物料描述</label>
                              <div class="col-sm-10">
                                  <input type="text" name="description" class="form-control" placeholder="description" id="description">
                                  <span class="help-block"></span>
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 control-label">物料单位</label>
                              <div class="col-sm-10">
                                  <select class="form-control" name="uom" id="uom">
                                      <option value="m">m</option>
                                      <option value="g">g</option>
                                      <option value="km">km</option>
                                      <option value="kg">kg</option>
                                  </select>
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 control-label">生效时间</label>
                              <div class="col-sm-10">
                                  <input type="date" name="start_time" class="form-control" id="start">
                                  <span class="help-block"></span>
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 control-label">截止时间</label>
                              <div class="col-sm-10">
                                  <input type="date" name="end_time" class="form-control" id="end">
                                  <span class="help-block"></span>
                              </div>
                          </div> <div class="form-group">
                              <label class="col-sm-2 control-label">是否启用</label>
                              <div class="col-sm-10">
                                  <label class="radio-inline">
                                      <input type="radio" name="flag" class="add_flag" value="1" checked="checked"> 是
                                  </label>
                                  <label class="radio-inline">
                                      <input type="radio" name="flag" class="add_flag" value="0"> 否
                                  </label>
                              </div>
                          </div>

                      </form>
              </div>
              <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal" id="close_btn">关闭</button>
                  <button type="button" class="btn btn-primary" id="add_btn">提交</button>
              </div>
          </div>
      </div>
  </div>
<%--  修改模态框--%>
  <div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <input type="hidden" id="edit_id">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                物料编码：<span class="modal-title form-control-static" id="myModalLabel1"></span>
            </div>
            <div class="modal-body1">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">物料描述</label>
                        <div class="col-sm-10">
                            <input type="text" name="description" id="description1" class="form-control" placeholder="description">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">物料单位</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="uom" id="uom1">
                                <option value="m">m</option>
                                <option value="g">g</option>
                                <option value="km">km</option>
                                <option value="kg">kg</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">生效时间</label>
                        <div class="col-sm-10">
                            <input type="date" name="start_time" class="form-control" id="start1">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">截止时间</label>
                        <div class="col-sm-10">
                            <input type="date" name="end_time" class="form-control" id="end1">
                            <span class="help-block"></span>
                        </div>
                    </div> <div class="form-group">
                    <label class="col-sm-2 control-label">是否启用</label>
                    <div class="col-sm-10">
                        <label class="radio-inline1">
                            <input type="radio" name="flag" class="update_flag" value="1" checked="checked"> 是
                        </label>
                        <label class="radio-inline1">
                            <input type="radio" name="flag" class="update_flag" value="0"> 否
                        </label>
                    </div>
                </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="close_btn1">关闭</button>
                <button type="button" class="btn btn-primary" id="add_btn1" >提交</button>
            </div>
        </div>
    </div>
</div>


  <div id="base" style="position: absolute;left:200px" >
      <!-- Title (矩形) -->
      <div id="u0" class="ax_default _一级标题" data-label="Title">
        <div id="u0_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u1" class="text" style="visibility: visible;">
          <p><span>物料管理</span></p>
        </div>
      </div>
      <!-- Title分割线 (水平线) -->
      <div id="u2" class="ax_default line" data-label="Title分割线">
        <img id="u2_img" class="img " src="../../images/index/title____u2.png"/>
        <!-- Unnamed () -->
        <div id="u3" class="text" style="display: none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <!-- 物料编码查询标签 (矩形) -->
      <div id="u4" class="ax_default label" data-label="物料编码查询标签">
        <div id="u4_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u5" class="text" style="visibility: visible;">
          <p><span>物料编码</span></p>
        </div>
      </div>

      <!-- 物料编码查询条件 (文本框) -->
      <div id="u6" class="ax_default text_field" data-label="物料编码查询条件">
        <input id="u6_input" type="text" value=""/>
      </div>

      <!-- 物料描述查询标签 (矩形) -->
      <div id="u7" class="ax_default label" data-label="物料描述查询标签">
        <div id="u7_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u8" class="text" style="visibility: visible;">
          <p><span>物料描述</span></p>
        </div>
      </div>

      <!-- 物料描述查询条件 (文本框) -->
      <div id="u9" class="ax_default text_field" data-label="物料描述查询条件">
        <input id="u9_input" type="text" value=""/>
      </div>

      <!-- 物料单位查询标签 (矩形) -->
      <div id="u10" class="ax_default label" data-label="物料单位查询标签">
        <div id="u10_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u11" class="text" style="visibility: visible;">
          <p><span>物料单位</span></p>
        </div>
      </div>

      <!-- 物料单位查询条件 (下拉列表框) -->
      <div id="u12" class="ax_default droplist" data-label="物料单位查询条件">
        <select id="u12_input">
            <option value="">所有类型</option>
            <option value="m">m</option>
            <option value="g">g</option>
            <option value="km">km</option>
            <option value="kg">kg</option>
        </select>
      </div>

      <!-- 重置按钮 (矩形) -->
      <div id="u13" class="ax_default button" data-label="重置按钮">
            <button onclick="member_reset()" href="javascript:;" class="btn btn-warning">重置</button>
      </div>

      <!-- 查询按钮 (矩形) -->
      <div id="u15" class="ax_default button" data-label="查询按钮">
            <button type="button" class="btn btn-success" id="select_btn">查询</button>
      </div>

      <!-- 生效时间从查询标签 (矩形) -->
      <div id="u17" class="ax_default label" data-label="生效时间从查询标签">
        <div id="u17_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u18" class="text" style="visibility: visible;">
          <p><span>生效时间从</span></p>
        </div>
      </div>

      <!-- 生效时间从查询条件 (文本框) -->
      <div id="u19" class="ax_default text_field" data-label="生效时间从查询条件">
        <input id="u19_input" type="date" value=""/>
      </div>

      <!-- 生效时间至查询标签 (矩形) -->
      <div id="u20" class="ax_default label" data-label="生效时间至查询标签">
        <div id="u20_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u21" class="text" style="visibility: visible;">
          <p><span>生效时间至</span></p>
        </div>
      </div>

      <!-- 生效时间至查询条件 (文本框) -->
      <div id="u22" class="ax_default text_field" data-label="生效时间至查询条件">
        <input id="u22_input" type="date" value=""/>
      </div>
      <!-- 是否启用查询标签 (矩形) -->
      <div id="u23" class="ax_default label" data-label="是否启用查询标签">
        <div id="u23_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u24" class="text" style="visibility: visible;">
          <p><span>是否启用</span></p>
        </div>
      </div>

      <!-- 是否启用查询条件 (下拉列表框) -->
      <div id="u25" class="ax_default droplist" data-label="是否启用查询条件">
        <select id="u25_input">
          <option value="1">是</option>
          <option value="0">否</option>
        </select>
      </div>
      <button style="position:absolute;top:160px;left:1000px" type="button"  class="btn btn-info btn-sm" id="ed">批量删除</button>
      <button style="position:absolute;top:160px;left: 1100px;" id="btn2" type="button" class="btn-sm btn btn-primary btn-lg">
          文件导出
      </button>
<%--      <!-- 数据表格 (表格) -->--%>
      <div id="u26" class="ax_default" data-label="数据表格">
            <table id="tbl" width="1100px" cellpadding="1" cellspacing="0" border="1px" style="font-size: 17px;font-family: 宋体">
                <thead>
                <tr  style="font-family: 黑体">
                      <td>
                          <input type="checkbox" id="check_all"/>
                      </td>
                      <td>物料编码</td>
                      <td>物料描述</td>
                      <td>物料单位</td>
                      <td>生效时间从</td>
                      <td>生效时间至</td>
                      <td>是否启用</td>
                      <td>操作</td>
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${materials}" var="material">
                    <tr id="${material.id}" name="list_select">
                        <td><input type="checkbox" class="check_item"/></td>
                        <td>${material.code}</td>
                        <td style="overflow: hidden" title="${material.description}">${material.description}</td>
                        <td>${material.uom}</td>
                        <td><fmt:formatDate value="${material.start_time}" pattern="yyyy-MM-dd" /></td>
                        <td><fmt:formatDate value="${material.end_time}" pattern="yyyy-MM-dd" /></td>
                        <td>
                            <c:if test="${material.flag==1}">
                                <span>是</span>
                            </c:if>
                            <c:if test="${material.flag==0}">
                                <span>否</span>
                            </c:if>
                        </td>
                        <td>
                            <button type="button" onclick="member_edit(this,${material.id})" href="javascript:;" class="btn btn-info btn-sm edit_btn" data-toggle="modal" data-target="#myUpdateModal" id="edit_btn">编辑</button>
                            <button type="button" onclick="member_del(this,${material.id})" href="javascript:;" class="btn btn-danger btn-sm" id="delete_btn">删除</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
      </div>

      <div id="u86" class="ax_default button" data-label="新建按钮">
          <!-- Unnamed () -->
         <button id="btn1" type="button" class="btn-sm btn btn-primary btn-lg" data-toggle="modal" data-target="#myAddModal">
                  新增
              </button>
      </div>

      <!-- 分页控件 (图片) -->
      <div id="u88" style="position:relative;left:950px;top: 450px">
              <!--分页文字信息  --><div style="right: 0px;margin-right: 0px">
                  <nav aria-label="Page navigation">
                      <ul class="pagination">
                          <li><a href="list?pn=1">首页</a></li>
                          <c:if test="${pageInfo.hasPreviousPage }">
                              <li><a href="list?pn=${pageInfo.pageNum-1}"
                                     aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                              </a></li>
                          </c:if>
                          <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                              <c:if test="${page_Num == pageInfo.pageNum }">
                                  <li class="active"><a href="#">${page_Num }</a></li>
                              </c:if>
                              <c:if test="${page_Num != pageInfo.pageNum }">
                                  <li><a href="list?pn=${page_Num }">${page_Num }</a></li>
                              </c:if>
                          </c:forEach>
                          <c:if test="${pageInfo.hasNextPage }">
                              <li><a href="list?pn=${pageInfo.pageNum+1 }"
                                     aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                              </a></li>
                          </c:if>
                          <li><a href="list?pn=${pageInfo.pages}">末页</a></li>
                      </ul>
                  </nav>
      </div>
          <form id="sort_select">
              排序字段:<select id="sort">
                        <option value="code">code</option>
                        <option value="description">description</option>
                        <option value="flag">flag</option>
                     </select>
              排序方式：<select id="order">
                        <option value="desc">desc</option>
                        <option value="asc">asc</option>
                      </select>
          </form>
          <button type="button" id="sort_save">执行</button>
      </div>
    </div>


    <script type="text/javascript">
<%--        添加按钮绑定模态框--%>
        $("#btn1").click(function () {
            $('#empAddModal').modal({
                backdrop:"static"
            });
        });
        //提交按钮绑定事件
        $("#add_btn").click(function (){
            var obj=new Object();
            obj.description=$("#description").val();
            obj.uom=$("#uom").val();
            obj.start_time=$("#start").val();
            obj.end_time=$("#end").val();
            obj.flag=$(".add_flag:checked").val();
            console.log(obj);
            $.ajax({
                url:"/add",
                type:"POST",
                data:obj,
                dataType:'JSON',
                success:function (result){
                    if (result.code==100) {
                        $("#empAddModal").modal("hide");
                        location.reload();
                    }else if (result.extend.time!=null) {
                        alert(result.extend.time);}
                    else {
                        alert(result.extend.errorFields.description);
                    }
                }
            });
        });

        // 修改异步显示数据
        function member_edit(obj,id){
            $.ajax({
                url:"/list/"+id,
                type:"get",
                success:function (result) {
                    var materialdata=result.extend.material;
                    var start_time=jutils.formatDate(new Date(materialdata.start_time),"yyyy-MM-dd");
                    var end_time=jutils.formatDate(new Date(materialdata.end_time),"yyyy-MM-dd");
                    $("#edit_id").val(materialdata.id);
                    $("#myModalLabel1").text(materialdata.code);
                    $("#description1").val(materialdata.description);
                    $("#empUpdateModal select").val([materialdata.uom]);
                    $("#start1").val(start_time);
                    $("#end1").val(end_time);
                    $("#empUpdateModal input[name=flag]").val([materialdata.flag]);
                    $('#empUpdateModal').modal({
                        backdrop: "static"
                    })
                }
            })
        }
       // 修改提交
       $("#add_btn1").click(function () {
           var id=$("#edit_id").val();
           var obj=new Object();
           obj.description=$("#description1").val();
           obj.uom=$("#uom1").val();
           obj.start_time=$("#start1").val();
           obj.end_time=$("#end1").val();
           obj.flag=$(".update_flag:checked").val();
           $.ajax({
               url: "/update/"+id,
               type: "POST",
               data: obj,
               dataType: 'JSON',
               success: function (result) {
                   if (result.code==100) {
                       $("#empUpdateModal").modal('hide');
                       location.reload();
                   }else if (result.extend.time!=null){
                       alert(result.extend.time);
                   }
                   else {
                       alert(result.extend.errorFields.description);
                   }
               }
           })
       })


        //选中按钮绑定选中状态
        $("#check_all").click(function(){
            //attr获取checked是undefined;
            //我们这些dom原生的属性；attr获取自定义属性的值；
            //prop修改和读取dom原生属性的值
            $(".check_item").prop("checked",$(this).prop("checked"));
        });
        //check_item
        $(document).on("click",".check_item",function(){
            //判断当前选择中的元素是否5个
            var flag = $(".check_item:checked").length==$(".check_item").length;
            $("#check_all").prop("checked",flag);
        });

        //删除按钮绑定删除事件
        function member_del(obj,id) {
            //发异步删除数据
            if (confirm("确定删除吗？")) {
                $.ajax({
                    type: "post",
                    url: "/delete",
                    data: {id: id},
                    dataType: "json",
                    success: function (result) {
                        if (result.code == 100) {
                            $(obj).parents("tr").remove();
                            location.reload();
                        }
                    }
                });
            }
        }
    //    批量删除
        $("#ed").click(function () {
            var codes="";
            $.each($(".check_item:checked"),function () {
                codes +=($(this).parents("tr").find("td:eq(1)").text())+" ";
            });
            if(confirm("确定删除【"+codes+"】吗？")){
                    $.ajax({
                        url:"/delete/"+codes,
                        success:function (result) {
                            location.reload();
                        }

                    })
            }
        })

    //    查询按钮绑定事件
        $("#select_btn").click(function () {
            var material=new Object();
            material.code=$("#u6_input").val();
            material.description=$("#u9_input").val();
            material.uom=$("#u12_input").val();
            // material.start_time=jutils.formatDate(new Date($("#u19_input").val()),"yyyy/MM/dd");
            material.start_time=$("#u19_input").val();
            material.end_time=$("#u22_input").val();
            material.flag=$("#u25_input").val();
            console.log(material);
            $.ajax({
                url:"/select",
                data:material,
                dataType:"JSON",
                type:"POST",
                success:function (result) {
                    var mts = result.extend.materials;
                    $("#tbl tbody").empty();
                    $.each(mts, function (index, item) {
                        var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
                        var code = $("<td></td>").append(item.code);
                        var description = $("<td></td>").append(item.description);
                        var uom = $("<td></td>").append(item.uom);
                        var start_time=$("<td></td>").append(jutils.formatDate(new Date(item.start_time),"yyyy-MM-dd"));
                        var end_time=$("<td></td>").append(jutils.formatDate(new Date(item.end_time),"yyyy-MM-dd"));
                        var flag = $("<td></td>").append(item.flag == "0" ? "否" : "是");
                        var editBtn =$("<button></button>").addClass("btn btn-info btn-sm edit_btn").append("编辑");
                        //为编辑按钮添加一个自定义的属性，来表示当前员工id
                        //  editBtn.addEventListener('click',member_edit(this,item.id));
                        var delBtn =$("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append("删除");
                        //为删除按钮添加一个自定义的属性来表示当前删除的员工id
                        //  delBtn.addEventListener('click',member_del(this,item.id));
                        var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
                        $("<tr></tr>").append(checkBoxTd)
                            .append(code)
                            .append(description)
                            .append(uom)
                            .append(start_time)
                            .append(end_time)
                            .append(flag)
                            .append(btnTd)
                            .appendTo("#tbl tbody");
                    });
                }
            })
        });
        //重置按钮绑定事件
        function member_reset(){
            $("#u6_input").val("");
            $("#u9_input").val("");
            $("#u12_input").val("");
            location.reload();
        }
        $("#btn2").click(function () {
            $.ajax({
                url:"/excel",
                success:function (result) {
                    if (result.code==100) {
                        alert("导出成功");
                    }
                }
            })
        })
        $("#sort_save").click(function () {
            var obj=new Object();
             obj.sort=$("#sort").val();
             obj.order=$("#order").val();
             $.ajax({
                 url:"/sorts",
                 data:obj,
                 dataType:"JSON",
                 type:"GET",
                 success:function (result) {
                     location.reload();
                 }
             })
        })
    </script>
  </body>
</html>
