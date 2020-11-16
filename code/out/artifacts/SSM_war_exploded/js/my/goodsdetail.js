window.onload = function () {
    var smallBox = document.querySelector(".productImg-smallBox");
    var bigBox = document.querySelector(".productImg-bigBox");
    var bigImg = document.querySelector(".big");
    var mask = document.querySelector(".mask");
    smallBox.onmouseenter = function () {
        mask.style.opacity = 1;
        bigBox.style.display = "block";
        bigBox.style.zIndex=1;
    }
    smallBox.onmouseleave = function () {
        mask.style.opacity = 0;
        bigBox.style.display = "none";
    }
    var left = 0, top = 0;
    smallBox.onmousemove = function (event) {
        var e = event || window.event;
        left = e.clientX - this.offsetParent.offsetLeft - mask.offsetWidth / 2;
        top = e.clientY - this.offsetParent.offsetTop - mask.offsetHeight / 2;
        if (left <= 0) {
            left = 0;
        } else if (left > smallBox.offsetWidth - mask.offsetWidth) {
            left = smallBox.offsetWidth - mask.offsetWidth;
        }
        if (top <= 0) {
            top = 0;
        } else if (top > smallBox.offsetHeight - mask.offsetHeight) {
            top = smallBox.offsetHeight - mask.offsetHeight;
        }
        mask.style.left = left + "px";
        mask.style.top = top + "px";
        bigImg.style.left = -left * 2 + "px";
        bigImg.style.top = -top * 2 + "px";
    }
}

function getSubTotal(row) {
    const price = parseFloat($(row).find("#singleprice").text()); //获取单价
    const qty = parseInt($(row).find(":text").val()); //获取数量
    const result = price * qty; //计算金额小计
    $(row).find("#totalprice").text(result.toFixed(2)); //将计算好的金额小计写入到“小计”栏位中
}

$(function () {
    $(document).click(function (e) {
        const qty = $("input[name='qty']");
        var other = $(e.target).closest("#details-other");
        var val1 = qty.val();
        let val = parseInt(val1);
        if (isNaN(val) || (val < 1)) {
            val = 1;
        }

        if ($(e.target).hasClass("minus")) {
            if (val > 1) val--;
            else {
                Swal.fire({
                    title: '商品数量至少为1！',
                    icon: 'warning',
                    customClass: "sweetAlert_self",
                    // animation: 'slide-from-top',
                    position: 'top', //定位 左上角
                    toast: true,
                    showConfirmButton: false,
                    timer: 1500
                })
            }
            qty.val(val);
            getSubTotal(other);
        } else if ($(e.target).hasClass("plus")) {
            if (val < 9999) val++;
            qty.val(val);
            getSubTotal(other);
        }
    })
});