component {
    this.name = "AppName";
    this.applicationTimeout = createtimespan(0,2,0,0);
    this.customTagPaths = expandPath('/security-obfuscation-encryption/customTags');
    this.sessionManagement = true;
    this.sessionTimeout = createTimeSpan(0,0,30,0);

    public boolean function  onApplicationStart() {
        application.name=this.name;
        application.mode="";
        application.debugEmail="webapp@austintexas.gov";
        application.customTagPaths = this.customTagPaths;
        if (cgi.server_name contains "local"){
            application.mode="Local";
        }        
        else if (cgi.server_name eq "dev-apps.austintexas.gov"){
            application.mode="Development";
        }
        else if (cgi.server_name eq "test-apps.austintexas.gov"){
            application.mode="Test";
        }
        else {
            application.mode="Production";
        }
        return true;
    }

    public boolean function onRequestStart(required string targetPage) { 
        if (isdefined('url.appreload')){
            this.onApplicationStart();
        }
        
        if (listFind(arguments.targetPage, 'admin', '/' && NOT isUserLoggedIn() || !isUserInRole ("Administrator"))){
            location("/security-obfuscation-encryption/index.cfm?noaccess");
        }
        return true; 
    } 

 }