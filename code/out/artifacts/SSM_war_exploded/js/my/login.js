$(function (encodedURIComponent) {
    var validateCode = "";

    /**生成一个随机数**/
    function randomNum(min, max) {
        return Math.floor(Math.random() * (max - min) + min);
    }

    /**生成一个随机色**/
    function randomColor(min, max) {
        var r = randomNum(min, max);
        var g = randomNum(min, max);
        var b = randomNum(min, max);
        return "rgb(" + r + "," + g + "," + b + ")";
    }

    drawPic();
    document.getElementById("changeImg").onclick = function (e) {
        validateCode = "";
        e.preventDefault();
        drawPic();
    }

    /**绘制验证码图片**/
    function drawPic() {
        var canvas = document.getElementById("canvas");
        var width = canvas.width;
        var height = canvas.height;
        var ctx = canvas.getContext('2d');
        ctx.textBaseline = 'bottom';

        /**绘制背景色**/
        ctx.fillStyle = randomColor(180, 240); //颜色若太深可能导致看不清
        ctx.fillRect(0, 0, width, height);
        /**绘制文字**/
        var str = 'ABCEFGHJKLMNPQRSTWXY123456789';
        for (var i = 0; i < 4; i++) {
            var txt = str[randomNum(0, str.length)];
            validateCode += txt;
            ctx.fillStyle = randomColor(50, 160);  //随机生成字体颜色
            ctx.font = randomNum(15, 40) + 'px SimHei'; //随机生成字体大小
            var x = 10 + i * 25;
            var y = randomNum(25, 45);
            var deg = randomNum(-45, 45);
            //修改坐标原点和旋转角度
            ctx.translate(x, y);
            ctx.rotate(deg * Math.PI / 180);
            ctx.fillText(txt, 0, 0);
            //恢复坐标原点和旋转角度
            ctx.rotate(-deg * Math.PI / 180);
            ctx.translate(-x, -y);
        }
        /**绘制干扰线**/
        for (var i = 0; i < 8; i++) {
            ctx.strokeStyle = randomColor(40, 180);
            ctx.beginPath();
            ctx.moveTo(randomNum(0, width), randomNum(0, height));
            ctx.lineTo(randomNum(0, width), randomNum(0, height));
            ctx.stroke();
        }
        /**绘制干扰点**/
        for (var i = 0; i < 80; i++) {
            ctx.fillStyle = randomColor(0, 255);
            ctx.beginPath();
            ctx.arc(randomNum(0, width), randomNum(0, height), 1, 0, 2 * Math.PI);
            ctx.fill();
        }
    }

    $('#loginForm').bootstrapValidator({
        message: 'This value is not valid',
        //提供输入验证图标提示
        /* feedbackIcons: {
             valid: 'glyphicon glyphicon-ok',
             invalid: 'glyphicon glyphicon-remove',
             validating: 'glyphicon glyphicon-refresh'
         },*/
        fields: {
            username: {
                message: '用户名验证失败',
                validators: {
                    notEmpty: {
                        message: '用户名不能为空'
                    },
                    stringLength: {
                        min: 3,
                        max: 16,
                        message: '用户名长度必须在3到16之间'
                    },
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: '密码不能为空'
                    },
                    stringLength: {
                        min: 6,
                        max: 18,
                        message: '密码长度必须在6到12位之间'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_]+$/,
                        message: '密码只能包含大写、小写、数字和下划线'
                    }
                }
            },
            captcha: {
                validators: {
                    callback: {
                        message: '验证码不正确',
                        callback: function (value, validator) {
                            /*var code  = $("#captcha").html().text();*/
                            return value === validateCode;
                        }
                    }
                }
            }
        }

    }).on('success.form.bv', function (e) {//点击提交表单，验证通过之后
        e.preventDefault();// Prevent form submission
        var $form = $(e.target);//e.target 就是表单实例 form
        var bv = $form.data('bootstrapValidator');
        var data = $form.serializeArray();

        var jsondata = {};
        for (var i = 0; i < data.length - 1; i++) {
            jsondata[data[i].name] = data[i]['value'];
        }
        jsondata = JSON.stringify(jsondata);
        // Use Ajax to submit form data 提交至form标签中的action，result自定义
        $.ajax({
            url: $form.attr('action'),
            data: jsondata,
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            type: "post",
            success: function (data) {
                // var c = $.cookie("loginUser");
                // alert(c)
                //恢复submit按钮disable状态。
                $('#loginForm').bootstrapValidator('disableSubmitButtons', false);
                Swal.fire({
                    title: '登录成功!',
                    icon: 'success',
                    customClass: "sweetAlert_self",
                    // animation: 'slide-from-top',
                    position: 'top-end', //定位 左上角
                    toast: true,
                    showConfirmButton: false,
                    timer: 1500
                }).then(function () {
                    // alert($.cookie('loginUser'))
                    window.location.href = "index.jsp";
                })
                if ($("#rememberme").prop("checked")) {//返回true/false
                    $.ajax({
                        url: 'user/rememberme',
                        data: '{"remember":"true"}',
                        contentType: "application/json;charset=UTF-8",
                        dataType: "json",
                        type: "post",
                        success: function (data) {
                        }
                    })
                } else {

                }
            },
            error: function (data) {
                $('#loginForm').bootstrapValidator('disableSubmitButtons', false);
                Swal.fire({
                    title: '登录失败,用户名或密码不正确!',
                    icon: 'error',
                    customClass: "sweetAlert_self",
                    // animation: 'slide-from-top',
                    position: 'top-end', //定位 左上角
                    toast: true,
                    showConfirmButton: false,
                    timer: 1500
                })
            }
        });
    });

    $('#resetBtn').click(function () {
        $('#loginForm').data('bootstrapValidator').resetForm(true);
    });
});