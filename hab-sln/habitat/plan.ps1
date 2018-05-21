$pkg_name="hab-sln"
$pkg_origin="asp-net-sample"
$pkg_version="1.0.0"
$pkg_maintainer="Murali Valluri <mvalluri.pub@gmail.com>"
$pkg_license=@("Apache-2.0")
$pkg_bin_dirs=@("bin")

function invoke-download { }
function invoke-verify { }

function Invoke-Build {
}

function Invoke-Install {
  Copy-Item $PLAN_CONTEXT/../* $pkg_prefix/www -recurse -force
}
