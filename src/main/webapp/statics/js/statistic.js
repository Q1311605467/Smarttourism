$(function () {
    var path = $("#path").val();
    var data1 = $("#data1").val();
    //地区
    var myChart = echarts.init(document.getElementById('sell-main'));
    // 景区
    var myChart1 = echarts.init(document.getElementById('sell-main1'));
    var option = { //地区
        title: {
            text: '地区浏览数量统计',
            subtext: '数据库统计',
            left: 'center'
        },
        tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b} : {c} ({d}%)'
        },
        legend: {
            type: 'scroll',
            orient: 'vertical',
           // left:-100,
            right: 10,
            top: 0,
            bottom: 20,
            data: [],
            selected:{},
        },
        series: [
            {
                name: '地区浏览量',
                type: 'pie',
                radius: '55%',
                center: ['40%', '50%'],
                data: [],
                emphasis: {
                    itemStyle: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };
    var option1 = {//景区
        title: {
            text: '景区浏览数量统计',
            subtext: '数据库统计',
            left: 'center'
        },
        tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b} : {c} ({d}%)'
        },
        legend: {
            type: 'scroll',
            orient: 'vertical',
            right: -50,
            top: 0,
            bottom: 20,
            data: [],
            selected:{},
        },
        series: [
            {
                name: '景区浏览量',
                type: 'pie',
                radius: '55%',
                center: ['40%', '50%'],
                data: [],
                emphasis: {
                    itemStyle: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };
    $.ajax({
        type : "post",
        url : path+"/sys/getAreaInfo",
        datatype : "json",
        async:false,//同步
        //  [{"num":165,"name":"丽江"},{"num":28,"name":"三亚"},{"num":15,"name":"成都"},{"num":0,"name":"杭州"}]
        success : function(data1) {
            var selecteds={};
            var data=eval(data1);
            for(var i in data){
                option.series[0].data.push({value:data[i].num,name:data[i].name});
                option.legend.data.push(data[i].name);
                selecteds[data[i].name]=i<6;
            }
            option.legend.selected=selecteds;
        },
        error:function(data){//当访问时候，404，500 等非200的错误状态码
            alert("修改失败");
        }
    });
    myChart.setOption(option);


    $.ajax({
        type : "post",
        url : path+"/sys/getSceneryInfo",
        datatype : "json",
        async:false,//同步
        //  [{"num":165,"name":"丽江"},{"num":28,"name":"三亚"},{"num":15,"name":"成都"},{"num":0,"name":"杭州"}]
        success : function(data1) {
            var selecteds={};
            var data=eval(data1);
            for(var i in data){
                option1.series[0].data.push({value:data[i].num,name:data[i].name});
                option1.legend.data.push(data[i].name);
                selecteds[data[i].name]=i<6;
            }
            option1.legend.selected=selecteds;
        },
        error:function(data){//当访问时候，404，500 等非200的错误状态码
            alert("修改失败");
        }
    });
    myChart1.setOption(option1);
})
































