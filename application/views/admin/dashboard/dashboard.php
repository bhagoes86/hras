<div class="col-md-12 col-sm-12 col-xs-12 main post-inherit">
    <div class="x_panel post-inherit">
        
        <!-- Indicates a successful or positive action -->

        <div class="strong">
            <h1>Human Resources Administration System</h1>
            <h4><p>PT. Sumber Alfaria Trijaya, Tbk - Branch <span class="cap"><?php echo $setting_branch['setting_value'] ?></span></p><h4>
            <p>Web Based Application </p>
            <br>
            <br>
            
            <img width=380 height=320 src="<?php echo media_url() ?>/images/logo.jpg" alt="">
  
            <br><br><br>
            <br>
            <strong><?php echo $this->session->userdata('user_full_name'); ?> (<?php echo $this->session->userdata('user_name'); ?>) </strong>
            <br>
            <?php echo pretty_date(date('Y-m-d'), 'l, d F Y',FALSE) ?> 
        </div>
    </div>
</div>
<style type="text/css">
   .upper { text-transform: uppercase; }
   .lower { text-transform: lowercase; }
   .cap   { text-transform: capitalize; }
   .small { font-variant:   small-caps; }
    </style>