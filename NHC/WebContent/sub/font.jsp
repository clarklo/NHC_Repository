<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>


<!-- JQuery scripts -->
<script language="javascript" src="../js/fontsizer.jquery.js"></script>
<style>
.curFont { background: #EEEEF7; }
</style>
<!-- 切換 (小, 中, 大) -->
<script language="javascript">
$(document).ready(function() {
  fontResizer('13px','15px','17px');
});
</script>

 <div class="Typeface">
    <ul>
    <li><a href="#" class="largeFont">大</a></li>
    <li><a href="#" class="medFont">中</a></li>
    <li><a href="#" class="smallFont">小</a></li>
    </ul>
</div>