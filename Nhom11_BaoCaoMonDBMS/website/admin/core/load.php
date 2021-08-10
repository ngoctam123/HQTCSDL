<?php 
    //Hàm load các tập tin được lưu trong thư mục models
    function loadModel($name){
        //ucfirst(): chuyển các ký tự đầu thành Hoa
        //strtolower(): chuyển các ký tự trong chuỗi về chữ thường
        $name = ucfirst(strtolower($name));
        //tạo đường dẫn
        $pathModel = 'models/'.$name.'.php';
        //Kiểm tra file có tồn tại theo đường dẫn hay không
        if (file_exists($pathModel)) {
            # code...
            include_once($pathModel);
            $modelClass = new $name;
            return $modelClass;
        }
        else return null;
    }
    //Hàm load các tập tin từ thư nục views/modules
    function loadModule($name){
        $pathModule = 'views/modules/'.$name.'.php';
        if (file_exists($pathModule)) {
            # code...
            include($pathModule);
        }
    }
    //Hàm load các tập tin từ thư nục views/template
     function loadTemplate($name){
        $pathTemplate = 'views/template/'.$name.'.php';
        if (file_exists($pathTemplate)) {
            # code...
            include($pathTemplate);
        }
        else echo "Template ".$name." không tồn tại";
    }
    //Hàm load các tập tin từ thư nục views/components
    function loadComponent(){
        $pathCom = 'views/components/';
        if (isset($_REQUEST['option'])) {
            // $option = $_REQUEST['option'];
            $pathCom.= $_REQUEST['option']."/";
            if (isset($_REQUEST['cat'])) {
                # code...
                $pathCom.=$_REQUEST['cat'].".php";
            }
            else{
                $pathCom.="index.php";
            }
        }
        else {
            $pathCom.='control/index.php';
        }
        if (file_exists($pathCom)) {
            # code...
            include_once($pathCom);
        }
        else echo $pathCom. " Không tồn tại";
        
    }

    function loadClass($name){
        $name = ucfirst(strtolower($name));
        $pathClass = 'core/'.$name.'.php';
        if (file_exists($pathClass)) {
            # code...
            include_once($pathClass);
            $nameClass = new $name;
            return $nameClass;
        }
        else return null;
    }
?>