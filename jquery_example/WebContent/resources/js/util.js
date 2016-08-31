/**
 * 2014-06-15 
 */
$(function() {
    $.datepicker.regional['ko'] = {
        closeText: '닫기',
        prevText: '이전달',
        nextText: '다음달',
        currentText: '오늘',
        monthNames: ['1월','2월','3월','4월','5월','6월',
        '7월','8월','9월','10월','11월','12월'],
        monthNamesShort: ['1월','2월','3월','4월','5월','6월',
        '7월','8월','9월','10월','11월','12월'],
        dayNames: ['일','월','화','수','목','금','토'],
        dayNamesShort: ['일','월','화','수','목','금','토'],
        dayNamesMin: ['일','월','화','수','목','금','토'],
        weekHeader: 'Wk',
        dateFormat: 'yy-mm-dd',
        firstDay: 0,
        isRTL: false,
        duration:200,
        showAnim:'show',
        showMonthAfterYear: true,
        yearSuffix: '년'};
    	$.datepicker.setDefaults($.datepicker.regional['ko']);
});
jQuery.fn.extend({
    /**
     * 숫자만 입력 가능하도록 처리
     */

    numberOnly : function() {
        return this.each(function() {
            try {
                var $this = $(this);

                // FF patch : 한글입력 상태에서 keydown 입력 제한이 안걸리는 문제가 있어 한글 입력 불가능하도록 설정

                $this.css('ime-mode', 'disabled');
                // 숫자,콤마,backspace,enter key만 입력 가능하도록 제한

                $this.keydown(function(p_event) {
                    var l_before_length = $this.val().length;
                    var l_keycode = p_event.keyCode;
                    var l_str     = l_keycode > 57 ? String.fromCharCode(l_keycode-48) : String.fromCharCode(l_keycode);
                    var l_pattern = /^[0-9]+$/;
                    // back-space, tab-key enter-key, delete-key, ←, ↑, →, ↓는 입력 가능하도록 함
                    if(l_keycode == 8 || l_keycode == 9 || l_keycode == 13 || l_keycode == 46 || l_keycode == 37 || l_keycode == 38 || l_keycode == 39 || l_keycode == 40){
                    	return true;
                	}
                    
                    if(l_keycode == 110 || l_keycode == 190) {
                    	if($this.val().indexOf(".")<0)
                    		return true;
                    }
                    
                    // 소수 둘째자리 까지만 입력 가능
                    if($this.val().indexOf(".")>-1){
                		if($this.val().split(".")[1].length>1)
                		return false;
                	}

                    // 숫자만 입력 가능하도록 함
                    var l_after_length = $this.val().length;
                    if(!l_pattern.test(l_str)) {
                        if(l_before_length != l_after_length) {
                            $this.val($this.val().substring(0, l_after_length - 1));
                        }
                        return false;
                    } else {
                        return true;
                    }
                });
                // 포커스를 얻어을 때 처리 - number format을 위한 콤마를 모두 제거한다.
                $this.focus(function() {
                    $this.val($this.val().replace(/,/g, ''));
                });
            } catch(e) {
                alert("[jsutil.js's numberFormat] " + e.description);
            }
        });
    },

	chk_valid : function (){
		 var chkFlag = true;

		 this.each(function() {
			 $("input:text").each(function(){
				 if($(this).prop("required")==""){
					 var strVal = $.trim($(this).val());
					 if(strVal.length==0){
						 alert("["+$(this).prop("title")+"]은(는) 필수입력 항목입니다.");
						 $(this).focus();
						 chkFlag = false;
						 return chkFlag;
					 }
				 }
			 });
			 
			 return chkFlag;
		 });
	},

	fn_onload : function(){
		$("input:text").each(function(){
	
			if($(this).attr("readOnly")==undefined){
				$(this).focus();
				return false;
			}
		});
	}
});

