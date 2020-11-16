$(function () {
    if ($('table tbody').children('tr').length == 0) {
        $('.nogoods').css('display', 'flex');
    }
    $("#cartTable").find(":checkbox").click(function () {
        //全选框单击
        if ($(this).hasClass("check-all")) {
            const checked = $(this).prop("checked");
            $("#cartTable").find(".check-one").prop("checked", checked);
        }

        //如果手工一个一个的点选了所有勾选框，需要自动将“全选”勾上或是取消
        const items = $("#cartTable").find("tr:gt(0)");
        $("#cartTable").find(".check-all").prop("checked", items.find(":checkbox:checked").length == items.length);

        getTotal();
    });

    /*
     * 计算购物车中每一个产品行的金额小计
     * 参数 row 购物车表格中的行元素tr
     */
    function getSubTotal(row) {
        const price = parseFloat($(row).find("span:first").text()); //获取单价
        const qty = parseInt($(row).find(":text").val()); //获取数量
        const result = price * qty; //计算金额小计
        $(row).find(".subtotal").text(result.toFixed(2)); //将计算好的金额小计写入到“小计”栏位中
    }

    /*
     * 计算购物车中产品的累计金额
     */
    function getTotal() {
        let qtyTotal = 0;
        let priceTotal = 0;
        $('#cartTable').find("tr:gt(0)").each(function () {
            if ($(this).find(":checkbox").prop("checked") == true) { //如果选中
                qtyTotal += parseInt($(this).find(":text").val()); //累计产品购买数量
                priceTotal += parseFloat($(this).find(".subtotal").text()); //累计产品金额
            }
        });

        $("#qtyCount").text(qtyTotal);
        $("#priceTotal").text(priceTotal.toFixed(2));
    }


    //为数量调整按钮、删除添加单击事件，计算金额小计，并更新总计
    $(document).click(function (e) {
        const closestTr = $(e.target).closest("tr");//最近祖先元素tr
        if ($(e.target).hasClass("delete")) {
            Swal.fire({
                icon: 'warning', // 弹框类型
                title: '删除订单', //标题
                text: "您确定删除该订单吗？", //显示内容
                //
                // confirmButtonColor: '#3085d6',// 确定按钮的 颜色
                confirmButtonText: '确定',// 确定按钮的 文字
                showCancelButton: true, // 是否显示取消按钮
                // cancelButtonColor: '#d33', // 取消按钮的 颜色
                cancelButtonText: "取消", // 取消按钮的 文字

                focusCancel: true, // 是否聚焦 取消按钮
                reverseButtons: true  // 是否 反转 两个按钮的位置 默认是  左边 确定  右边 取消
            }).then((isConfirm) => {
                try {
                    //判断 是否 点击的 确定按钮
                    if (isConfirm.value) {
                        $(closestTr).remove();//删除该商品
                        Swal.fire("成功", "删除订单成功！", "success");
                    } else {
                        // Swal.fire("取消", "点击了取消", "error");
                    }
                } catch (e) {
                    Swal.fire("遇到异常", "系统出现异常，未能删除该订单！", "warning");
                }
            });
        } else if ($(e.target).hasClass("emptyorders")) {//清空订单
            var cartitems = $('table tbody').children('tr').length
            if (cartitems > 0) {//购物车不空
                Swal.fire({
                    icon: 'warning', // 弹框类型
                    title: '删除所有订单', //标题
                    text: "您确定删除所有订单吗？", //显示内容
                    //
                    // confirmButtonColor: '#3085d6',// 确定按钮的 颜色
                    confirmButtonText: '确定',// 确定按钮的 文字
                    showCancelButton: true, // 是否显示取消按钮
                    // cancelButtonColor: '#d33', // 取消按钮的 颜色
                    cancelButtonText: "取消", // 取消按钮的 文字

                    focusCancel: true, // 是否聚焦 取消按钮
                    reverseButtons: true  // 是否 反转 两个按钮的位置 默认是  左边 确定  右边 取消
                }).then((isConfirm) => {
                    try {
                        //判断 是否 点击的 确定按钮
                        if (isConfirm.value) {
                            $("tbody tr").remove();
                            Swal.fire("成功", "删除所有订单成功！", "success");
                            if ($('table tbody').children('tr').length == 0) {
                                $('.noordersnoorders').css('display', 'flex');
                            }
                        } else {
                            // Swal.fire("取消", "点击了取消", "error");
                        }
                    } catch (e) {
                        // alert(e);
                        Swal.fire("遇到异常", "系统出现异常，未能删除所有订单！", "warning");
                    }
                });
            } else {
                Swal.fire({
                    title: '没有订单！',
                    icon: 'warning',
                    customClass: "sweetAlert_self",
                    // animation: 'slide-from-top',
                    position: 'top', //定位 左上角
                    toast: true,
                    showConfirmButton: false,
                    timer: 1500
                })
            }
        }

        getTotal();
    });
});