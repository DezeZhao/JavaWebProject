/*改变所购商品的数量*/
function changeNum(numId, flag) {/*numId表示对应商品数量的文本框ID，flag表示是增加还是减少商品数量*/
    var numId = document.getElementById(numId);
    if (flag == "minus") {/*减少商品数量*/
        if (numId.value <= 1) {
            alert("宝贝数量必须是大于0");
            return false;
        } else {
            numId.value = parseInt(numId.value) - 1;
            productCount();
        }
    } else {/*flag为add，增加商品数量*/
        numId.value = parseInt(numId.value) + 1;
        productCount();
    }
}

/*复选框全选或全不选效果*/
function selectAll() {
    var oInput = document.getElementsByName("cartCheckBox");
    for (var i = 0; i < oInput.length; i++) {
        oInput[i].checked = document.getElementById("allCheckBox").checked;
    }
}

/*根据单个复选框的选择情况确定全选复选框是否被选中*/
function selectSingle() {
    var k = 0;
    var oInput = document.getElementsByName("cartCheckBox");
    for (var i = 0; i < oInput.length; i++) {
        if (oInput[i].checked == false) {
            k = 1;
            break;
        }
    }
    if (k == 0) {
        document.getElementById("allCheckBox").checked = true;
    } else {
        document.getElementById("allCheckBox").checked = false;
    }
}



