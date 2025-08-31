<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<%  String str = (String)session.getAttribute("udata");
		String ses = (String)session.getAttribute("udata");
	    if(str != null)
	    	str = str;
	    else
	    	str = "Guest";
	%>

  <nav>
   <a style="padding-left: 5px" href="/"><img src="/images/logo.png" width="113" height="43"></a>

    <div class="nav-links">
      <a href="/">Home</a>

      <div class="dropdown">
        <a href="">Categories</a>
        <div class="dropdown-content">
          <a href="/mobile">Mobile</a>
          <a href="/laptop">Laptop</a>
          <a href="/television">Television</a>
          <a href="/camera">Camera</a>
        </div>
      </div>

      <a href="/about">About</a>
      <a href="/contact">Contact Us</a>

      <div class="search-container">
        <input type="text" placeholder="Search products..." />
        <button>
        	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
            </svg>
        </button>
      </div>
    </div>

    <div class="user-section">
    
    <% if(str.equals("Guest")) { %>
    
      <span style="margin-right: 45px;">Hello: <%= str %></span>
      <a href="reg">Sign Up</a>
      <a href="log">Log In</a>
      
      <% } 
    		else { %>
      
      <span><a href="/profile/<%= ses %>">Hello: <%= str %></a></span>
      <a href="/cart?email=<%= ses %>" style="margin: 8px 0 0 2px">
		<svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" fill="currentColor" class="bi bi-cart3" viewBox="0 0 16 16">
  			<path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .49.598l-1 5a.5.5 0 0 1-.465.401l-9.397.472L4.415 11H13a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l.84 4.479 9.144-.459L13.89 4zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
		</svg>
	  </a>
      <a href="/logout">Log Out</a>
      
      <% } %>
      
    </div>
  </nav>
