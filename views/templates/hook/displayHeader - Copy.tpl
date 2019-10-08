{*
 * 2017-2018 PrestaPatron
 *
 * PrestaPatron Announcement Block
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the General Public License (GPL 2.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/GPL-2.0
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade the module to newer
 * versions in the future.
 *
 *  @author    PrestaPatron
 *  @copyright 2017-2018 PrestaPatron
 *  @license   http://opensource.org/licenses/GPL-2.0 General Public License (GPL 2.0)
*}


{$image_location}

<style type="text/css">
#popup-box {
	background: #{$newsletter_bgcolor};
}

#popup-box button {
	background: #{$button_bgcolor};
	color: #{$button_text_color};
}

#popup-box button:hover {
	background: #{$button_hover_color};
	color: #{$button_hover_text_color};
}

.type2 {
    border-top: 10px solid #{$button_bgcolor};
}



</style>



{if $page.page_name =="index"}

{$today = $smarty.now|date_format:'%Y-%m-%d'}
{if $enable_newsletter && $start_date <= $today && $end_date >= $today }
	{if $newsletter_type == 1 && $newsletter_design == 1}

	{if $image_location == 1}
	<div id="list-builder"></div>
	<div id="popup-box" class="type1">
	    <img src="http://localhost/prestashop/modules/ppnewsletter/views/images/cancel.png" id="popup-close" />
	    <div id="popup-box-content">
	    	<div class="col-sm-6 left-col">
	    		<img class="left-image" src="{$main_image}" alt="main image">
	    	</div>
	    	<div class="col-sm-6 right-col">
	    		<div id="newsletter_text">{$newsletter_text nofilter}</div>
				
		        <form id="popup-form" action="http://localhost/prestashop/module/ppnewsletter/submit" onsubmit="return validate();" method="POST">		        	
		            <input type="text" name="fname"  id="fname" placeholder="Full Name" />
		            <input type="email" name="email" id="email" placeholder="Email Address" />		            
		            <button type="submit" name="subscribe">Subscribe</button>	
		           	<span id="error_para" ></span>     
		        </form>
					
	    	</div>
	    </div>
	</div>	
	{elseif $image_location == 2}
		<div id="list-builder"></div>
		<div id="popup-box" class="type1">
		    <img src="http://localhost/prestashop/modules/ppnewsletter/views/images/cancel.png" id="popup-close" />
		    <div id="popup-box-content">	    	
		    	<div class="col-sm-6 right-col">
		    		<div id="newsletter_text">{$newsletter_text nofilter}</div>
					
			        <form id="popup-form" action="http://localhost/prestashop/module/ppnewsletter/submit" onsubmit="return validate();" method="POST">		        	
			            <input type="text" name="fname"  id="fname" placeholder="Full Name" />
			            <input type="email" name="email" id="email" placeholder="Email Address" />		            
			            <button type="submit" name="subscribe">Subscribe</button>	
			           	<span id="error_para" ></span>     
			        </form>
						
		    	</div>
		    	<div class="col-sm-6 left-col">
		    		<img class="left-image" src="{$main_image}" alt="main image">
		    	</div>
		    </div>
		</div>
	{/if}
	{/if}

	{if $newsletter_type == 1 && $newsletter_design == 2}
	<div id="list-builder"></div>
	<div id="popup-box" class="type2">
	    <img src="http://localhost/prestashop/modules/ppnewsletter/views/images/cancel.png"  id="popup-close" />
	    <div id="popup-box-content">	    	
	    	<div class="col-sm-12 right-col">
	    		<div id="newsletter_text">{$newsletter_text nofilter}</div>
				
		        <form id="popup-form" action="http://localhost/prestashop/module/ppnewsletter/submit"  onsubmit="return validate();" method="POST">
		            <input type="hidden" name="list" value="key_list_etc" />
		          <!--   <input type="text" name="name" placeholder="Full Name" /> -->
		            <input type="text" name="email" placeholder="Email Address" />
		            <button type="submit" name="subscribe">Subscribe</button>		
		            <p id="error_para" ></p>
	        		<p class="spam">We hate SPAM as much as you do and you can unsubscribe anytime.</p>           
		        </form>
	    	</div>
	    </div>
	</div>
	{/if}


	{if $newsletter_type == 1 && $newsletter_design == 3}
	<div id="list-builder"></div>
	<div id="popup-box" class="type3">
	    <img src="http://localhost/prestashop/modules/ppnewsletter/views/images/cancel.png" id="popup-close" />
	    <div id="popup-box-content">
	    	<div class="top-row">
	    		<img class="left-image" src="{$main_image}" alt="main image">
	    	</div>
	    	<div class="bottom-row">
	    		<div id="newsletter_text">{$newsletter_text nofilter}</div>
				
		        <form id="popup-form" action="http://localhost/prestashop/module/ppnewsletter/submit" onsubmit="return validate();" method="POST">		        	
		            
		            <input type="email" name="email" id="email" placeholder="Email Address" />		            
		            <button type="submit" name="subscribe">Subscribe</button>	
		           	<span id="error_para" ></span>     
		        </form>
					
	    	</div>
	    </div>
	</div>
	{/if}


	

{/if}
{/if}


{literal}
<script type="text/javascript">
function validate()
{
 var error="";
 var name = document.getElementById( "fname" );
 if( name.value == "" )
 {
  error = " You Have To Write Your Name. ";
  document.getElementById( "error_para" ).innerHTML = error;
  return false;
 }

 var email = document.getElementById( "email" );
 if( email.value == "" || email.value.indexOf( "@" ) == -1 )
 {
  error = " You Have To Write Valid Email Address. ";
  document.getElementById( "error_para" ).innerHTML = error;
  return false;
 }


 else
 {
  return true;
 }
}
</script>
{/literal}