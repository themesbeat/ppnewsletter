<div class="panel">
	<div class="panel-heading">
		{l s='Configuration' mod='ppnewsletter'}
	</div>
	<div class="panel-body">
		<ul class="nav nav-pills">
			<li class="nav-item active">
				<a class="nav-link active" data-toggle="tab" href="#home">Configure</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="tab" href="#menu1">Design</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="tab" href="#menu2">Settings</a>
			</li>
		</ul>
		<!-- Tab panes -->
		<div class="tab-content">
			<div class="tab-pane active container" id="home">
				<form method="POST">
					<div class="form-group clearfix">
						<label for="enable_newsletter" class="control-label col-lg-3">{l s='Enable Newsletter' mod='ppnewsletter'}</label>
						<div class="col-lg-9">
							<input data-toggle="switch" class="" id="enable_newsletter" data-inverse="true" type="checkbox" name="enable_newsletter" {if $enable_newsletter eq 'on'}checked{/if} >
						</div>
					</div>
					<div class="form-group clearfix">
						<label for="newsletter_type" class="control-label col-lg-3">{l s='Newsletter Type' mod='ppnewsletter'}</label>
						<div class="col-lg-9">
							<select class="newsletter_type " class="" id="newsletter_type" name="newsletter_type" ">
								<option {if $newsletter_type eq ''}selected{/if}>Select Newsletter Type</option>
								<option value="1" {if $newsletter_type eq '1'}selected{/if}>Pop Up</option>
								<option value="2" {if $newsletter_type eq '2'}selected{/if}>Slide In</option>
								<option value="3" {if $newsletter_type eq '3'}selected{/if}>Fixed </option>
							</select>
						</div>
					</div>
					
					<div class="form-group clearfix">
						<div class="col-lg-3">
							<label for="start_date" class="control-label">{l s='Start Date' mod='ppnewsletter'}</label>
						</div>
						<div class="col-lg-9 clearfix">
							<input type="date" name="start_date" id="start_date"  class="" value="{$start_date}" />
						</div>
					</div>

					<div class="form-group clearfix">
						<div class="col-lg-3">
							<label for="end_date" class="control-label">{l s='End Date' mod='ppnewsletter'}</label>
						</div>
						<div class="col-lg-9 clearfix">
							<input type="date" name="end_date" id="end_date"  class="" value="{$end_date}" />
						</div>
					</div>
					
					
					<div class="panel-footer">
						<button type="submit" name='saveppnewsletter' class="btn btn-default pull-right">
						<i class="process-icon-save"></i>
						{l s='Save' mod='ppnewsletter'}
						</button>
					</div>
					
				</form>
			</div>
			<div class="tab-pane container" id="menu1">
				<form method="POST" enctype="multipart/form-data">
					
					<div class="row design-selector">
						<div class="col-md-12">
							<h4>Select the design for the Newsletter</h4>
						</div>
						<div class="form-group clearfix">
							<div class="col-md-3">
								<label for="newsletter_design_1" /> 								
								<input type="radio" name="newsletter_design" id="newsletter_design_1" value="1" {if $newsletter_design eq '1' }checked{/if} onclick="displayImage(this)">
								<img class="select-image" src="{_PS_BASE_URL_}/prestashop/modules/ppnewsletter/views/images/172.png" width="">

							</div>
							<div class="col-md-3">
								<label for="newsletter_design_2"  />
								  <input type="radio" name="newsletter_design" id="newsletter_design_2" value="2" {if $newsletter_design eq '2' }checked{/if} onclick="displayImage(this)">
								  <img class="select-image" src="{_PS_BASE_URL_}/prestashop/modules/ppnewsletter/views/images/164.png" width="">								
							</div>

							<div class="col-md-3">
								<label for="newsletter_design_3"  />
								  <input type="radio" name="newsletter_design" id="newsletter_design_3" value="3" {if $newsletter_design eq '3' }checked{/if} onclick="displayImage(this)">
								  <img class="select-image" src="{_PS_BASE_URL_}/prestashop/modules/ppnewsletter/views/images/166.png" width="">								
							</div>

							<div class="col-md-3">
								<label for="newsletter_design_4"  />
								  <input type="radio" name="newsletter_design" id="newsletter_design_4" value="4" {if $newsletter_design eq '4' }checked{/if} onclick="displayImage(this)">
								  <img class="select-image" src="{_PS_BASE_URL_}/prestashop/modules/ppnewsletter/views/images/168.png" width="">								
							</div>	
						</div>					
					</div>

					<div class="more-settings">
						<div class="form-group clearfix">
							<div class="col-md-3"> 
								<label > Upload Main Image </label>
							</div>
							<div class="col-md-9">		
								<input type="file" name="main_image" id="profile-img" >
								<img src="" id="profile-img-tag" name="profile-img-tag" width="200px" />
							</div>	
						</div>	

						<div class="form-group clearfix" id="image-side">
							<div class="col-md-3"> 
								<label class="image-location" for="image-location">Image Location </label>
							</div>
							<div class="col-md-9">		
								<select name="image_location" id="image-location" class="image-location">
								    <option name="image_location" value="1">Left</option>
								    <option name="image_location" value="2">Right</option>
								</select>
							</div>
						</div>

						
						<div class="form-group clearfix">
							<div class="col-md-3"> 
								<label class="t" for="jscolor"> Background Color </label>
							</div>
							<div class="col-md-9">		
								<input class="jscolor form-control form-control-lg" name="newsletter_bgcolor" value="{$newsletter_bgcolor}" type="text">
							</div>
						</div>	

						<div class="form-group clearfix">
							<div class="col-md-3"> 
								<label class="t" for="newsletter_text"> Newsletter Texts </label>
							</div>
							<div class="col-md-9">		
								 <textarea name="newsletter_text" id="newsletter_text" class="newsletter_text">{$newsletter_text}</textarea>
							       
							</div>	
						</div>	

						<div class="form-group clearfix">
							<div class="col-md-3"> 
								<label class="t" for="jscolor"> Button Background Color </label>
							</div>
							<div class="col-md-9">		
								<input class="jscolor form-control form-control-lg" name="button_bgcolor" value="{$button_bgcolor}" type="text">
							</div>
						</div>


						<div class="form-group clearfix">
							<div class="col-md-3"> 
								<label class="t" for="jscolor"> Button Text Color </label>
							</div>
							<div class="col-md-9">		
								<input class="jscolor form-control form-control-lg" name="button_text_color" value="{$button_text_color}" type="text">
							</div>
						</div>


						<div class="form-group clearfix">
							<div class="col-md-3"> 
								<label class="t" for="jscolor"> Button Hover Color </label>
							</div>
							<div class="col-md-9">		
								<input class="jscolor form-control form-control-lg" name="button_hover_color" value="{$button_hover_color}" type="text">
							</div>
						</div>


						<div class="form-group clearfix">
							<div class="col-md-3"> 
								<label class="t" for="jscolor"> Button Hover Text Color </label>
							</div>
							<div class="col-md-9">		
								<input class="jscolor form-control form-control-lg" name="button_hover_text_color" value="{$button_hover_text_color}" type="text">
							</div>
						</div>

					</div>	

					

					<div class="panel-footer">
						<button type="submit" name='saveppnewsletterdesign' class="btn btn-default pull-right">
						<i class="process-icon-save"></i>
						{l s='Save' mod='ppnewsletter'}
						</button>
					</div>
								
					

				</form>
			</div>
			<div class="tab-pane container" id="menu2">Menu2</div>
		</div>
	</div>
</div>



{literal}
<script type="text/javascript">
function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            
            reader.onload = function (e) {
                $('#profile-img-tag').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
    jQuery("#profile-img").change(function(){
        readURL(this);
    });
   
</script>

<script type="text/javascript">

$(document).ready(function(){
	tinymce.init({		
		theme : "advanced",
		selector : "textarea", 
		plugins: "textcolor paste code",
		mode : "specific_textareas",
        editor_selector :"autoload_rte"

	});
});

function displayImage(c){ 
    if(c.value == "1"){ 
	     $("#image-side").show();
    } 
    else if(c.value =="2"){ 
         $("#image-side").hide();     			
    } 
 }         

</script>
  

 
{/literal}



