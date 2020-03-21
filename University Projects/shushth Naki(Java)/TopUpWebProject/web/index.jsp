<%@ include file="header.jsp" %> 
<!-- ******* Nav Bar end ******** -->	
<br><br><br>

<!-- ******* Slider start ******** -->
<section>
    <div class="container-fluid">
        <div class="row">
            <div id="mainSlider" class="carousel slide" data-ride="carousel" data-interval="2200">
                <ol class="carousel-indicators">
                    <li data-target="#mainSlider" data-slide-to="0" class="active"></li>
                    <li data-target="#mainSlider" data-slide-to="1"></li>
                    <li data-target="#mainSlider" data-slide-to="2"></li>

                </ol>
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="images/slider-1st.jpg" alt="" class="img-responsive">
                        <div class="carousel-caption">
                            <h1>WE CARE FOR YOUR HEALTH</h1>
                        </div>
                    </div>
                    <div class="item">
                        <img src="images/child.jpg" alt="" class="img-responsive">
                        <div class="carousel-caption">
                            <h1>WE CARE FOR YOUR HEALTH</h1>
                        </div>
                    </div>
                    <div class="item">
                        <img src="images/slider-2nd.jpg" alt="" class="img-responsive" >
                        <div class="carousel-caption">
                            <h1>WE CARE FOR YOUR HEALTH</h1>
                        </div>
                    </div>

                </div>
                <a href="#mainSlider" class="left carousel-control" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                </a>
                <a href="#mainSlider" class="right carousel-control" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                </a>
            </div>
        </div>
    </div>
</section>
<!-- ******* Slider end ******** -->

<!-- ***** Title and description section start***** -->
<div class="parallax">
    <section class="title-section">

        <div class="container">
            <div class="row">

                <div class="col-2"></div>
                <div class="col-8 text-center" id="review">
                    <h1>What's Our Client Say?? </h1>
                </div>
            </div>
        </div>
        <div class="container" id="customer">
            <div class="row">

                <div class="col-4 ">

                    <p>Lorem ipsum dolor sit amet,consectetur adipiscing elit. 
                        Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. <br>Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. 
                    </p>
                </div>
                <div class="col-4 ">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. 
                    </p>
                </div>
                <div class="col-4 ">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. 
                    </p>
                </div>
            </div>
        </div>
    </section>
</div>

<!-- ***** Title and description section end***** -->

<%@ include file="footer.jsp" %> 

</html>

