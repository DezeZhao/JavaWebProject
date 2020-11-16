$(function (encodedURIComponent) {
    $.cxSelect.defaults.url = 'js/vendor/cityData.min.json';
    $.cxSelect.defaults.emptyStyle = 'none';
    $('#districtInfo').cxSelect({
        url: 'js/vendor/cityData.min.json',               // 如果服务器不支持 .json 类型文件，请将文件改为 .js 文件
        selects: ['province', 'city', 'area'],  // 数组，请注意顺序
        emptyStyle: 'none'
    });

    $("#select_age").append("<option value=''>请选择年龄</option>");
    $("#select_age").append("<option value='secret'>保密</option>");
    for (var j = 1; j < 100; j++) {
        $("#select_age").append("<option value='" + j + "'>" + j + "</option>");
    }
    var validateCode_ = "";

    /**生成一个随机数**/
    function randomNum_(min, max) {
        return Math.floor(Math.random() * (max - min) + min);
    }

    /**生成一个随机色**/
    function randomColor_(min, max) {
        var r = randomNum_(min, max);
        var g = randomNum_(min, max);
        var b = randomNum_(min, max);
        return "rgb(" + r + "," + g + "," + b + ")";
    }

    drawPic_();
    document.getElementById("changeImg_").onclick = function (e) {
        validateCode_ = "";
        e.preventDefault();
        drawPic_();
    }

    /**绘制验证码图片**/
    function drawPic_() {
        var canvas = document.getElementById("canvas_");
        var width = canvas.width;
        var height = canvas.height;
        var ctx = canvas.getContext('2d');
        ctx.textBaseline = 'bottom';

        /**绘制背景色**/
        ctx.fillStyle = randomColor_(180, 240); //颜色若太深可能导致看不清
        ctx.fillRect(0, 0, width, height);
        /**绘制文字**/
        var str = 'ABCEFGHJKLMNPQRSTWXY123456789';
        for (var i = 0; i < 4; i++) {
            var txt = str[randomNum_(0, str.length)];
            validateCode_ += txt;
            ctx.fillStyle = randomColor_(50, 160);  //随机生成字体颜色
            ctx.font = randomNum_(15, 40) + 'px SimHei'; //随机生成字体大小
            var x = 10 + i * 25;
            var y = randomNum_(25, 45);
            var deg = randomNum_(-45, 45);
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
            ctx.strokeStyle = randomColor_(40, 180);
            ctx.beginPath();
            ctx.moveTo(randomNum_(0, width), randomNum_(0, height));
            ctx.lineTo(randomNum_(0, width), randomNum_(0, height));
            ctx.stroke();
        }
        /**绘制干扰点**/
        for (var i = 0; i < 80; i++) {
            ctx.fillStyle = randomColor_(0, 255);
            ctx.beginPath();
            ctx.arc(randomNum_(0, width), randomNum_(0, height), 1, 0, 2 * Math.PI);
            ctx.fill();
        }
    }

    $('#registerForm').bootstrapValidator({
        message: 'This value is not valid',
        // container:'tooltip',
        //提供输入验证图标提示
        /*  feedbackIcons: {
              valid: 'glyphicon glyphicon-ok',
              invalid: 'glyphicon glyphicon-remove',
              validating: 'glyphicon glyphicon-refresh'
          },*/
        fields: {
            username: {
                message: '必填项',
                validators: {
                    notEmpty: {
                        message: '用户名不能为空'
                    },
                    stringLength: {
                        min: 3,
                        max: 16,
                        message: '用户名长度必须在3到16之间'
                    },
                    threshold: 3,
                    remote: {//默认向服务器提交输入的数据
                        url: 'user/checkExists',
                        message: '用户名已存在',
                        delay: 10,//每10ms向服务器请求
                        type: 'POST'
                    }
                },

            },
            password: {
                message: '必填项',
                validators: {
                    notEmpty: {
                        message: '密码不能为空',
                    },
                    stringLength: {
                        min: 6,
                        max: 18,
                        message: '密码长度必须在6到18位之间'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_]+$/,
                        message: '密码只能包含大写、小写、数字和下划线'
                    }
                }
            },
            repassword: {
                message: '必填项',
                validators: {
                    notEmpty: {
                        message: '确认密码不能为空'
                    },
                    identical: {
                        field: 'password',
                        message: '确认密码和密码不一致'
                    },
                }
            },
            email: {
                message: '必填项',
                validators: {
                    emailAddress: {
                        onError: function (e, data) {
                        },
                        message: '邮箱地址无效'
                    }
                }
            },
            phoneNo: {
                message: '必填项',
                validators: {
                    numeric: {
                        message: '电话号码无效',
                    },
                    stringLength: {
                        max: 20,
                        message: "电话号码长度不能超过20"
                    }
                }
            },
            realName: {
                validators: {
                    notEmpty: {
                        enabled: false
                    },
                    stringLength: {
                        max: 16,
                        message: '姓名长度不能超过16'
                    },
                }
            },
            sex: {
                validators: {
                    choice: {
                        min: 1,
                        message: "请选择性别"
                    }
                }

            },
            age: {
                validators: {
                    notEmpty: {
                        message: "请选择年龄"
                    }
                }
            },
            province: {
                validators: {
                    notEmpty: {
                        message: "请选择省/直辖市/自治区"
                    }
                }
            },
            city: {
                validators: {
                    // feedbackIcons: disabled,
                    notEmpty: {
                        message: "请选择市/区"
                    }
                }
            },
            area: {
                validators: {
                    notEmpty: {
                        message: "请选择县",
                    }
                }
            },
            captcha: {
                validators: {
                    callback: {
                        message: '验证码不正确',
                        callback: function (value, validator) {
                            /*var code  = $("#captcha").html().text();*/
                            return value === validateCode_;
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
        // alert(jsondata['username']);
        //  alert(jsondata);
        var json = {
            'username': jsondata['username'],
            'password': jsondata['password'],
            'email': jsondata['email'],
            'phoneNo': jsondata['phoneNo'],
            'realName': jsondata['realName'],
            'age': jsondata['age'],
            'sex': jsondata['sex'],
            'address': jsondata['province'] + jsondata['city'] + jsondata['area']
        };
        // Use Ajax to submit form data 提交至form标签中的action，result自定义
        $.ajax({
            url: $form.attr('action'),
            data: JSON.stringify(json),
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            type: "post",
            success: function (data) {
                //恢复submit按钮disable状态。
                $('#registerForm').bootstrapValidator('disableSubmitButtons', false);
                Swal.fire({
                    title: data['registerMsg'],
                    icon: 'success',
                    customClass: "sweetAlert_self",
                    // animation: 'slide-from-top',
                    position: 'top-end', //定位 左上角
                    toast: true,
                    showConfirmButton: false,
                    timer: 1500
                }).then(function () {
                    window.location.href = "index.jsp"
                })
            },
            error: function (data) {

                $('#registerForm').bootstrapValidator('disableSubmitButtons', false);
                Swal.fire({
                    title: '注册失败!',
                    icon: 'success',
                    customClass: "sweetAlert_self",
                    // animation: 'slide-from-top',
                    position: 'top', //定位 左上角
                    toast: true,
                    showConfirmButton: false,
                    timer: 1500
                })
            }
        });
    });

    $('#resetBtn_').click(function () {
        $('#registerForm').data('bootstrapValidator').resetForm(true);

        $('#male').removeClass("active");
        // alert($("#male_").prop('checked'))
        $('#male_').prop('checked', false);
        $('#female').removeClass("active");
        $('#female_').prop('checked', false);
        $('#secret').removeClass("active");
        $('#secret_').prop('checked', false);
        // alert($("#male_").prop('checked'))
    });
});