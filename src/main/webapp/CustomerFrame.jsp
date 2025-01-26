<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>MeteorEyewear</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Meteor</title>
    <link rel="stylesheet" href="home.css" />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Jost:wght@100;200;300;400;500;600;700&display=swap"
      rel="stylesheet"
    />

    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
      integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />

    <link
      rel="stylesheet"
      href="https://unpkg.com/boxicons@latest/css/boxicons.min.css"
    />
    <style>
      /* Reset default margins and paddings */
      * {
        font-family: "Jost", sans-serif;
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        outline: none;
        border: none;
        text-decoration: none;
        text-transform: uppercase;
        transition: all 0.2s linear;
      }

      html,
      body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        height: 100%; /* Ensures body spans the viewport height */
        color: white;
        background-color: #eaeae1;
        display: flex;
        flex-direction: column;
        font-size: 60%;
        scroll-padding-top: 6rem;
        scroll-behavior: smooth;
      }

      /* Wrapper to manage header, main content, and footer */
      .wrapper {
        display: flex;
        flex-direction: column;
        min-height: 100vh; /* Makes the wrapper span the full height of the viewport */
      }

      main {
        flex: 1; /* Ensures the main content fills available space */
        padding: 20px;
        display: flex; /* Enable flexbox */
        justify-content: center; /* Center horizontally */
        align-items: center; /* Center vertically */
        text-align: center;
        color: black;
        background-color: #eaeae1; /* Optional: Ensure the background is visible */
      }

      header {
        background-color: #662200;
        padding: 10px 20px;
      }

      header .navbar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-family: monospace;
      }

      header .navbar .menu a {
        margin: 0 15px;
        text-decoration: none;
        color: white;
        font-size: 20px;
        font-weight: bold;
      }

      header .navbar .menu a:hover {
        color: #e64d00;
      }

      header .navbar .profile img {
        height: 30px;
        border-radius: 50%;
        margin-left: 8px;
      }

      .main_container {
        max-width: 114rem;
        margin: 0 auto;
        padding: 0rem 1rem;
        padding-top: 8em;
      }

      .capal_logo {
        height: 30px;
        width: 100%;
      }

      .point {
        text-align: center;
        margin-bottom: 10px;
      }

      .point img {
        height: 40px;
      }

      .capal_logo_white {
        height: 30px;
        width: 100%;
        padding-right: 50px;
      }

      #menu-bar {
        font-size: 2rem;
        padding: 0.5rem 1rem;
        border: 0.1rem solid #000;
        color: #000;
        border-radius: 0.3rem;
        cursor: pointer;
        display: none;
      }
      /* end header  */

      section {
        padding: 2rem 9%;
      }
      .home {
        padding: 0;
        position: relative;
      }
      .home .slide-container .slide {
        min-height: 100vh;
        display: flex;
        align-items: center;
        flex-wrap: wrap;
        gap: 1.5rem;
        padding: 0 9%;
        padding-top: 9rem;
      }
      .home .slide-container .slide .content {
        flex: 10 1 40rem;
        animation: slideContent 0.3s linear 1s backwards;
      }
      @keyframes slideContent {
        0% {
          opacity: 0;
          transform: translateX(-10rem);
        }
      }
      .home .slide-container .slide .image {
        flex: 1 1 50rem;
        padding-bottom: 15rem;
        position: relative;
        z-index: 0;
      }
      .home .slide-container .slide .image .shoe {
        width: 90%;
        transform: rotate(-10deg);
        animation: shoe 0.3s linear;
      }
      @keyframes shoe {
        0% {
          transform: rotate(0deg) scale(0.5);
        }
      }
      .home .slide-container .slide .content span {
        font-size: 2rem;
        color: orangered;
      }
      .home .slide-container .slide .content h3 {
        font-size: 5rem;
        color: #000;
      }
      .home .slide-container .slide .content p {
        font-size: 1.7rem;
        color: #666;
        padding: 0.5rem 0;
      }
      .btn {
        display: inline-block;
        margin-top: 1rem;
        border-radius: 0.5rem;
        border: 0.2rem solid #000;
        font-weight: bolder;
        font-size: 1.7rem;
        color: #000;
        cursor: pointer;
        background: #fff;
        padding: 0.8rem 3rem;
      }

      .home .slide-container {
        display: none;
      }
      .home .slide-container.active {
        display: block;
      }
      .home #prev,
      .home #next {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        z-index: 100;
        height: 5rem;
        width: 5rem;
        line-height: 5.5rem;
        font-size: 2rem;
        color: #000;
        border: 0.2rem solid #000;
        border-radius: 50%;
        text-align: center;
        cursor: pointer;
      }
      .home #prev:hover,
      .home #next:hover {
        color: #fff;
        background: orangered;
      }
      .home #prev {
        left: 5rem;
      }
      .home #next {
        right: 5rem;
      }
      /* end home  */
      .heading {
        text-align: center;
        font-size: 3rem;
        padding: 10px;
        font-weight: bolder;
        text-transform: uppercase;
      }
      .heading span {
        margin-left: 5px;
        color: seagreen;
      }
      .product .box-container {
        display: flex;
        flex-wrap: wrap;
        gap: 1.5rem;
      }
      .product .box-container .box {
        border: 0.1rem solid rgba(0, 0, 0, 0.1);
        border-radius: 0.5rem;
        text-align: center;
        position: relative;
        overflow: hidden;
        background: #f5f5f5;
        flex: 1 1 30rem;
      }
      .product .box-container .content {
        padding: 1.5rem;
      }
      .product .box-container .box img {
        height: 20rem;
        transform: rotate(-35deg);
        margin: 8rem 2rem;
      }
      .product .box-container .box:hover img {
        transform: rotate(-35deg) scale(1.2);
      }
      .product .box-container .box .icons {
        display: flex;
        flex-flow: column;
        position: absolute;
        top: 0.5rem;
        left: 1rem;
      }
      .product .box-container .box .icons a {
        height: 4.5rem;
        width: 5rem;
        line-height: 4.5rem;
        font-size: 2rem;
        color: #000;
        border: 0.1rem solid #000;
        border-radius: 0.5rem;
        background: #fff;
        margin-top: 0.5rem;
      }
      .product .box-container .box .icons {
        display: flex;
        flex-flow: column;
        position: absolute;
        top: 0.5rem;
        left: -10rem;
      }
      .product .box-container .box:hover .icons {
        left: 1rem;
      }
      .product .box-container .box .icons a:hover {
        color: orangered;
        color: #fff;
      }
      .product .box-container .box .content h3 {
        color: #000;
        font-size: 2.5rem;
      }
      .product .box-container .box .content .price {
        color: #000;
        font-size: 2.5rem;
        font-weight: bolder;
        padding: 1rem 0;
      }
      .product .box-container .box .content .price span {
        color: #000;
        font-size: 1.5rem;
        text-decoration: line-through;
      }
      .product .box-container .box .content .stars {
        padding-bottom: 1rem;
      }
      .product .box-container .box .content .stars i {
        font-size: 1.7rem;
        color: orangered;
      }
      /* end product  */
      .featured .row {
        display: flex;
        flex-wrap: wrap;
        gap: 1.5rem;
        border: 0.1rem solid rgba(0, 0, 0, 0.1);
        border-radius: 0.5rem;
        background: #f9f9f9;
        padding: 2rem;
        align-items: center;
        margin: 1.5rem 0;
      }
      .featured .row .content {
        flex: 1 1 40rem;
      }
      .featured .row .image-container {
        display: flex;
        gap: 1.5rem;
        align-items: center;
        flex: 1 1 50rem;
      }
      .featured .row .image-container .small-image {
        width: 20%;
      }
      .featured .row .image-container .big-image {
        width: 80%;
        padding: 1rem;
      }
      .featured .row .image-container .small-image img {
        width: 100%;
        padding: 1rem;
        border: 0.1rem solid rgba(0, 0, 0, 0.1);
        cursor: pointer;
      }
      .featured .row .image-container .small-image img:hover {
        background: #ccc;
      }
      .featured .row .image-container .big-image img {
        width: 100%;
      }
      .featured .row .image-container .big-image img:hover {
        transform: scale(1.05);
      }
      .featured .row .content h3 {
        font-size: 2.5rem;
        color: #000;
      }
      .featured .row .content .stars i {
        font-size: 1.7rem;
        color: aqua;
        padding: 0.5rem 0;
      }
      .featured .row .content p {
        font-size: 1.5rem;
        color: #666;
        padding: 1rem 0;
      }
      .featured .row .content .price {
        font-size: 2.5rem;
        color: #000;
        font-weight: bolder;
      }
      .featured .row .content .price span {
        font-size: 1.5rem;
        color: orange;
        text-decoration: line-through;
      }
      /* end featured  */
      .blog .box-container {
        display: flex;
        flex-wrap: wrap;
        gap: 1.5rem;
      }
      .blog .box-container .box {
        flex: 1 1 30rem;
        text-align: center;
        border: 0.1rem solid rgba(0, 0, 0, 0.1);
        border-radius: 0.5rem;
        background: #f9f9f9;
        padding: 2rem;
      }
      .blog .box-container .box img {
        border-radius: 50%;
        object-fit: cover;
        height: 15rem;
        width: 15rem;
        margin: 1rem 0;
        border: 4px solid #ddd;
      }
      .blog .box-container .box img:hover {
        transform: scale(1.2);
      }
      .blog .box-container .box h3 {
        font-size: 2.5rem;
        color: #000;
      }
      .blog .box-container .box p {
        font-size: 1.6rem;
        color: #666;
        padding: 1rem 0;
      }
      .blog .box-container .box .emotes i {
        color: black;
        font-size: 5rem;
      }
      /* end blog  */
      .news {
        padding-top: 0.5rem;
        padding-bottom: 0.5rem;
      }
      .news .content {
        text-align: center;
        border: 0.1rem solid rgba(0, 0, 0, 0.1);
        border-radius: 0.5rem;
        background: #f9f9f9;
        padding: 2rem;
      }
      .news .content h3 {
        font-size: 2.5rem;
        color: #000;
      }
      .news .content p {
        font-size: 1.5rem;
        color: #666;
        margin: 1rem auto;
        max-width: 60rem;
      }
      .news .content form {
        margin: 1rem auto;
        max-width: 50rem;
        display: flex;
      }

      .news .content form .email {
        width: 100%;
        font-size: 1.7rem;
        text-transform: none;
        color: #333;
        padding: 1rem;
        border: 0.2rem solid #000;
        border-right: none;
        margin-top: 1rem;
      }
      .news .content form .btn {
        border-radius: none;
      }

      footer {
        display: flex;
        justify-content: space-around;
        padding: 20px;
        background-color: #662200;
        color: white;
        font-family: monospace;
        position: relative; /* Adjusted position to avoid conflicts with fixed */
        margin-top: auto; /* Ensures footer stays at the bottom */
      }

      footer .footer-section h4 {
        margin-bottom: 10px;
        font-size: 20px;
      }

      footer .footer-section ul {
        list-style: none;
        padding: 0;
      }

      footer .footer-section ul li {
        margin-bottom: 5px;
      }

      footer .footer-section ul li a {
        text-decoration: none;
        color: white;
      }

      footer .footer-section ul li a:hover {
        color: #ff6600;
        transform: scale(1.02);
      }

      footer form input {
        padding: 5px;
        margin-right: 10px;
      }

      footer form button {
        padding: 5px 10px;
        background-color: #f90;
        color: white;
        border: none;
        cursor: pointer;
      }
    </style>
  </head>
  <body>
    <div class="wrapper">
      <!-- Header Section -->
      <header>
        <div class="navbar">
          <div class="logo">
            <a href="index.jsp">
              <img
                src="images/logo.jpg"
                alt="Logo"
                style="height: 50px; border-radius: 50%"
              />
            </a>
          </div>
          <div class="menu">
            <a href="#">FRAME</a>
            <a href="#">LENS</a>
            <a href="spectacleProfile.jsp">SPECTACLE PROFILE</a>
            <a href="OrderDetails.jsp">ORDER</a>
          </div>
          <div class="profile">
            <img src="images/profile.png" alt="Profile" />
          </div>
        </div>
      </header>

      <section class="home" id="home">
        <div class="slide-container active">
          <div class="slide">
            <div class="content">
              <span>GUESS</span>
              <h3>GUESS SP 5766</h3>
              <p>
                Guess glasses combine luxury and style with a timeless design.
                Crafted with high-quality materials, they offer a blend of
                sophistication and modern flair. Known for their bold,
                distinctive frames and iconic logo, Gucci eyewear is the perfect
                accessory to elevate any outfit, providing both comfort and
                fashion-forward appeal. Whether you prefer classic or
                contemporary styles, Gucci glasses make a statement with their
                exceptional craftsmanship and attention to detail.
              </p>
              <a href="" class="btn">SHOP NOW</a>
            </div>
            <div class="image">
              <img src="images/1.1.jpg" alt="FRAME IMAGE" class="shoe" />
            </div>
          </div>
        </div>
        <div class="slide-container">
          <div class="slide">
            <div class="content">
              <span><!--product brand--></span>
              <h3><!--product name--></h3>
              <p>
                <!--product description-->
              </p>
              <a href="" class="btn">SHOP NOW</a>
            </div>
            <div class="image">
              <img src="images/new1.jpg" alt="FRAME IMAGE" class="shoe" />
            </div>
          </div>
        </div>
        <div class="slide-container">
          <div class="slide">
            <div class="content">
              <span><!--product brand--></span>
              <h3><!--product name--></h3>
              <p>
                <!--product description-->
              </p>
              <a href="#" class="btn">SHOP NOW</a>
            </div>
            <div class="image">
              <img src="images/new1.jpg" alt="FRAME IMAGE" class="shoe" />
            </div>
          </div>
        </div>
        <div class="slide-container">
          <div class="slide">
            <div class="content">
              <span><!--product brand--></span>
              <h3><!--product name--></h3>
              <p>
                <!--product description-->
              </p>
              <a href="#" class="btn">SHOP NOW</a>
            </div>
            <div class="image">
              <img src="images/new1.jpg" alt="FRAME IMAGE" class="shoe" />
            </div>
          </div>
        </div>

        <div id="prev" class="fa fa-angle-left" onclick="prev();"></div>
        <div id="next" class="fa fa-angle-right" onclick="next();"></div>
      </section>
      <!--end home-->
      <section class="product" id="product">
        <div class="point"><img src="img/CAPAL2ND.png" alt="" /></div>

        <h1 class="heading">HOT<span>Products</span></h1>
        <div class="box-container">
          <div class="box">
            <div class="content">
              <img src="images/h1.jpg" alt="FRAME IMAGE" />
              <h3>RAYBAN</h3>
              <div class="price">RM323<span>RM539</span></div>
              <div class="stars">
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
              </div>
            </div>
          </div>
          <div class="box">
            <div class="content">
              <img src="images/h2.png" alt="FRAME IMAGE" />
              <h3>COACH</h3>
              <div class="price">RM349<span>RM689</span></div>
              <div class="stars">
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
              </div>
            </div>
          </div>
          <div class="box">
            <div class="content">
              <img src="images/h3.jpg" alt="FRAME IMAGE" />
              <h3>SHINAYAKANA</h3>
              <div class="price">RM198<span>RM220</span></div>
              <div class="stars">
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
              </div>
            </div>
          </div>
          <div class="box">
            <div class="content">
              <img src="images/h4.jpg" alt="FRAME IMAGE" />
              <h3>TANOSHI</h3>
              <div class="price">RM100<span>RM168</span></div>
              <div class="stars">
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
              </div>
            </div>
          </div>
          <div class="box">
            <div class="content">
              <img src="images/h5.jpg" alt="FRAME IMAGE" />
              <h3>VOGUE</h3>
              <div class="price">RM370<span>RM369</span></div>
              <div class="stars">
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
              </div>
            </div>
          </div>
          <div class="box">
            <div class="content">
              <img src="images/h6.png" alt="FRAME IMAGE" />
              <h3>WHOOSH</h3>
              <div class="price">RM660<span>RM800</span></div>
              <div class="stars">
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!--end product-->
      <section class="featured" id="featured">
        <h1 class="heading">NEW<span>ARRIVAL</span></h1>
        <div class="row">
          <div class="image-container">
            <div class="small-image">
              <img
                src="images/new1.1.jpg"
                alt="FRAME IMAGE"
                class="featured-image-1"
              />
              <img
                src="images/new1.2.jpg"
                alt="FRAME IMAGE"
                class="featured-image-1"
              />
            </div>
            <div class="big-image">
              <img
                src="images/new1.1.jpg"
                alt="FRAME IMAGE"
                class="big-image-1"
              />
            </div>
          </div>
          <div class="content">
            <h3>WHOOSH</h3>
            <div class="stars">
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
            </div>
            <p>
              a unique and stylish brand name often associated with premium
              design and high functionality. If this is for a spectacle brand,
              it can represent a line of eyewear that combines fashion and
              practicality, offering features tailored for all conditions.
            </p>
            <div class="price">RM352<span>RM440</span></div>
            <a href="#" class="btn">add to cart</a>
          </div>
        </div>
        <div class="row">
          <div class="image-container">
            <div class="small-image">
              <img
                src="images/new4.1.jpeg"
                alt="FRAME IMAGE"
                class="featured-image-2"
              />
              <img
                src="images/new4.jpg"
                alt="FRAME IMAGE"
                class="featured-image-2"
              />
            </div>
            <div class="big-image">
              <img
                src="images/new4.jpg"
                alt="FRAME IMAGE"
                class="big-image-2"
              />
            </div>
          </div>
          <div class="content">
            <h3>JAGUAR</h3>
            <div class="stars">
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
            </div>
            <p>
              a stylish and sophisticated spectacle model from the renowned
              fashion brand GUESS. This model is designed to reflect the brand's
              signature style, blending modern aesthetics with timeless
              elegance.
            </p>
            <div class="price">RM439<span>RM450</span></div>
            <a href="#" class="btn">add to cart</a>
          </div>
        </div>
        <div class="row">
          <div class="image-container">
            <div class="small-image">
              <img
                src="images/new6.jpg"
                alt="FRAME IMAGE"
                class="featured-image-3"
              />
              <img
                src="images/new6.1.jpeg"
                alt="FRAME IMAGE"
                class="featured-image-3"
              />
            </div>
            <div class="big-image">
              <img
                src="images/new6.jpg"
                alt="FRAME IMAGE"
                class="big-image-3"
              />
            </div>
          </div>
          <div class="content">
            <h3>ASHLEY SP 9331</h3>
            <div class="stars">
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
            </div>
            <p>
              a sophisticated and trendy brand name that exudes elegance and
              modernity. If it's associated with a spectacle line, it could
              represent stylish eyewear designed for individuals who seek both
              fashion and functionality in their accessories.
            </p>
            <div class="price">RM412<span>RM589</span></div>
            <a href="#" class="btn">add to cart</a>s
          </div>
        </div>
      </section>
      <!--end featured-->

      <!--<section class="blog" id="blog">
            <h1 class="heading">Team<span>Weblog</span></h1>
            <div class="box-container">
                <div class="box">
                    <img src="img/team/1.png" alt="">
                    <h3>Muhammad Yazid</h3>
                    <p>
                        our proud leader,yazid give instruction in designing the whole website,handing works
                        to group members,designing the product page and product detail,ensuring an eye catching experience and comprehensive information about a specific product for the user. 
                    </p>
                    <div class="emotes">
                        <i class='bx bx-cool'></i>
                    </div>
                </div>
                <div class="box">
                    <img src="img/team/2.png" alt="">
                    <h3>Muhammad Zarul</h3>
                    <p>
                        Zarul's role involves creating a secure and user-friendly login interface where users can enter their credentials to access their accounts and feedback page is where users can provide their comments,suggestions or concerns about the website.
                    </p>
                    <div class="emotes">
                        <i class='bx bxs-dizzy'></i>
                    </div>
                </div>
                <div class="box">
                    <img src="img/team/3.png" alt="">
                    <h3>Ammar Yusuf</h3>
                    <p>
                        Ammar's design the add-to-cart page to ensure it is user-friendly,visually appealing,functional,making it easy for customers to finalize their select items to purchase,allowing users to add them to their shopping cart before proceeding to checkout.
                    </p>
                    <div class="emotes">
                        <i class='bx bx-happy-heart-eyes'></i>
                    </div>
                </div>
                <div class="box">
                    <img src="img/team/3.png" alt="">
                    <h3>Adib Syahmi</h3>
                    <p>
                        Adib create an engaging and user-friendly homepage that effectively communicates the brand's message,showcases important content or products and guides users to explore further sections of the website,providing an overview of the content, features, and navigation options available on the site.
                    </p>
                    <div class="emotes">
                        <i class='bx bxs-skull'></i>
                    </div>
                </div>
            </div>
        </section>-->
      <!--end blog-->
      <section class="news" id="news">
        <div class="content">
          <h3>monthly news letter</h3>
          <p>Let us tell you our secret!</p>
          <form action="">
            <input
              type="email"
              placeholder="please enter your email"
              class="email"
            />
            <input type="submit" value="save" class="btn" />
          </form>
        </div>
      </section>

      <!-- Footer Section -->
      <footer>
        <div class="footer-section">
          <h4>Contact Us</h4>
          <p>
            METEOR EYEWEAR<br />Jc 2.G, Jalan Bmu 1,<br />Bandar Baru Merlimau
            Utara,<br />Merlimau 77300, Melaka
          </p>
          <p>+606-263-1175</p>
          <p>Email: merlimau@meteor-eyewear.com</p>
        </div>
        <div class="footer-section">
          <h4>About Us</h4>
          <ul>
            <li><a href="about.jsp">About Us</a></li>
            <li><a href="store.jsp">Our Store</a></li>
          </ul>
        </div>
        <div class="footer-section">
          <h4>Help</h4>
          <ul>
            <li><a href="#contact">Contact Us</a></li>
            <li><a href="#terms">Terms of Use</a></li>
            <li><a href="#privacy">Privacy Policy</a></li>
          </ul>
        </div>
        <div class="footer-section">
          <h4>Be In Touch With Us</h4>
          <p>
            Subscribe to our newsletter for the latest updates and promo codes.
          </p>
          <form>
            <br />
            <input class="footer-input" type="email" placeholder="Your Email" />
            <button class="footer" type="submit">Subscribe</button>
          </form>
        </div>
      </footer>
    </div>

    <script>
      document.addEventListener("DOMContentLoaded", () => {
        // Menu toggle logic
        const menu = document.querySelector("#menu-bar");
        const navbar = document.querySelector(".navbar");

        if (menu && navbar) {
          menu.onclick = () => {
            menu.classList.toggle("fa-times");
            navbar.classList.toggle("active");
          };
        }

        // Slideshow logic
        const slides = document.querySelectorAll(".slide-container");
        let index = 0;

        if (slides.length > 0) {
          function next() {
            slides[index].classList.remove("active");
            index = (index + 1) % slides.length;
            slides[index].classList.add("active");
          }

          function prev() {
            slides[index].classList.remove("active");
            index = (index - 1 + slides.length) % slides.length;
            slides[index].classList.add("active");
          }

          // Attach next/prev functions to buttons (if any)
          const nextButton = document.querySelector("#next-slide"); // Example button ID
          const prevButton = document.querySelector("#prev-slide"); // Example button ID

          if (nextButton) nextButton.onclick = next;
          if (prevButton) prevButton.onclick = prev;
        }

        // Featured image click logic
        const bigImage1 = document.querySelector(".big-image-1");
        const bigImage2 = document.querySelector(".big-image-2");
        const bigImage3 = document.querySelector(".big-image-3");

        if (bigImage1) {
          document.querySelectorAll(".featured-image-1").forEach((image) => {
            image.addEventListener("click", () => {
              const src = image.getAttribute("src");
              bigImage1.src = src;
            });
          });
        }

        if (bigImage2) {
          document.querySelectorAll(".featured-image-2").forEach((image) => {
            image.addEventListener("click", () => {
              const src = image.getAttribute("src");
              bigImage2.src = src;
            });
          });
        }

        if (bigImage3) {
          document.querySelectorAll(".featured-image-3").forEach((image) => {
            image.addEventListener("click", () => {
              const src = image.getAttribute("src");
              bigImage3.src = src;
            });
          });
        }
      });
    </script>
  </body>
</html>
