<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
%>
<script type="text/javascript" src="<%=path %>/js/jquery.slimscroll.js"></script>
<div id="marquee_box" style="height: 480px">
    <div id="marquee1" class="marquee" style="">

        <a href="#" style="font-size:16px;">我校举行辅导员工作精品项目答辩评审会</a>
        <p style="font-size:14px;">7月7日，我校举行2015年辅导员工作精品项目结题答辩评审会暨2016年辅导员工作精品项目立项答辩评审会。
            各学院负责学生工作的党总支书记、副书记及学生工作部相关人员担任评委。评审会由学生工作部部长王喜春主持。</p>
        <br>
        <br>
        <br>
        <a href="#" style="font-size:16px;">于基成教授主持的《大连金普新区农产品检验检测标准体系建设》项目通过评审验收</a>
        <p style="font-size:14px;">
            7月5日，金普新区农业技术规范审查会议在我校召开。副校长段晓东，大连市质量技术监督局、金普新区市场监管局以及学校科技处、生命科学学院有关人员参加会议。我校于基成教授主持的《大连金普新区农产品检验检测标准体系建设》项目顺利通过专家组评审验收。


        </p>




    </div>
    <div id="marquee2" class="marquee" style="display:none">

        <a href="#" style="font-size:16px;">我校赴黑龙江同江市进行科研项目对接会</a>
        <br>
        <p style="font-size:14px;">
            为进一步贯彻落实中央民族工作会议精神，积极为民族地区开展科技服务，日前，我校科技开发服务中心在前期合作基础上，组织经济管理学院、计算机科学与工程学院教师赴黑龙江同江市，针对合作项目进行现场调研与对接。

        </p>
        <br>
        <br>
        <br>
        <a href="#" style="font-size:16px;">我校学子在第六届全国大学生电子商务“三创”挑战赛辽宁赛区中荣获佳绩</a>
        <p style="font-size:14px;">
            近日，第六届全国大学生电子商务“创新、创意及创业”挑战赛辽宁赛区总决赛在渤海大学落幕，我校学子荣获特等奖1项、一等奖1项、二等奖3项、三得奖5项，学校获得优秀组织奖，其中特等奖将参加全国“三创”总决赛。

        </p>

    </div>
    <div id="marquee3" class="marquee" style="display:none">
        <a href="#" style="font-size:16px;">搭建平台 全员育人 全面提升——国际商学院“2016实践季”系列活动成效显著
        </a>
        <p style="font-size:14px;">为适应当前经济社会发展对商科学生综合素质提出的核心要求，提升学生专业技能和实践能力，强化学生团队协作能力和竞争意识，国际商学院历时3个月，积极搭建学生实践平台，发挥全员育人机制，提升学生综合素质，组织开展了“2016实践季”系列活动。

        </p>
        <br>
        <br>
        <br>
        <a href="#" style="font-size:16px;">土木工程学院学生党员观看讨论习近平总书记“七·一”重要讲话

        </a>
        <p style="font-size:14px;">
            为加强党员党性修养，学习习近平总书记重要讲话精神，贯彻党的路线方针政策，7月6日晚，土木工程学院全体学生党支部书记和学生党员观看了庆祝中国共产党成立95周年大会上习近平总书记发表的重要讲话视频，并做专题讨论。



        </p>


    </div>
</div>
<script>

    $(function(){
        $('#marquee3').slimScroll({
            height: '480px'
        });
        $('.marquee').css('position', 'relative');
        $('.marquee').css('top', '0px');
    });

    var marqueeTop = 0;
    var marqueeId = 1;
    setInterval(function() {
        var marquee = $('#marquee');
        marqueeTop -= 10;
        marquee.css('top', marqueeTop + 'px');
        console.log(marqueeTop);
        marqueeId ++;
        $('.marquee').css('display', 'none');
        $('#marquee' + marqueeId).css('display', 'block');

        if (marqueeId == 3) {
            marqueeId = 0;
        }
    }, 5000);
</script>