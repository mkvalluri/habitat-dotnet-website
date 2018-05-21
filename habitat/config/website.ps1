Configuration NewWebsite
{
    Import-DscResource -ModuleName PSDesiredStateConfiguration
    Import-DscResource -Module xWebAdministration

    Node 'localhost' {
        WindowsFeature ASP 
        { 
            Ensure = "Present"
            Name = "Web-Asp-Net45"
        }

        xWebAppPool {{cfg.app_pool}}
        {
            Name   = "{{cfg.app_pool}}"
            Ensure = "Present"
            State  = "Started"
        }
        
        xWebsite {{cfg.site_name}}
        {
            Ensure          = "Present"
            Name            = "{{cfg.site_name}}"
            State           = "Started"
            PhysicalPath    = Resolve-Path "{{pkg.svc_var_path}}"
            ApplicationPool = "{{cfg.app_pool}}"
            BindingInfo = @(
                MSFT_xWebBindingInformation
                {
                    Protocol = "http"
                    Port = {{cfg.port}}
                }
            )
        }
    }
}
